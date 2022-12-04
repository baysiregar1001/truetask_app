import 'package:flutter/material.dart';
import 'package:truetask_app/screen/dashboard_page.dart';
import 'package:truetask_app/screen/login_page.dart';
import 'package:truetask_app/screen/onBoardingPage/onBoardingPage1.dart';
import 'package:truetask_app/screen/register_page.dart';
import 'package:truetask_app/screen/splashscreen/splash.dart';
import 'package:truetask_app/screen/workspaceTask_page.dart';

const String splashPage = "splash-page";
const String loginPage = "login-page";
const String dashboardPage = "dashboard-page";
const String registerPage = "register-page";
const String onBoardingPage = "onboarding-page";
const String welcomePage = "welcome-page";
const String workspacePage = "workspace-page";

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case splashPage:
      return MaterialPageRoute(
        builder: (context) => const Splash(),
      );
    case onBoardingPage:
      return MaterialPageRoute(
        builder: (context) => const OnBoardingPage1(),
      );
    case loginPage:
      return MaterialPageRoute(
        builder: (context) => const LoginPage(),
      );
    case registerPage:
      return MaterialPageRoute(
        builder: (context) => const RegisterPage(),
      );
    case dashboardPage:
      return MaterialPageRoute(
        builder: (context) => const DashboardPage(),
      );
    case workspacePage:
      return MaterialPageRoute(
          builder: (context) => const WorkspacePage(), settings: settings);
    default:
      throw ("This route name doesn't exist");
  }
}
