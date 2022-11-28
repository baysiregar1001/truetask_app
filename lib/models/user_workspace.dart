import 'dart:convert';

UserWorkspace userWorkspaceFromJson(String str) =>
    UserWorkspace.fromJson(json.decode(str));

String userWorkspaceToJson(UserWorkspace data) => json.encode(data.toJson());

class UserWorkspace {
  int? id, userId;
  String? workspaceId, role, email, username;
  DateTime? createdAt, updatedAt, deletedAt;

  UserWorkspace({
    this.id,
    this.workspaceId,
    this.userId,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.email,
    this.username,
  });

  factory UserWorkspace.fromJson(Map<String, dynamic> json) => UserWorkspace(
        id: json["id"],
        workspaceId: json["workspace_id"],
        userId: json["user_id"],
        role: json["role"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        email: json["email"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "workspace_id": workspaceId,
        "user_id": userId,
        "role": role,
        "created_at": createdAt.toString(),
        "updated_at": updatedAt.toString(),
        "deleted_at": deletedAt,
        "email": email,
        "username": username,
      };
}
