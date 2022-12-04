import 'dart:convert';

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
}
