import 'dart:convert';

import 'package:truetask_app/models/task.dart';
import 'package:truetask_app/models/user.dart';

class WorkspaceMain {
  WorkspaceMain({
    this.workspace,
    this.tasks,
  });

  Workspace? workspace;
  List<Task>? tasks;

  WorkspaceMain workspaceMainFromJson(String str) =>
      WorkspaceMain.fromJson(json.decode(str));

  String workspaceMainToJson(WorkspaceMain data) => json.encode(data.toJson());

  factory WorkspaceMain.fromJson(Map<String, dynamic> json) => WorkspaceMain(
        workspace: Workspace.fromJson(json["workspace"]),
        tasks: List<Task>.from(json["tasks"].map((x) => Task.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "workspace": workspace!.toJson(),
        "tasks": List<dynamic>.from(tasks!.map((x) => x.toJson())),
      };
}

class Workspace {
  String? id, name, description, visibility;
  int? ownerId;
  List<UserWorkspace>? userWorkspace;

  Workspace({
    this.id,
    this.name,
    this.description,
    this.ownerId,
    this.visibility,
    this.userWorkspace,
  });

  Workspace workspaceFromJson(String str) =>
      Workspace.fromJson(json.decode(str));

  String workspaceToJson(Workspace data) => json.encode(data.toJson());

  factory Workspace.fromJson(Map<String, dynamic> json) => Workspace(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        ownerId: json["owner_id"],
        visibility: json["visibility"],
        userWorkspace: List<UserWorkspace>.from(
            json["user_workspace"].map((x) => UserWorkspace.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "owner_id": ownerId,
        "visibility": visibility,
        "user_workspace":
            List<dynamic>.from(userWorkspace!.map((x) => x.toJson())),
      };
}
