import 'dart:convert';

import 'package:truetask_app/models/user.dart';

Workspace workspaceFromJson(String str) => Workspace.fromJson(json.decode(str));

String workspaceToJson(Workspace data) => json.encode(data.toJson());

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
