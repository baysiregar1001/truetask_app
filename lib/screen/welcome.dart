import 'package:flutter/material.dart';
import 'package:truetask_app/utils/routes.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(bottom: 45)),
            const Text(
              " Hello!\nWelcome to",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48,
              ),
              textAlign: TextAlign.center,
            ),
            Image.asset(
              "assets/image/Truetask.png",
              height: 392,
              width: 171,
            ),
            const Padding(
              padding: EdgeInsets.only(
                right: 30,
                left: 30,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).pushReplacementNamed(registerPage),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "   Register   ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 83,
                ),
                ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).pushReplacementNamed(loginPage),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "   Login   ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
            ),
          ],
        ),
      ),
    );
  }
}
