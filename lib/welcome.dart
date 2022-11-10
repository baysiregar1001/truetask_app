import 'dart:ui';

import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Hello !\nWelcome to",
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            ),
          Image.asset("assets/logo.png"),
        ],
      ),
    );

    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     Container(
    //       child: Text("Hello !\nWelcome to",
    //       style: TextStyle(
    //         fontSize: 48,
    //         fontWeight: FontWeight.bold,
    //         color: Colors.black,
    //       ),
    //       ),
    //     ),
    //   ],
    // );
  }
}