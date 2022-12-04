import 'dart:convert';

import 'package:truetask_app/models/user.dart';
import 'package:truetask_app/services/api_service.dart';

class FetchProfile {
  Future<User?> getProfile() async {
    String url = '/profile';
    final response = await ApiService().getData(url);

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body)['data'];
      final result = User.fromJson(jsonDecode(jsonEncode(data['user'])));
      // print(result);
      return result;
    } else {
      throw Exception('Error fetching data');
    }
  }
}
