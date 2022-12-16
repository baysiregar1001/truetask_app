import 'dart:convert';

import 'package:http/http.dart';
import 'package:truetask_app/models/workspace.dart';
import 'package:truetask_app/services/api_service.dart';

class FetchWorkspace {
  Future<Workspace?> getWorkspaceById({required String id}) async {
    String url = '/workspace/$id';
    final response = await ApiService().getData(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      // print(body);
      final result = Workspace.fromJson(body['data']['workspace']);
      return result;
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

  Future<Response> createWorkspace({
    required String name,
    required String description,
  }) async {
    const url = '/workspace';
    final data = {"name": name, "description": description};

    final response = await ApiService().postData(data, url);

    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(body['info']);
      return response;
    } else {
      throw Exception(body['info']);
    }
  }

  Future<Response> updateWorkspace({
    required String workspaceId,
    String? workspaceName,
    String? workspaceDesc,
    String? visibility,
  }) async {
    String url = '/workspace/$workspaceId';

    final data = {
      "name": workspaceName,
      "description": workspaceDesc,
      "visibility": visibility
    };

    final response = await ApiService().updateData(data, url);
    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(body['info']);
      return response;
    } else {
      throw Exception(body['info']);
    }
  }

  Future<Response> deleteWorkspace({required String workspaceId}) async {
    String url = '/workspace/$workspaceId';

    final response = await ApiService().deleteData(null, url);

    final body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(body['info']);
      return response;
    } else {
      throw Exception(body['info']);
    }
  }

  Future<Response> inviteTeam(String workspaceId, String email) async {
    String url = '/workspace/invite/$workspaceId';

    final data = {"email": email};

    final response = await ApiService().postData(data, url);

    return response;
  }

  Future<Response> removeTeam(
      {required String workspaceId, required String email}) async {
    String url = '/workspace/remove/$workspaceId';

    final data = {"email": email};

    final response = await ApiService().deleteData(data, url);

    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(body['info']);
      return response;
    } else {
      throw Exception(body['info']);
    }
  }
}
