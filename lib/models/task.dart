import 'dart:convert';

List<Task> taskFromJson(String str) =>
    List<Task>.from(json.decode(str).map((x) => Task.fromJson(x)));

String taskToJson(Task data) => json.encode(data.toJson());

class Task {
  int? id, userId;
  String? workspaceId, title, description, status, progress;
  dynamic label, milestone;
  DateTime? createdAt, updatedAt;
  List<dynamic>? userTask;

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
        id: json["id"] as int,
        userId: json["user_id"] as int,
        workspaceId: json["workspace_id"] as String,
        title: json["title"] as String,
        description: json["description"] as String,
        status: json["status"] as String,
        progress: json["progress"] as String,
        label: json["label"],
        milestone: json["milestone"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userTask: List<dynamic>.from(json["user_task"].map((x) => x)),
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
