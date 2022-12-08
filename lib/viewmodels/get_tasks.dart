import 'package:truetask_app/models/workspace.dart';
import 'package:truetask_app/services/task_service.dart';

class ListTaskViewModel {
  WorkspaceTasks? workspaceTasks;

  Future<WorkspaceTasks?> fetchTasks(workspaceId) async {
    final result = await FetchTask().getAllTask(workspaceId);
    workspaceTasks = WorkspaceTasks(result);
    return workspaceTasks;
  }
}

class WorkspaceTasks {
  final WorkspaceMain? workspaceMain;

  WorkspaceTasks(this.workspaceMain);
}
