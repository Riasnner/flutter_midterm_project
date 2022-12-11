import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_midterm_project/routes.dart';
import 'package:flutter_midterm_project/screens/LoginPage.dart';
import 'package:flutter_midterm_project/screens/SplashScreen.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: SplashScreen.routeName,
    routes: routes,
  ));
}

