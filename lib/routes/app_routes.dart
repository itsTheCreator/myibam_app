import 'package:get/get.dart';
import 'package:myibam_app/ui/screens/home_screen.dart';
import 'package:myibam_app/ui/screens/login_screen.dart';
import 'package:myibam_app/ui/screens/main_screen.dart';
import 'package:myibam_app/ui/screens/notification_screen.dart';
import 'package:myibam_app/ui/screens/profile_screen.dart';
import 'package:myibam_app/ui/screens/splash_screen.dart';
import 'package:myibam_app/ui/screens/timetable_screen.dart';
import 'package:myibam_app/ui/screens/signup_screen.dart';

class AppRoutes {
  static String splashScreen = '/';
  static String loginScreen = '/loginScreen';
  static String homescreen = '/AgendaScreen';
  static String mainScreen = '/mainScreen';
  static String profileScreen = '/profileScreen';
  static String timetableScreen = '/timetableScreen';
  static String notificationScreen = '/notificationScreen';
  static String signupScreen = '/signupScreen';




  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () =>  SplashScreen(),
    ),
    GetPage(
      name: loginScreen,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: homescreen,
      page: () => const AgendaScreen(),
    ),
    GetPage(
      name: mainScreen,
      page: () =>  MainScreen(),
    ),
    GetPage(
      name: profileScreen,
      page: () =>  ProfileScreen(),
    ),
    GetPage(
      name: timetableScreen,
      page: () =>  TimetableScreen(),
    ),
    GetPage(
      name: notificationScreen,
      page: () =>  NotificationScreen(),
    ),
    GetPage(
      name: signupScreen,
      page: () => const SignupScreen(),
    ),
  ];
}
