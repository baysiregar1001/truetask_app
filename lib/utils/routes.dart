import 'package:flutter/material.dart';
import 'package:truetask_app/screen/dashboard/dashboard_page.dart';
import 'package:truetask_app/screen/drawer/aboutdev.dart';
import 'package:truetask_app/screen/drawer/notif.dart';
import 'package:truetask_app/screen/drawer/profile.dart';
import 'package:truetask_app/screen/forget_password_page.dart';
import 'package:truetask_app/screen/login_page.dart';
import 'package:truetask_app/screen/onBoardingPage/onBoardingPage1.dart';
import 'package:truetask_app/screen/projects/add_project.dart';
import 'package:truetask_app/screen/projects/create_meeting.dart';
import 'package:truetask_app/screen/projects/create_team.dart';
import 'package:truetask_app/screen/projects/meeting.dart';
import 'package:truetask_app/screen/projects/project_detail.dart';
import 'package:truetask_app/screen/projects/project_details.dart';
import 'package:truetask_app/screen/projects/projects.dart';
import 'package:truetask_app/screen/projects/team.dart';
import 'package:truetask_app/screen/projects/update_project.dart';
import 'package:truetask_app/screen/register_page.dart';
import 'package:truetask_app/screen/splashscreen/splash.dart';
import 'package:truetask_app/screen/tasks/task.dart';
import 'package:truetask_app/screen/tasks/create_task.dart';
import 'package:truetask_app/screen/tasks/update_task.dart';
import 'package:truetask_app/screen/welcome.dart';

const String splashPage = "splash-page";
const String loginPage = "login-page";
const String dashboardPage = "dashboard-page";
const String registerPage = "register-page";
const String forgetPasswordPage = "forget-password-page";
const String onBoardingPage = "onboarding-page";
const String welcomePage = "welcome-page";
const String profilePage = "profile-page";
const String aboutPage = "about-page";
const String notificationPage = "notification-page";
const String projectPage = "project-page";
const String taskPage = "task-page";
const String projectDetailPage = "project-detail-page";
const String addProjectPage = "add-project-page";
const String updateProjectPage = "update-project-page";
const String projectTeamPage = "project-team-page";
const String createTaskPage = "create-task-page";
const String updateTaskPage = "update-task-page";
const String meetingPage = "meeting-page";
const String createMeetingPage = "create-meeting-page";
const String createTeamPage = "create-team-page";

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case splashPage:
      return MaterialPageRoute(builder: (context) => const Splash());
    case onBoardingPage:
      return MaterialPageRoute(builder: (context) => const OnBoardingPage1());
    case welcomePage:
      return MaterialPageRoute(builder: (context) => const Welcome());
    case loginPage:
      return MaterialPageRoute(builder: (context) => const LoginPage());
    case registerPage:
      return MaterialPageRoute(builder: (context) => const RegisterPage());
    case forgetPasswordPage:
      return MaterialPageRoute(
          builder: (context) => const ForgetPasswordPage());
    case dashboardPage:
      return MaterialPageRoute(builder: (context) => const DashboardPage());
    case profilePage:
      return MaterialPageRoute(builder: (context) => const Profile());
    case aboutPage:
      return MaterialPageRoute(builder: (context) => const AboutDev());
    case projectPage:
      return MaterialPageRoute(builder: (context) => const Projects());
    case taskPage:
      return MaterialPageRoute(builder: (context) => const OurTask());
    case projectDetailPage:
      return MaterialPageRoute(
          builder: (context) => const ProjectDetailsPage(), settings: settings);
    case notificationPage:
      return MaterialPageRoute(builder: (context) => const Notif());
    case addProjectPage:
      return MaterialPageRoute(builder: (context) => const AddProject());
    case updateProjectPage:
      return MaterialPageRoute(
          builder: (context) => const UpdateProject(), settings: settings);
    case projectTeamPage:
      return MaterialPageRoute(builder: (context) => const Team());
    case createTaskPage:
      return MaterialPageRoute(
          builder: (context) => const CreateTask(), settings: settings);
    case updateTaskPage:
      return MaterialPageRoute(
          builder: (context) => const UpdateTask(), settings: settings);
    case meetingPage:
      return MaterialPageRoute(builder: (context) => const Meeting());
    case createMeetingPage:
      return MaterialPageRoute(builder: (context) => const CreateMeeting());
    case createTeamPage:
      return MaterialPageRoute(builder: (context) => const CreateTeam());
    default:
      throw ("This route name doesn't exist");
  }
}
