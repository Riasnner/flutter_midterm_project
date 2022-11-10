import 'package:flutter/material.dart';
import 'package:flutter_midterm_project/routes.dart';
import 'package:flutter_midterm_project/screens/LoginPage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: LoginPage.routeName,
    routes: routes,
  ));
}

