import 'package:flutter/material.dart';
import 'package:truetask_app/screen/dashboard/calender_tab.dart';
import 'package:truetask_app/screen/dashboard/overview_tab.dart';
import 'package:truetask_app/utils/routes.dart';
import 'package:truetask_app/widgets/drawer_widget.dart';
import 'package:truetask_app/widgets/search_bar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          title: const Text(
            "Dashboard",
            style: TextStyle(
                fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            PopupMenuButton(
              shape: const BeveledRectangleBorder(),
              icon: Image.asset('assets/icon/add_icon.png'),
              onSelected: (value) {
                switch (value) {
                  case 0:
                    Navigator.of(context).pushNamed(addProjectPage);
                    break;
                  case 1:
                    Navigator.of(context).pushNamed(projectPage);
                    break;
                  default:
                }
              },
              itemBuilder: (_) => [
                PopupMenuItem(
                  value: 0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.workspaces_outline,
                        color: Colors.black87,
                      ),
                      SizedBox(width: 10),
                      Text("Create project",
                          style: TextStyle(color: Colors.black87)),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.task_outlined,
                        color: Colors.black87,
                      ),
                      SizedBox(width: 10),
                      Text("Create task",
                          style: TextStyle(color: Colors.black87)),
                    ],
                  ),
                ),
              ],
            ),
          ]),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchBar(),
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
                children: const [OverviewTab(), CalendarTab()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
