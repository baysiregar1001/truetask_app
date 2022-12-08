import "package:flutter/material.dart";
import 'package:truetask_app/utils/routes.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage>
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
                          .pushReplacementNamed(projectDetailPage),
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
                children: const [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
