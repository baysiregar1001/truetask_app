import 'package:flutter/material.dart';
import 'package:truetask_app/models/workspace.dart';
import 'package:truetask_app/services/task_service.dart';
import 'package:truetask_app/utils/routes.dart';
import 'package:truetask_app/viewmodels/get_tasks.dart';

class ProjectDetailsPage extends StatefulWidget {
  const ProjectDetailsPage({Key? key}) : super(key: key);

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  // var _value;

  final listTaskViewModel = ListTaskViewModel();

  List<String> items = ["Item 1", "Item 2", "Item 3"];
  String? selectedItem = "Item 1";
  @override
  Widget build(BuildContext context) {
    final workspace = ModalRoute.of(context)!.settings.arguments as Workspace;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Project detail",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: <Widget>[
          PopupMenuButton(
            shape: const BeveledRectangleBorder(),
            icon: Image.asset('assets/icon/add_icon.png'),
            onSelected: (value) {
              switch (value) {
                case 0:
                  Navigator.of(context)
                      .pushNamed(createTaskPage, arguments: workspace.id)
                      .then((value) => setState(() {}));
                  break;
                case 1:
                  Navigator.of(context).pushNamed(projectTeamPage);
                  break;
                case 2:
                  Navigator.of(context).pushNamed(meetingPage);
                  break;
                default:
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Row(
                  children: const [
                    Icon(
                      Icons.task,
                      color: Colors.black,
                    ),
                    Padding(padding: EdgeInsets.only(left: 10.0)),
                    Text("Create task"),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: const [
                    Icon(
                      Icons.people_alt,
                      color: Colors.black,
                    ),
                    Padding(padding: EdgeInsets.only(left: 10.0)),
                    Text("Create team"),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Row(
                  children: const [
                    Icon(
                      Icons.settings,
                      color: Colors.black,
                    ),
                    Padding(padding: EdgeInsets.only(left: 10.0)),
                    Text("Create meeting"),
                  ],
                ),
              ),
            ],
          ),
        ],
        elevation: 0,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pushReplacement(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => (Projects()),
        //       ),
        //     );
        //   },
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     color: Colors.black,
        //   ),
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Image.asset('assets/icon/ourproject.png'),
              title: Text(
                workspace.name!,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Project tasks",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: FutureBuilder<WorkspaceTasks?>(
                future: listTaskViewModel.fetchTasks(workspace.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    final data = snapshot.data!.workspaceMain!;
                    return ListView.builder(
                      itemCount: data.tasks!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Colors.white,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            // height: 140,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: Text(
                                        data.tasks![index].title!,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.fade,
                                      ),
                                    ),
                                    Stack(
                                      clipBehavior: Clip.none,
                                      alignment: AlignmentDirectional.centerEnd,
                                      children: const [
                                        Positioned(
                                          right: 45,
                                          child: CircleAvatar(
                                            radius: 16,
                                            backgroundImage: AssetImage(
                                              'assets/image/Avatar1.png',
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: 30,
                                          child: CircleAvatar(
                                            radius: 16,
                                            backgroundImage: AssetImage(
                                              'assets/image/Avatar2.png',
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: 15,
                                          child: CircleAvatar(
                                            radius: 16,
                                            backgroundImage: AssetImage(
                                              'assets/image/Avatar3.png',
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          child: CircleAvatar(
                                            backgroundColor: Colors.amber,
                                            radius: 16,
                                            child: Text(
                                              "+4",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Icon(
                                      Icons.date_range,
                                      size: 16,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(width: 4),
                                    Text("12-11-2022"),
                                    SizedBox(width: 8),
                                    Expanded(
                                        child: Divider(
                                            thickness: 1, color: Colors.grey)),
                                    SizedBox(width: 8),
                                    Icon(
                                      Icons.date_range,
                                      size: 16,
                                      color: Colors.blue,
                                    ),
                                    Text("12-11-2022",
                                        style: TextStyle(color: Colors.blue))
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: const Text("Delete Task"),
                                            content: const SizedBox(
                                              height: 20,
                                              child: Text(
                                                "Are you sure to delete this task?",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  "No",
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  FetchTask()
                                                      .deleteTask(
                                                          taskId: data
                                                              .tasks![index]
                                                              .id!)
                                                      .then((value) =>
                                                          setState(() {}));
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  "Yes",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        "Delete",
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 12),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Update",
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 12),
                                      ),
                                    ),
                                    const Spacer(),
                                    const Text(
                                      "View Detail",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 73, 0, 217),
                                        fontSize: 12,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.arrow_forward,
                                        color: Color.fromARGB(255, 73, 0, 217),
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
                    return const Center(child: Text("No task"));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
