import 'dart:convert';

import 'package:truetask_app/models/task.dart';
import 'package:truetask_app/services/api_service.dart';

class FetchTask {
  Future<Task?> getTask({required int id}) async {
    String url = '/workspace/task/$id';
    final response = await ApiService().getData(url);
    if (response.statusCode == 200) {
      Map body = jsonDecode(response.body);
      // print(body);
      final task = Task.fromJson(jsonDecode(jsonEncode(body['data'])));
      return task;
    } else {
      throw Exception('error fetching data');
    }
  }
}
