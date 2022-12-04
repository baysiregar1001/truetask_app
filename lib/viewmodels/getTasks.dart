import 'package:truetask_app/models/task.dart';
import 'package:truetask_app/models/workspace.dart';
import 'package:truetask_app/services/fetchTask.dart';

class ListTaskViewModel {
  // Workspace? workspace;
  // List<Task>? tasks;
  WorkspaceTasks? workspaceTasks;

  Future<WorkspaceTasks?> fetchTasks(workspaceId) async {
    final result = await FetchTask().getAllTask(workspaceId);
    // workspace = result!.workspace;
    // tasks = result.tasks;
    workspaceTasks = WorkspaceTasks(result);
    return workspaceTasks;
  }
}

class WorkspaceTasks {
  final WorkspaceMain? workspaceMain;

  WorkspaceTasks(this.workspaceMain);
}
