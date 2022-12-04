import 'package:flutter/material.dart';
import 'package:truetask_app/models/workspace.dart';
import 'package:truetask_app/services/fetchTask.dart';
import 'package:truetask_app/utils/routes.dart';
import 'package:truetask_app/viewmodels/getTasks.dart';
import 'package:truetask_app/viewmodels/getWorkspace.dart';

class WorkspacePage extends StatefulWidget {
  const WorkspacePage({super.key});

  @override
  State<WorkspacePage> createState() => _WorkspacePageState();
}

class _WorkspacePageState extends State<WorkspacePage> {
  ListTaskViewModel fetchTask = ListTaskViewModel();
  FetchTask workspaceTasks = FetchTask();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Workspace;
    print(args);
    return Scaffold(
      appBar: AppBar(
        title: Text(args.name!),
      ),
      body: Center(
        child: FutureBuilder<WorkspaceTasks?>(
          future: fetchTask.fetchTasks(args.id),
          builder: (context, snapshot) {
            print(snapshot.connectionState);
            if (snapshot.hasData) {
              final data = snapshot.data!.workspaceMain;
              return ListView.builder(
                itemCount: data!.tasks!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    // onTap: () => Navigator.of(context).pushNamed(workspacePage,
                    //     arguments: data.workspace!.id),
                    child: Card(
                      color: Colors.amber,
                      elevation: 2,
                      child: ListTile(
                        title: Text(data.tasks![index].title!),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
