import "package:flutter/material.dart";
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:truetask_app/utils/routes.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  // bool isAuth = false;
  // bool firstApp = false;
  // bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    _navigateToOnboardingPage();
  }

  // _checkIfLoggedIn() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   var token = localStorage.getString('token');
  //   var isFirst = localStorage.getBool('firstApp');

  //   if (token != null) {
  //     setState(() {
  //       isAuth = true;
  //       print("token: $token");
  //     });
  //   }
  //   if (isFirst == null) {
  //     localStorage.setBool('firstApp', true);
  //     setState(() {
  //       firstApp = true;
  //     });
  //   }
  // }

  _navigateToOnboardingPage() async {
    // await _checkIfLoggedIn();
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed(onBoardingPage);
      // if (isAuth == true && rememberMe == true) {
      //   if (mounted) {
      //     Navigator.of(context).pushReplacementNamed(dashboardPage);
      //   }
      // }
      // else if (firstApp) {
      //   if (mounted) {
      //     Navigator.of(context).pushReplacementNamed(onBoardingPage);
      //   }
      //   }
      // else if (isAuth == true) {
      //   if (mounted) {
      //     Navigator.of(context).pushReplacementNamed(loginPage);
      //   }
      // } else {
      //   localStorage.remove('token');
      //   localStorage.remove('rememberMe');
      //   if (mounted) {
      //     Navigator.of(context).pushReplacementNamed(onBoardingPage);
      //     Navigator.of(context).pushReplacementNamed(welcomePage);
      //   }
      // }
    });
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
              "assets/image/Truetask.png",
              width: 449,
              height: 242,
            ),
          ],
        ),
      ),
    );
  }
}
