import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nector/Repositry/Wigets/uihelper.dart';
import 'package:nector/Screens/ForgotpasswordScreen/forgotpasswordcreen.dart';
import 'package:nector/Screens/HomesScreen/homescreen.dart';
import 'package:nector/Screens/LoginScreen/loginscreen.dart';
import 'package:nector/Screens/SigninScreen/signinscreen.dart';
import 'package:nector/Screens/SignupScreen/signupscreen.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController EmailController = TextEditingController();

  TextEditingController PasswordController = TextEditingController();

  TextEditingController UsernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Center(
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    height: 895,
                    width: 415,
                    decoration: BoxDecoration(),
                    child: Image(
                      image: AssetImage("assets/images/back.png"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  UiHelper.CustomImage("loginlogo.png"),
                  SizedBox(
                    height: 100,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      UiHelper.CustomText(
                          "Signup", Color(0XFF181725), FontWeight.bold, 25)
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      UiHelper.CustomText("Enter your credentials to continue",
                          Color(0XFF7C7C7C), FontWeight.normal, 16)
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  UiHelper.CustomTextField(UsernameController, TextInputType.text,
                      false, "Enter Your Username", Icons.people_alt_outlined),
                  SizedBox(
                    height: 20,
                  ),
                  UiHelper.CustomTextField(
                      EmailController,
                      TextInputType.emailAddress,
                      false,
                      "Enter Your Email",
                      Icons.mail_outline_sharp),
                  SizedBox(
                    height: 20,
                  ),
                  UiHelper.CustomTextField(PasswordController, TextInputType.text,
                      true, "Enter Your Password", Icons.lock_outline),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      UiHelper.CustomText("By continuing you agree to our",
                          Color(0XFF7C7C7C), FontWeight.normal, 14),
                      UiHelper.CustomTextButton(() {}, "Terms of Service",
                          Color(0XFF53B175), 14, FontWeight.normal),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  UiHelper.CustomButton(() {
                    signup(
                        username: UsernameController.text.toString(),
                        email: EmailController.text.toString(),
                        password: PasswordController.text.toString());
                  }, "Sign Up"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UiHelper.CustomText("Already have an account?",
                          Color(0XFF181725), FontWeight.normal, 16),
                      UiHelper.CustomTextButton(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      }, "Signin", Color(0XFF53B175), 16, FontWeight.normal)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  signup(
      {required String username,
      required String email,
      required String password}) async {
    if (email == "" || password == "" || username == "") {
      return UiHelper.CustomSnackBar(
          text: "Enter Username Email and Password", context: context);
    } else {
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => LoginScreen()));
          return UiHelper.CustomSnackBar(text: value.user!.email.toString(), context: context);
        });
      } on FirebaseAuthException catch (ex) {
        return UiHelper.CustomSnackBar(
            text: ex.code.toString(), context: context);
      }
    }
  }
}
