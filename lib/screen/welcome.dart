import 'package:flutter/material.dart';
import 'package:truetask_app/screen/dashboard_page.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Hello !\nWelcome to",
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Image.asset("assets/logo.png"),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const DashboardPage(),
                ),
                (route) => false,
              );
            },
            child: const Text("Login"),
          ),
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
