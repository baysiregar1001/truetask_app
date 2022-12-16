import 'package:truetask_app/models/workspace.dart';
import 'package:truetask_app/services/workspace_service.dart';

class ListSearchWorkspaceViewModel {
  List<SearchWorkspaceViewModel>? workspaces;

  Future<List<SearchWorkspaceViewModel>?> fetchWorkspacesQuery(
      String query) async {
    final result = await FetchWorkspace().getAllWorkspace();
    workspaces = result.map((e) => SearchWorkspaceViewModel(e)).toList();

    if (query.isNotEmpty) {
      workspaces = workspaces!
          .where((element) => element.workspace!.name!
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    }
    return workspaces;
  }
}

class SearchWorkspaceViewModel {
  final Workspace? workspace;

  SearchWorkspaceViewModel(this.workspace);
}
