import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truetask_app/utils/routes.dart';
import 'package:truetask_app/viewmodels/auth_user.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String? userToken;
  String userName = '', userEmail = '';

  @override
  void initState() {
    _checkToken();
    super.initState();
  }

  _checkToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')!;
    var user = jsonDecode(localStorage.getString('user')!);
    setState(() {
      userName = user['username'];
      userEmail = user['email'];
    });
    // print(token);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(userName),
            accountEmail: Text(userEmail),
            currentAccountPicture: GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(profilePage),
              child: ClipOval(child: Image.asset("assets/image/Avatar2.png")),
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey[900],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(dashboardPage),
          ),
          ListTile(
            leading: const Icon(Icons.code),
            title: const Text("About"),
            onTap: () => Navigator.of(context).pushNamed(aboutPage),
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text("Notification"),
            onTap: () => Navigator.of(context).pushNamed(notificationPage),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              AuthUser().logout();
              Navigator.of(context).pushReplacementNamed(loginPage);
            },
          ),
        ],
      ),
    );
  }
}
