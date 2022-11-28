import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final String baseUrl = "https://api2.sib3.nurulfikri.com/api";

  String? token;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token')!);
  }

  postData(data, apiUrl) async {
    var fullUrl = baseUrl + apiUrl;
    await _getToken();
    final response = await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
    return response;
  }

  auth(data, apiUrl) async {
    var fullUrl = baseUrl + apiUrl;
    final response = await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
    return response;
  }

  getData(apiUrl) async {
    var fullUrl = baseUrl + apiUrl;
    await _getToken();
    final response = await http.get(
      Uri.parse(fullUrl),
      headers: _setHeaders(),
    );
    return response;
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
}
