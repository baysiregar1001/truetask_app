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
  final listTaskViewModel = ListTaskViewModel();

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
                  Navigator.of(context)
                      .pushNamed(projectTeamPage, arguments: workspace.id);
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
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Image.asset('assets/icon/ourproject.png'),
            title: Text(
              workspace.name!,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Project tasks",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          FutureBuilder<WorkspaceTasks?>(
            future: listTaskViewModel.fetchTasks(workspace.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                final data = snapshot.data!.workspaceMain!;

                return Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      children: [
                        ExpansionTile(
                          title: const Text(
                            "Open Tasks",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          children: [
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data.tasks!.length,
                              itemBuilder: (context, index) {
                                if (data.tasks![index].progress == "OPEN") {
                                  return _taskCard(data, index, context);
                                }
                                return const SizedBox();
                              },
                            )
                          ],
                        ),
                        ExpansionTile(
                          title: const Text(
                            "To Do Tasks",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          children: [
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data.tasks!.length,
                              itemBuilder: (context, index) {
                                if (data.tasks![index].progress == "TODO") {
                                  return _taskCard(data, index, context);
                                }
                                return const SizedBox();
                              },
                            )
                          ],
                        ),
                        ExpansionTile(
                          title: const Text(
                            "In Progress Tasks",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          children: [
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data.tasks!.length,
                              itemBuilder: (context, index) {
                                if (data.tasks![index].progress ==
                                    "IN PROGRESS") {
                                  return _taskCard(data, index, context);
                                }
                                return const SizedBox();
                              },
                            )
                          ],
                        ),
                        ExpansionTile(
                          title: const Text(
                            "Done Tasks",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          children: [
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data.tasks!.length,
                              itemBuilder: (context, index) {
                                if (data.tasks![index].progress == "DONE") {
                                  return _taskCard(data, index, context);
                                }
                                return const SizedBox();
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(child: Text("No task"));
              }
            },
          ),
        ],
      ),
    );
  }

  Color _buttonColor(progress) {
    Color color = Colors.grey;
    switch (progress) {
      case "OPEN":
        color = Colors.grey;
        break;
      case "TODO":
        color = Colors.blue;
        break;
      case "IN PROGRESS":
        color = Colors.green;
        break;
      case "DONE":
        color = Colors.amber;
        break;
      default:
    }
    return color;
  }

  Color _textButtonColor(progress) {
    if (progress == "DONE" || progress == "TODO" || progress == "IN PROGRESS") {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  Widget _taskCard(WorkspaceMain data, int index, BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              data.tasks![index].title!,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    top: 14,
                  ),
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.date_range,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "01/01/2021 - 01/02.2021",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
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
                                  Navigator.pop(context, "No");
                                },
                                child: const Text(
                                  "No",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  FetchTask()
                                      .deleteTask(
                                          taskId: data.tasks![index].id!)
                                      .then((value) => setState(() {}));
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  "Yes",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Text(
                        "Delete",
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(updateTaskPage,
                                arguments: data.tasks![index])
                            .then((value) => setState(() {}));
                      },
                      child: const Text(
                        "Update",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                _buttonColor(data.tasks![index].progress),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: () async {
                          String taskProgress = data.tasks![index].progress!;
                          switch (taskProgress) {
                            case "OPEN":
                              taskProgress = "TODO";
                              break;
                            case "TODO":
                              taskProgress = "IN PROGRESS";
                              break;
                            case "IN PROGRESS":
                              taskProgress = "DONE";
                              break;
                            case "DONE":
                              taskProgress = "OPEN";
                              break;
                            default:
                          }

                          final res = await FetchTask().updateTask(
                            taskId: data.tasks![index].id!,
                            taskTitle: data.tasks![index].title,
                            taskDesc: data.tasks![index].description,
                            tasStatus: data.tasks![index].status,
                            taskLabel: data.tasks![index].label,
                            taskMilestone: data.tasks![index].milestone,
                            taskProgress: taskProgress,
                          );
                          if (res.statusCode == 200) {
                            setState(() {});
                          }
                        },
                        child: Text(
                          data.tasks![index].progress!,
                          style: TextStyle(
                            fontSize: 12,
                            color:
                                _textButtonColor(data.tasks![index].progress),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pushNamed(
                          taskDetailPage,
                          arguments: data.tasks![index].id),
                      child: const Text(
                        "View Detail",
                        style: TextStyle(
                          color: Color.fromARGB(255, 73, 0, 217),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
