import 'dart:convert';

class User {
  String? firstname, lastname, username, email, phoneNumber;

  User({
    this.firstname,
    this.lastname,
    this.username,
    this.email,
    this.phoneNumber,
  });

  User userFromJson(String str) => User.fromJson(json.decode(str));

  String userToJson(User data) => json.encode(data.toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstname: json["firstname"],
        lastname: json["lastname"],
        username: json["username"],
        email: json["email"],
        phoneNumber: json["phone_number"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "username": username,
        "email": email,
        "phone_number": phoneNumber,
      };
}

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

  UserWorkspace userWorkspaceFromJson(String str) =>
      UserWorkspace.fromJson(json.decode(str));

  String userWorkspaceToJson(UserWorkspace data) => json.encode(data.toJson());

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

class UserTask {
  int? id, userId, taskId;
  String? email, username;

  UserTask({
    this.id,
    this.userId,
    this.taskId,
    this.email,
    this.username,
  });

  UserTask userTaskFromJson(String str) => UserTask.fromJson(json.decode(str));

  String userTasktoJson(UserTask data) => json.encode(data.toJson());

  factory UserTask.fromJson(Map<String, dynamic> json) => UserTask(
        id: json["id"],
        userId: json["user_id"],
        taskId: json["task_id"],
        email: json["email"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "task_id": taskId,
        "email": email,
        "username": username,
      };
}
