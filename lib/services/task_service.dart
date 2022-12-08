import 'dart:convert';

import 'package:http/http.dart';
import 'package:truetask_app/models/task.dart';
import 'package:truetask_app/models/workspace.dart';
import 'package:truetask_app/services/api_service.dart';

class FetchTask {
  Future<Task?> getTaskById({required int id}) async {
    String url = '/workspace/task/$id';
    final response = await ApiService().getData(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body)['data'];
      // print(body);
      final task = Task.fromJson(data);
      return task;
    } else {
      throw Exception('error fetching data');
    }
  }

  Future<WorkspaceMain?> getAllTask(workspaceId) async {
    String url = '/workspace/$workspaceId';
    final response = await ApiService().getData(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body)['data'];
      final result = WorkspaceMain.fromJson(data);
      // print(result);
      return result;
    } else {
      throw Exception('Error fetching data');
    }
  }

  Future<Response> createTask({
    required String workspaceId,
    required String title,
    required String description,
    required String status,
  }) async {
    final data = {
      "workspace_id": workspaceId,
      "title": title,
      "description": description,
      "status": status,
    };

    const url = '/workspace/task';

    final response = await ApiService().postData(data, url);
    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(body['info']);
      return response;
    } else {
      throw Exception(body['info']);
    }
  }

  Future<Response> updateTask({
    required int taskId,
    String? taskTitle,
    String? taskDesc,
    String? tasStatus,
    String? taskLabel,
    String? taskMilestone,
    String? taskProgress,
  }) async {
    String url = '/workspace/task/$taskId';

    final data = {
      "title": taskTitle,
      "description": taskDesc,
      "status": tasStatus,
      "label": taskLabel,
      "milestone": taskMilestone,
      "progress": taskProgress,
    };

    final response = await ApiService().updatetData(data, url);
    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(body['info']);
      return response;
    } else {
      throw Exception(body['info']);
    }
  }

  Future<Response> deleteTask({required int taskId}) async {
    String url = '/workspace/task/$taskId';

    final response = await ApiService().deleteData(url);

    final body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(body['info']);
      return response;
    } else {
      throw Exception(body['info']);
    }
  }
}
