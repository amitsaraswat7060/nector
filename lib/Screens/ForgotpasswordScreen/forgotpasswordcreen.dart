import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nector/Screens/LoginScreen/loginscreen.dart';

import '../../Repositry/Wigets/uihelper.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController EmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
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
            child: Column(
              children: [
                SizedBox(
                  height: 55,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    UiHelper.CustomText("Forgot Password?",
                        Color(0XFF181725), FontWeight.bold, 25)
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
                    UiHelper.CustomText(
                        "Enter your email address to get link", Color(0XFF7C7C7C), FontWeight.bold, 14)
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 35,
                    ),
                    UiHelper.CustomText(
                        "Email Address", Color(0XFF7C7C7C), FontWeight.bold, 16)
                  ],
                ),
                SizedBox(height: 5,),
                Row(children: [SizedBox(width: 30,),
                   UiHelper.CustomTextField(EmailController, TextInputType.emailAddress, false, "Enter your Email", Icons.mail_outline),
                ],),
                SizedBox(height: 30,),
                UiHelper.CustomButton((){
                  forgot(email: EmailController.text.toString());
                }, "Password Reset")
              ],
            ),
          )
    ])
    );
  }

  forgot({required String email})async {
    if (email==""){
      return UiHelper.CustomSnackBar(text: "Enter Email", context: context);
    }
    else {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value){
        return UiHelper.CustomSnackBar(text: "Otp Send Please Check", context: context);
      });
    }

  }
}
