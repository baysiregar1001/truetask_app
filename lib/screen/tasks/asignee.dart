import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:truetask_app/models/task.dart';
import 'package:truetask_app/models/workspace.dart';
import 'package:truetask_app/services/task_service.dart';
import 'package:truetask_app/services/workspace_service.dart';

class TaskAsignee extends StatefulWidget {
  const TaskAsignee({Key? key}) : super(key: key);

  @override
  State<TaskAsignee> createState() => _TaskAsigneeState();
}

class _TaskAsigneeState extends State<TaskAsignee> {
  final getUserWorkspace = FetchWorkspace();
  final getUserTask = FetchTask();

  @override
  Widget build(BuildContext context) {
    final taskDetail = ModalRoute.of(context)!.settings.arguments as Task;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Task Assignees",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "User Workspace",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            FutureBuilder<Workspace?>(
              future: getUserWorkspace.getWorkspaceById(
                  id: taskDetail.workspaceId!),
              builder: (context, snapshot) {
                // print(snapshot.data);
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  final data = snapshot.data!.userWorkspace;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(data[index].userId.toString()),
                        ),
                        title: Text(
                          data[index].username!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Email: ${data[index].email}",
                          style: const TextStyle(color: Colors.grey),
                        ),
                        trailing: IconButton(
                            tooltip: 'Assign this user',
                            onPressed: () =>
                                _assign(taskDetail.id, data[index].userId),
                            icon: const Icon(Icons.post_add)),
                      );
                    },
                  );
                } else {
                  return const Center(
                      child: Text("All User has been assigned to this task"));
                }
              },
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Assigned User",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            FutureBuilder<Task?>(
              future: getUserTask.getTaskById(id: taskDetail.id!),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.data!.userTask!.isNotEmpty) {
                  final data = snapshot.data!.userTask;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              index.isOdd ? Colors.blue : Colors.amber,
                          child: Text(
                            data[index].userId.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(
                          data[index].username!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Email: ${data[index].email}",
                          style: const TextStyle(color: Colors.grey),
                        ),
                        trailing: IconButton(
                          tooltip: 'Remove this user',
                          onPressed: () =>
                              _delete(data[index].taskId!, data[index].userId!),
                          icon: const Icon(Icons.delete),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text("No user assigned"));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  _assign(taskId, userId) async {
    final res = await FetchTask().assignUser(taskId, userId);
    final body = jsonDecode(res.body);
    if (res.statusCode == 200) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(body['info'])));
      setState(() {});
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(body['info'])));
    }
  }

  _delete(taskId, userId) async {
    final res = await FetchTask().removeUserAssign(taskId, userId);
    final body = jsonDecode(res.body);
    if (res.statusCode == 200) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(body['info'])));
      setState(() {});
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(body['info'])));
    }
  }
}
