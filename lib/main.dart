import 'package:flutter/material.dart';
import 'package:truetask_app/screen/splashscreen/splash.dart';
// import 'package:truetask_app/utils/check_auth.dart';
// import 'package:truetask_app/utils/routes.dart' as route;
// import 'package:flutter/services.dart';

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
      home: const Splash(),
      // onGenerateRoute: route.controller,
      // initialRoute: route.splashPage,
    );
  }
}
