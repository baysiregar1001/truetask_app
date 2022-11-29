import 'dart:convert';

import 'package:truetask_app/models/user.dart';

List<Task> taskFromJson(String str) =>
    List<Task>.from(json.decode(str).map((x) => Task.fromJson(x)));

String taskToJson(Task data) => json.encode(data.toJson());

class Task {
  int? id, userId;
  String? workspaceId, title, description, status, progress;
  dynamic label, milestone;
  DateTime? createdAt, updatedAt;
  List<UserTask>? userTask;

  Task({
    this.id,
    this.userId,
    this.workspaceId,
    this.title,
    this.description,
    this.status,
    this.progress,
    this.label,
    this.milestone,
    this.createdAt,
    this.updatedAt,
    this.userTask,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        userId: json["user_id"],
        workspaceId: json["workspace_id"],
        title: json["title"],
        description: json["description"],
        status: json["status"],
        progress: json["progress"],
        label: json["label"],
        milestone: json["milestone"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userTask: List<UserTask>.from(
            json["user_task"].map((x) => UserTask.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "workspace_id": workspaceId,
        "title": title,
        "description": description,
        "status": status,
        "progress": progress,
        "label": label,
        "milestone": milestone,
        "created_at": createdAt.toString(),
        "updated_at": updatedAt.toString(),
        "user_task": List<dynamic>.from(userTask!.map((x) => x)),
      };
}
