import 'package:flutter/material.dart';
import 'package:truetask_app/utils/routes.dart';

class OurTask extends StatefulWidget {
  const OurTask({Key? key}) : super(key: key);

  @override
  State<OurTask> createState() => _OurTaskState();
}

class _OurTaskState extends State<OurTask> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
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
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            title: Text(
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
                  Navigator.of(context).pushNamed(createTaskPage);
                },
                icon: Image.asset('assets/icon/add_icon.png'),
              ),
            ]),
        body: ListView(
          padding: EdgeInsets.all(20.0),
          children: [
            CategoryProject(
              tabs: tabs,
            ),
            // _ProjectList(),
          ],
        ),
      ),
    );
  }
}

class CategoryProject extends StatelessWidget {
  const CategoryProject({
    Key? key,
    required this.tabs,
  }) : super(key: key);

  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              indicatorColor: Colors.black,
              tabs: tabs
                  .map(
                    (tab) => Tab(
                      icon: Text(
                        tab,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.grey),
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(
              height: 18,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: TabBarView(
                children: tabs
                    .map(
                      (tab) => Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: GridView.builder(
                          itemCount: 6,
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
                                        "Userflow",
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
                        ),
                      ),
                      // Expanded(
                      //   child: Column(
                      //     children: [

                      //     ],
                      //   ),
                      // ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
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
