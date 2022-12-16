import 'package:flutter/material.dart';
import 'package:truetask_app/utils/routes.dart' as route;

void main() {
  runApp(const MyApp());
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
      // home: OurTask(),
      onGenerateRoute: route.controller,
      initialRoute: route.splashPage,
    );
  }
}
