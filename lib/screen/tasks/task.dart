import 'package:flutter/material.dart';
import 'package:truetask_app/models/workspace.dart';
import 'package:truetask_app/services/task_service.dart';
import 'package:truetask_app/utils/routes.dart';

class OurTask extends StatefulWidget {
  const OurTask({Key? key}) : super(key: key);

  @override
  State<OurTask> createState() => _OurTaskState();
}

class _OurTaskState extends State<OurTask> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final workspaceId = ModalRoute.of(context)!.settings.arguments as String;
    List<String> tabs = [
      "Projects",
      "Completed",
    ];

    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
            title: const Text(
              "Task",
              style: TextStyle(color: Colors.black),
            ),
            // leading: IconButton(
            //   onPressed: () {
            //     Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => (ProjectDetailsPage()),
            //       ),
            //     );
            //   },
            //   icon: Icon(
            //     Icons.arrow_back,
            //     color: Colors.black,
            //   ),
            // ),
            centerTitle: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(createTaskPage, arguments: workspaceId)
                      .then((value) => setState(() {}));
                },
                icon: Image.asset('assets/icon/add_icon.png'),
              ),
            ]),
        body: CategoryProject(
          tabs: tabs,
          workspaceId: workspaceId,
        ),
      ),
    );
  }
}

class CategoryProject extends StatelessWidget {
  const CategoryProject(
      {Key? key, required this.tabs, required this.workspaceId})
      : super(key: key);

  final List<String> tabs;
  final String workspaceId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          isScrollable: true,
          indicatorColor: Colors.black,
          tabs: tabs
              .map(
                (tab) => Tab(
                  icon: Text(
                    tab,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey),
                  ),
                ),
              )
              .toList(),
        ),
        Expanded(
          child: TabBarView(
            children: [
              FutureBuilder<WorkspaceMain?>(
                future: FetchTask().getAllTask(workspaceId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    final data = snapshot.data!.tasks!;
                    return GridView.builder(
                      padding: const EdgeInsets.all(16),
                      shrinkWrap: true,
                      itemCount: data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.of(context).pushNamed(
                              taskDetailPage,
                              arguments: data[index].id),
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                                top: 15,
                                bottom: 8,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data[index].title!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.date_range_outlined,
                                            color: Colors.blue,
                                            size: 20,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
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
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.details_outlined,
                                            color: Colors.orange,
                                            size: 20,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
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
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.done,
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
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
                                ],
                              ),
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
              const SizedBox(
                child: Center(
                  child: Text("No task"),
                ),
              )
            ],
          ),
        ),
      ],
    );

    // return Scaffold(
    //   appBar: AppBar(
    //       elevation: 0,
    //       title: Text(
    //         "Task",
    //         style: TextStyle(color: Colors.black),
    //       ),
    //       leading: IconButton(
    //         onPressed: () {
    //           Navigator.pushReplacement(
    //             context,
    //             MaterialPageRoute(
    //               builder: (context) => (ProjectDetailsPage()),
    //             ),
    //           );
    //         },
    //         icon: Icon(
    //           Icons.arrow_back,
    //           color: Colors.black,
    //         ),
    //       ),
    //       centerTitle: true,
    //       backgroundColor: Colors.white,
    //       actions: <Widget>[
    //         IconButton(
    //           onPressed: () {
    //             Navigator.pushReplacement(
    //               context,
    //               MaterialPageRoute(
    //                 builder: (context) => (CreateTask()),
    //               ),
    //             );
    //           },
    //           icon: Icon(
    //             Icons.add_box,
    //             color: Colors.blue,
    //           ),
    //         ),
    //       ]),

    // );
  }
}
