import 'dart:convert';

import 'package:truetask_app/models/workspace.dart';
import 'package:truetask_app/services/api_service.dart';

class FetchWorkspace {
  Future<Workspace?> getWorkspaceById({required String id}) async {
    String url = '/workspace/$id';
    final response = await ApiService().getData(url);
    if (response.statusCode == 200) {
      Map body = jsonDecode(response.body);
      // print(body);
      final workspaceResult =
          Workspace.fromJson(jsonDecode(body['data']['workspace']));
      return workspaceResult;
    } else {
      throw Exception('error fetching data');
    }
  }

  Future<List<Workspace?>> getAllWorkspace() async {
    List<Workspace?> listResult = [];
    String url = '/workspace';
    final response = await ApiService().getData(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'] as List;
      listResult = data.map((e) => Workspace.fromJson(e)).toList();
      // print(listResult);
      return listResult;
    } else {
      throw Exception('Error fetching data');
    }
  }
}
