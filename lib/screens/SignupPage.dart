import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_midterm_project/screens/loginPage.dart';
import 'package:flutter_midterm_project/widget/EmailTextField.dart';
import 'package:flutter_midterm_project/widget/PasswordField.dart';
import 'package:flutter_midterm_project/widget/PrimaryButton.dart';
import 'package:flutter_midterm_project/widget/TitleName.dart';
import 'package:flutter_midterm_project/services/AuthService.dart';

class SignUpPage extends StatefulWidget {
  static String routeName = "/register";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  AuthService _authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;
  bool obscurePasswordF = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Center (
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                width: width * .9,
                child: Column(
                  children: [
                    TitleName(text: "SIGN UP"),
                    
                    EmailTextField(
                      labelText: "Email Address", 
                      hintText: "Enter your Email Address", 
                      controller: emailController, 
                      textInputType: TextInputType.emailAddress),
                    const SizedBox(
                      height: 10.0,
                    ),
                    PasswordField(
                      obscureText: obscurePassword, 
                      onTap: handleObscurePassword, 
                      labelText: "Password", 
                      hintText: "Enter your Password", 
                      controller: passwordController
                      ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PrimaryButton(
                      text: "Signup", 
                      iconData: Icons.app_registration, 
                      onPress: () {
                        signingUp();
                    }),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, LoginPage.routeName);
                        },
                        child: const Text(
                          "Already have an account? Login here",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
  handleObscurePassword(){
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  signingUp() async{
    try {
      var user = await _authService.signUpEmailPass(emailController.text, passwordController.text);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

}