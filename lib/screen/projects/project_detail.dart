import 'package:flutter/material.dart';
import 'package:truetask_app/models/workspace.dart';
import 'package:truetask_app/utils/routes.dart';

class ProjectDetailPage extends StatefulWidget {
  const ProjectDetailPage({Key? key}) : super(key: key);

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
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
          padding: EdgeInsets.symmetric(horizontal: 1.0),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return _buildList(
                (index + 1).toString(),
              );
            },
          ),
        ));
  }

  Widget _buildList(String index) {
    return Card(
      child: ExpansionTile(
        backgroundColor: Colors.white,
        title: Text(
          "BrainStorm",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          Column(
            children: [
              ListTile(
                // leading: CircleAvatar(
                //   backgroundImage: AssetImage(""),
                // ),
                title: Text(
                  "Userflow",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                subtitle: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 14,
                      ),
                    ),
                    Row(
                      children: [
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
                      children: [
                        TextButton(
                          onPressed: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text("Delete Task"),
                                content: SizedBox(
                                  child: Text(
                                    "Are you sure to delete this task?",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                  height: 20,
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, "No");
                                    },
                                    child: Text(
                                      "No",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, "Yes");
                                    },
                                    child: Text(
                                      "Yes",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Text(
                            "Delete",
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, updateTaskPage)
                                .then((value) => setState(() {}));
                          },
                          child: Text(
                            "Update",
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        ),
                        SizedBox(
                          width: 45,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "In Progress",
                            // style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                              (states) {
                                return Colors.blue;
                              },
                            ),
                            foregroundColor: MaterialStateProperty.resolveWith(
                              (states) {
                                return Colors.black;
                              },
                            ),
                            shape: MaterialStateProperty.resolveWith(
                              (states) {
                                return RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                );
                              },
                            ),
                            padding: MaterialStateProperty.resolveWith(
                              (states) {
                                return EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: Icon(
                  Icons.info_outline,
                  color: Colors.white,
                ),
              ),
              ListTile(
                // leading: CircleAvatar(
                //   backgroundImage: AssetImage(""),
                // ),
                title: Text(
                  "Userflow",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                subtitle: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 14,
                      ),
                    ),
                    Row(
                      children: [
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
                      children: [
                        TextButton(
                          onPressed: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text("Delete Task"),
                                content: SizedBox(
                                  child: Text(
                                    "Are you sure to delete this task?",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                  height: 20,
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, "No");
                                    },
                                    child: Text(
                                      "No",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, "Yes");
                                    },
                                    child: Text(
                                      "Yes",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Text(
                            "Delete",
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Update",
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        ),
                        SizedBox(
                          width: 45,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "To Do",
                            // style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                              (states) {
                                return Colors.yellow;
                              },
                            ),
                            foregroundColor: MaterialStateProperty.resolveWith(
                              (states) {
                                return Colors.black;
                              },
                            ),
                            shape: MaterialStateProperty.resolveWith(
                              (states) {
                                return RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                );
                              },
                            ),
                            padding: MaterialStateProperty.resolveWith(
                              (states) {
                                return EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: Icon(
                  Icons.info_outline,
                  color: Colors.white,
                ),
              ),
              ListTile(
                // leading: CircleAvatar(
                //   backgroundImage: AssetImage(""),
                // ),
                title: Text(
                  "Userflow",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                subtitle: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 14,
                      ),
                    ),
                    Row(
                      children: [
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
                      children: [
                        TextButton(
                          onPressed: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text("Delete Task"),
                                content: SizedBox(
                                  child: Text(
                                    "Are you sure to delete this task?",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                  height: 20,
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, "No");
                                    },
                                    child: Text(
                                      "No",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Yes",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Text(
                            "Delete",
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Update",
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        ),
                        SizedBox(
                          width: 45,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Completed",
                            // style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                              (states) {
                                return Colors.green;
                              },
                            ),
                            foregroundColor: MaterialStateProperty.resolveWith(
                              (states) {
                                return Colors.black;
                              },
                            ),
                            shape: MaterialStateProperty.resolveWith(
                              (states) {
                                return RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                );
                              },
                            ),
                            padding: MaterialStateProperty.resolveWith(
                              (states) {
                                return EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: Icon(
                  Icons.info_outline,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
