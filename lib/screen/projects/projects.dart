import 'package:flutter/material.dart';
import 'package:truetask_app/services/workspace_service.dart';
import 'package:truetask_app/utils/routes.dart';
import 'package:truetask_app/viewmodels/get_workspace.dart';
import 'package:truetask_app/widgets/drawer_widget.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
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
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            "Projects",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
        ),
        body: CategoryProject(
          tabs: tabs,
        ),
        drawer: const DrawerWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.of(context)
                .pushNamed(addProjectPage)
                .then((value) => setState(() {}));
          },
          label: const Text("Add Project"),
          icon: const Icon(
            Icons.add_box,
          ),
        ),
      ),
    );
  }
}

class CategoryProject extends StatefulWidget {
  const CategoryProject({
    Key? key,
    required this.tabs,
  }) : super(key: key);

  final List<String> tabs;

  @override
  State<CategoryProject> createState() => _CategoryProjectState();
}

class _CategoryProjectState extends State<CategoryProject> {
  // List <String> projects = [
  final listWorkspaceViewModel = ListWorkspaceViewModel();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            indicatorColor: Colors.black,
            tabs: widget.tabs
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
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Search",
              fillColor: Colors.grey.shade200,
              filled: true,
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                Icons.tune,
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: TabBarView(
              children: [
                Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        FutureBuilder<List<WorkspaceViewModel>?>(
                          future: listWorkspaceViewModel.fetchWorkspaces(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState !=
                                ConnectionState.done) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (snapshot.hasData) {
                              final data = snapshot.data!;
                              return ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: const EdgeInsets.only(
                                          top: 30,
                                          right: 30,
                                          left: 30,
                                          bottom: 15),
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 194, 227, 243),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data[index].workspace!.name!,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          const Text(
                                            "Date: 12/10/2022 - 30/12/2022",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            child: LinearProgressIndicator(
                                              minHeight: 7,
                                              valueColor:
                                                  const AlwaysStoppedAnimation<
                                                      Color>(
                                                Color.fromARGB(255, 73, 0, 217),
                                              ),
                                              value: 6 / 10,
                                              backgroundColor:
                                                  Colors.grey.shade400,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          const Text(
                                            "6/10 Task Completed",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  showDialog<String>(
                                                    context: context,
                                                    builder: (BuildContext
                                                            context) =>
                                                        AlertDialog(
                                                      title: const Text(
                                                          "Delete Project"),
                                                      content: const SizedBox(
                                                        height: 20,
                                                        child: Text(
                                                          "Are you sure to delete this project?",
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context, "No");
                                                          },
                                                          child: const Text(
                                                            "No",
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red),
                                                          ),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            FetchWorkspace()
                                                                .deleteWorkspace(
                                                                    workspaceId:
                                                                        data[index]
                                                                            .workspace!
                                                                            .id!)
                                                                .then((value) =>
                                                                    setState(
                                                                        () {}));
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Text(
                                                            "Yes",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                                child: const Text(
                                                  "Delete",
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 12),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                          updateProjectPage,
                                                          arguments: data[index]
                                                              .workspace)
                                                      .then((value) =>
                                                          setState(() {}));
                                                },
                                                child: const Text(
                                                  "Update",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              const Text(
                                                "View Detail",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 73, 0, 217),
                                                  fontSize: 12,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                          projectDetailPage,
                                                          arguments: data[index]
                                                              .workspace);
                                                  // Navigator.of(context).pushNamed(
                                                  //     projectDetailPage,
                                                  //     arguments: data[index].workspace);
                                                },
                                                icon: const Icon(
                                                  Icons.arrow_forward,
                                                  color: Color.fromARGB(
                                                      255, 73, 0, 217),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              return const Text("No project");
                            }
                          },
                        ),
                        const SizedBox(height: 52)
                      ],
                    ),
                  ),
                ),
                Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: const [
                        Text("No project"),
                        SizedBox(height: 52)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          // ListProjectCard(),
        ],
      ),
    );
  }
}

// class _ProjectList extends StatelessWidget {
//   const _ProjectList({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {

//     return SizedBox(
//       height: MediaQuery.of(context).size.height * 0.25,

//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text("Projects",
//           style: Theme.of(context).textTheme.headline4!.copyWith(
//             color: Colors.black,
//             fontWeight: FontWeight.w900,
//           ),
//           ),
//           SizedBox(height: 5,),
//           Text("Projects from all over the category",
//           style: Theme.of(context).textTheme.bodySmall,
//           ),
//           SizedBox(height: 20,),
//           TextFormField(
//             decoration: InputDecoration(
//               hintText: "Search",
//               fillColor: Colors.grey.shade200,
//               filled: true,
//               prefixIcon: Icon(
//                 Icons.search,
//                 color: Colors.grey,
//                 ),
//               suffixIcon: Icon(
//                 Icons.tune,
//                 color: Colors.grey,
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                   borderSide: BorderSide.none,
//                 ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
