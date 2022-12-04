import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:truetask_app/models/task.dart';
import 'package:truetask_app/models/workspace.dart';
import 'package:truetask_app/screen/login_page.dart';
import 'package:truetask_app/screen/workspaceTask_page.dart';
import 'package:truetask_app/services/fetchWorkspace.dart';
import 'package:truetask_app/utils/routes.dart';
import 'package:truetask_app/viewmodels/authUser.dart';
import 'package:truetask_app/services/fetchTask.dart';
import 'package:truetask_app/viewmodels/getWorkspace.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  String? userToken;
  final _user = AuthUser();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _checkToken();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  _checkToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    print(token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text(
          "Dashboard",
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _showCreate(),
            icon: const Icon(
              Icons.add_box_rounded,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('test'),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Dashboard"),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(dashboardPage);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                _user.logout();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ));
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: TextField(
                readOnly: true,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(15),
                    width: 18,
                    child: const Icon(Icons.search),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.tune),
                  ),
                ),
                onTap: null,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 45,
              width: 250,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                  color: Colors.blue,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Text("Overview", style: TextStyle(fontSize: 16)),
                  Text("Calendar", style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [const OverviewTab(), const CalendarTab()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showCreate() {
    final formKey = GlobalKey<FormState>();
    String? workspaceName, workspaceDesc;
    showDialog(
      context: context,
      builder: (context) {
        return Column(
          children: [
            Card(
              elevation: 4.0,
              color: Colors.white,
              margin: const EdgeInsets.only(top: 86),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "create workspace",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 18),
                      TextFormField(
                        cursorColor: Colors.blue,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: "nama workspace",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'wajib disi';
                          }
                          workspaceName = value;
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        cursorColor: Colors.blue,
                        keyboardType: TextInputType.text,
                        // obscureText: _secureText,
                        decoration: InputDecoration(
                          hintText: "description",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'wajib diisi';
                          }
                          workspaceDesc = value;
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        child: Text(
                          "create",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            final createdWorkspace = await FetchWorkspace()
                                .createWorkspace(
                                    name: workspaceName!,
                                    description: workspaceDesc!);
                            if (mounted) {
                              Navigator.pop(context);
                              Navigator.of(context).pushReplacementNamed(
                                  workspacePage,
                                  arguments: createdWorkspace);
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class CalendarTab extends StatefulWidget {
  const CalendarTab({super.key});

  @override
  State<CalendarTab> createState() => _CalendarTabState();
}

class _CalendarTabState extends State<CalendarTab>
    with AutomaticKeepAliveClientMixin<CalendarTab> {
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: TableCalendar(
              focusedDay: _focusedDay,
              firstDay: DateTime.utc(2000),
              lastDay: DateTime.utc(2035),
              availableCalendarFormats: const {CalendarFormat.month: 'Month'},
              headerStyle: const HeaderStyle(titleCentered: true),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: ClipOval(
              child: Container(
                color: Colors.blue,
                width: 48,
                height: 48,
                child: const Icon(
                  Icons.calendar_month,
                  color: Colors.white,
                ),
              ),
            ),
            title: Text(
              _selectedDay == null
                  ? "No day Selected"
                  : "${_selectedDay!.day} ${DateFormat.MMMM().format(_selectedDay!)} ${_selectedDay!.year}",
            ),
          ),
        ],
      ),
    );
  }
}

class OverviewTab extends StatefulWidget {
  const OverviewTab({super.key});

  @override
  State<OverviewTab> createState() => _OverviewTabState();
}

class _OverviewTabState extends State<OverviewTab>
    with AutomaticKeepAliveClientMixin<OverviewTab> {
  final _myData = ListWorkspaceViewModel();
  final apiWorkspace = FetchWorkspace();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _myData.fetchWorkspaces();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: FutureBuilder<List<WorkspaceViewModel>?>(
        future: _myData.fetchWorkspaces(),
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (snapshot.connectionState != ConnectionState.done) {
            print(snapshot.connectionState);
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(workspacePage,
                      arguments: data[index].workspace),
                  child: Card(
                    color: Colors.amber,
                    elevation: 2,
                    child: ListTile(
                      title: Text(data[index].workspace!.name!),
                      subtitle: Text(data[index].workspace!.description!),
                      trailing: IconButton(
                        onPressed: () {
                          apiWorkspace
                              .deleteWorkspace(
                                  workspaceId: data[index].workspace!.id!)
                              .then((value) => setState(() {}));
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
