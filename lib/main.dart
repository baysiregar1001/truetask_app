import 'package:flutter/material.dart';
import 'package:truetask_app/screen/dashboard_page.dart';
import 'package:truetask_app/screen/forget_password_page.dart';
import 'package:truetask_app/screen/register_page.dart';
// import 'package:flutter/services.dart';
import 'package:truetask_app/screen/splashscreen/splash.dart';

void main() {
  runApp(const MyApp());
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'True Task App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DashboardPage(),
    );
  }
}
