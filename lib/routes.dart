import 'package:flutter/cupertino.dart';
import 'package:flutter_midterm_project/screens/Dashboard.dart';
import 'package:flutter_midterm_project/screens/SignUpPage.dart';
import 'package:flutter_midterm_project/screens/Settings.dart';
import 'package:flutter_midterm_project/screens/SplashScreen.dart';
import 'package:flutter_midterm_project/screens/loginPage.dart';

final Map<String, WidgetBuilder> routes = {
  LoginPage.routeName: (BuildContext context) => LoginPage(),
  SignUpPage.routeName: (BuildContext context) => SignUpPage(),
  Dashboard.routeName: (BuildContext context) => Dashboard(),
  Settings.routeName: (BuildContext context) => Settings(),
  SplashScreen.routeName: (BuildContext context) => SplashScreen(),
};