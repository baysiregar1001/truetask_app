import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:truetask_app/services/api_service.dart';

const String registerUrl = "/auth/register";
const String loginUrl = "/auth/login";
const String logoutUrl = "/auth/logout";

class AuthUser {
  Future login({required String email, required String password}) async {
    var data = {'email': email, 'password': password};
    final response = await ApiService().auth(data, loginUrl);
    var body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString(
          'token', json.encode(body['data']['access_token']));
    }
    return response;
  }

  register({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String phoneNumber,
    required String password,
    required String confirmPassword,
  }) async {
    var data = {
      "first_name": firstName,
      "last_name": lastName,
      "username": username,
      "email": email,
      "phone_number": phoneNumber,
      "password": password,
      "password_confirmation": confirmPassword,
    };
    final response = await ApiService().auth(data, loginUrl);
    var body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString(
          'token', json.encode(body['data']['access_token']));
    } else {
      throw Exception(body['info']);
    }
  }

  logout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var response = await ApiService().postData(null, logoutUrl);
    if (response.statusCode == 200) {
      localStorage.remove('token');
    } else {
      return response;
    }
  }
}
