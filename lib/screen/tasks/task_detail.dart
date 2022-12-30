import 'package:flutter/material.dart';
import 'package:truetask_app/models/task.dart';
import 'package:truetask_app/services/task_service.dart';
import 'package:truetask_app/utils/routes.dart';

class TaskDetail extends StatefulWidget {
  const TaskDetail({super.key});

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  final task = FetchTask();
  int right = 0;

  @override
  Widget build(BuildContext context) {
    final taskId = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: const Text(
          "Task Detail",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<Task?>(
          future: task.getTaskById(id: taskId),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            } else {
              final data = snapshot.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        const Text(
                          'Task of',
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.square,
                          color: Colors.green,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          data.title!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    data.description!,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Card(
                    child: SizedBox(
                      height: 280,
                      width: 350,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Status',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                SizedBox(
                                  width: 250,
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            _buttonColor(data.progress)),
                                    onPressed: () async {
                                      String taskProgress = data.progress!;
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
                                        taskId: data.id!,
                                        taskTitle: data.title,
                                        taskDesc: data.description,
                                        tasStatus: data.status,
                                        taskLabel: data.label,
                                        taskMilestone: data.milestone,
                                        taskProgress: taskProgress,
                                      );
                                      if (res.statusCode == 200) {
                                        setState(() {});
                                      }
                                    },
                                    child: Text(data.progress!),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Priority',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      elevation: 0),
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.flag_sharp,
                                    color: Colors.red,
                                  ),
                                  label: const Text(
                                    'Urgent',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Assignees',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                const Spacer(),
                                SizedBox(
                                  height: 50,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: data.userTask!.length,
                                    itemBuilder: (context, index) {
                                      if (index < 5) {
                                        return Align(
                                          widthFactor: 0.75,
                                          child: CircleAvatar(
                                            backgroundColor: index.isOdd
                                                ? Colors.blue
                                                : Colors.amber,
                                            child: Text(
                                              data.userTask![index].userId
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        );
                                      } else if (index == 5) {
                                        return Align(
                                          widthFactor: 0.75,
                                          child: CircleAvatar(
                                            child: Text(
                                                "+${data.userTask!.length - 5}"),
                                          ),
                                        );
                                      } else {
                                        return const SizedBox();
                                      }
                                    },
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.grey[300],
                                  child: IconButton(
                                    onPressed: () => Navigator.of(context)
                                        .pushNamed(taskAsigneePage,
                                            arguments: data)
                                        .then((value) => setState(() {})),
                                    icon: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Dateline',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      elevation: 0),
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.calendar_month_rounded,
                                    color: Colors.black54,
                                  ),
                                  label: const Text(
                                    '19-12-2022',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    child: SizedBox(
                      height: 100,
                      width: 350,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                Text(
                                  'Attachment',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 250,
                              height: 40,
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.add),
                                label: const Text('add an attachment'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
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
}
