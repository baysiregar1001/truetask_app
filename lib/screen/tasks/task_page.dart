import "package:flutter/material.dart";
import 'package:truetask_app/models/workspace.dart';
import 'package:truetask_app/utils/routes.dart';
import 'package:truetask_app/viewmodels/get_tasks.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final listTaskViewModel = ListTaskViewModel();

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
    final workspaceId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Task",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: <Widget>[
          PopupMenuButton(
            icon: Image.asset('assets/icon/add_icon.png'),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context)
                          .pushNamed(createTaskPage, arguments: workspaceId),
                      icon: const Icon(
                        Icons.task,
                        color: Colors.black,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 10.0)),
                    const Text("Create task"),
                  ],
                ),
                // value: 1,
              ),
              PopupMenuItem(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => (const TaskPage()),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 10.0)),
                    const Text("Create project"),
                  ],
                ),
                // value: 2,
              ),
              PopupMenuItem(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.people_alt,
                        color: Colors.black,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 10.0)),
                    const Text("Create team"),
                  ],
                ),
                // value: 3,
              ),
              PopupMenuItem(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.black,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 10.0)),
                    const Text("Create meeting"),
                  ],
                ),
                // value: 4,
              ),
            ],
          ),
        ],
        elevation: 0,
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
                  Text("Projects", style: TextStyle(fontSize: 16)),
                  Text("Completed", style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  FutureBuilder<WorkspaceTasks?>(
                    future: listTaskViewModel.fetchTasks(workspaceId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasData) {
                        final data = snapshot.data!.workspaceMain!;
                        return GridView.builder(
                          itemCount: data.tasks!.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, crossAxisSpacing: 10),
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 15,
                                        bottom: 8,
                                      ),
                                      child: Text(
                                        data.tasks![index].title!,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 8,
                                        bottom: 8,
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.date_range_outlined,
                                                color: Colors.blue,
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Deadline",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.blue),
                                                  ),
                                                  Text(
                                                    "20/01/2022",
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 4)),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.details_outlined,
                                                color: Colors.orange,
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Priority",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.orange),
                                                  ),
                                                  Text(
                                                    "High",
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 4)),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.done,
                                                color: Colors.black,
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Done",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(child: Text("No task"));
                      }
                    },
                  ),
                  const SizedBox()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
