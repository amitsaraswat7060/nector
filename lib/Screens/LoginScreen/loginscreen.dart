import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nector/Repositry/Wigets/uihelper.dart';
import 'package:nector/Screens/ForgotpasswordScreen/forgotpasswordcreen.dart';
import 'package:nector/Screens/HomesScreen/homescreen.dart';
import 'package:nector/Screens/SignupScreen/signupscreen.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController EmailController = TextEditingController();

  TextEditingController PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Column(
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
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 70,),
                      UiHelper.CustomImage("loginlogo.png"),
                      SizedBox(height: 100,),
                      Row(
                        children: [
                          SizedBox(width: 30,),
                          UiHelper.CustomText("Loging", Color(0XFF181725), FontWeight.bold, 25)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          SizedBox(width: 30,),
                          UiHelper.CustomText("Enter your emails and password", Color(0XFF7C7C7C), FontWeight.normal, 16)
                        ],
                      ),
                      SizedBox(height: 40,),
                      UiHelper.CustomTextField(EmailController, TextInputType.emailAddress, false, "Enter Your Email", Icons.mail_outline_sharp),
                      SizedBox(height: 40,),
                      UiHelper.CustomTextField(PasswordController, TextInputType.text, true, "Enter Your Password", Icons.lock_outline),
                      Row(mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(padding: EdgeInsets.only(right: 30),child: UiHelper.CustomTextButton((){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));
                          }, "Forgot Password", Color(0XFF53B175), 16, FontWeight.normal),)
                        ],
                      ),
                      SizedBox(height: 30,),
                      UiHelper.CustomButton((){
                        sigin(email: EmailController.text.toString(), password: PasswordController.text.toString(),context: context);
                      }, "Login"),
                      SizedBox(height: 10,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          UiHelper.CustomText("Don’t have an account?", Color(0XFF181725), FontWeight.normal, 16),
                          UiHelper.CustomTextButton((){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                          }, "Signup", Color(0XFF53B175), 16, FontWeight.normal)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  sigin({ required email , required password,required BuildContext context })async{
    if(email == "" || password == ""){
      return UiHelper.CustomSnackBar(text: "Enter Email And Password", context: context);
    }
    else {
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
          log("User Created $value");
        });
      }
      on FirebaseAuthException
      catch (ex){
        return UiHelper.CustomSnackBar(text: ex.code.toString(), context: context);
      }
    }
  }
}
