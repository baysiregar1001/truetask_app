import "package:flutter/material.dart";
import 'package:truetask_app/screen/onBoardingPage/onBoardingPage1.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboardingPage();
  }

  _navigateToOnboardingPage() async {
    await Future.delayed(const Duration(seconds: 4), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => (const OnBoardingPage1()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/Truetask.png",
              width: 449,
              height: 242,
            ),
          ],
        ),
      ),
    );
  }
}
