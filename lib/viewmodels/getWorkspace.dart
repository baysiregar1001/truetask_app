import 'package:truetask_app/models/workspace.dart';
import 'package:truetask_app/services/fetchWorkspace.dart';

class ListWorkspaceViewModel {
  List<WorkspaceViewModel>? workspaces;

  Future<List<WorkspaceViewModel>?> fetchWorkspaces() async {
    final result = await FetchWorkspace().getAllWorkspace();
    workspaces = result.map((e) => WorkspaceViewModel(e)).toList();
    return workspaces;
  }
}

class WorkspaceViewModel {
  final Workspace? workspace;

  WorkspaceViewModel(this.workspace);
}
