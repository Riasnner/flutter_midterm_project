import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_midterm_project/screens/Dashboard.dart';
import 'package:flutter_midterm_project/screens/LoginPage.dart';
import 'package:flutter_midterm_project/services/AuthService.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";
  
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthService _authService = AuthService();
  var finalToken; 
   @override
    void initState() {
      _authService.readData('token').then((value) {
        finalToken = value;
      });
      Timer(
          const Duration(seconds: 3), () => Navigator.pushReplacementNamed(
            context, finalToken == null ? LoginPage.routeName: Dashboard.routeName)
      );
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset('assets/splash.gif'),
        ),
      );
    }
}