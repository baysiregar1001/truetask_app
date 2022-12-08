import 'package:flutter/cupertino.dart';
import 'package:truetask_app/models/user.dart';
import 'package:truetask_app/services/userprofile_service.dart';

class UserProfile with ChangeNotifier {
  User? user;
  getProfile() async {
    user = await FetchProfile().getProfile();
    notifyListeners();
  }
}
