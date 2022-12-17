import 'dart:convert';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truetask_app/services/api_service.dart';

class AuthUser {
  Future<Response> login({
    required String email,
    required String password,
  }) async {
    String url = "/auth/login";

    final data = {'email': email, 'password': password};
    final response = await ApiService().auth(data, url);
    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString(
          'token', json.encode(body['data']['access_token']));
      localStorage.setString('user', jsonEncode(body['data']['user']));
    }
    return response;
  }

  Future<Response> register({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String phoneNumber,
    required String password,
    required String confirmPassword,
  }) async {
    String url = "/auth/register";

    final data = {
      "first_name": firstName,
      "last_name": lastName,
      "username": username,
      "email": email,
      "phone_number": phoneNumber,
      "password": password,
      "password_confirmation": confirmPassword,
    };

    final response = await ApiService().auth(data, url);

    return response;
  }

  Future<Response> logout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    String url = "/auth/logout";

    var response = await ApiService().postData(null, url);
    if (response.statusCode == 200) {
      localStorage.remove('token');
      localStorage.remove('rememberMe');
    }
    return response;
  }
}
