import 'package:flutter/material.dart';
import 'package:flutter_midterm_project/screens/loginPage.dart';
import 'package:flutter_midterm_project/widget/ConfirmPasswordField.dart';
import 'package:flutter_midterm_project/widget/EmailTextField.dart';
import 'package:flutter_midterm_project/widget/PasswordField.dart';
import 'package:flutter_midterm_project/widget/PrimaryButton.dart';
import 'package:flutter_midterm_project/widget/NameTextField.dart';
import 'package:flutter_midterm_project/widget/TitleName.dart';

class SignUpPage extends StatefulWidget {
  static String routeName = "/register";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController firstLastController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
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
                    NameTextField(
                      labelText: "First Name", 
                      hintText: "Enter your First Name", 
                      controller: firstNameController, 
                      textInputType: TextInputType.name),
                    const SizedBox(
                      height: 10.0,
                    ),
                    NameTextField(
                      labelText: "Last Name", 
                      hintText: "Enter your Last Name", 
                      controller: firstLastController, 
                      textInputType: TextInputType.name),
                    const SizedBox(
                      height: 10.0,
                    ),
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
                    ConfirmPasswordField(
                      obscureTextF: obscurePasswordF, 
                      labelText: "Confirm Password", 
                      hintText: "Re-enter your Password", 
                      controller: confirmPasswordController
                      ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PrimaryButton(
                      text: "Signup", 
                      iconData: Icons.app_registration, 
                      onPress: () {
                        Navigator.pushReplacementNamed(context, LoginPage.routeName);
                    }),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PrimaryButton(
                      text: "Already have an account? Login here", 
                      iconData: Icons.login, 
                      onPress: () {
                        Navigator.pushReplacementNamed(context, LoginPage.routeName);
                    }),
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
}