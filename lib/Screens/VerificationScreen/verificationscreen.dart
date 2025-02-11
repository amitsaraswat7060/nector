import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nector/Repositry/Wigets/uihelper.dart';
import 'package:nector/Screens/LocationScreen/locationscreen.dart';
import 'package:nector/Screens/NumberScreen/numberscreen.dart';

class VerificationScreen extends StatefulWidget {
  String verificationid;
  VerificationScreen({super.key, required this.verificationid});
  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController OtpController = TextEditingController();

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
                                builder: (context) => NumberScreen()));
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
                    UiHelper.CustomText("Enter your 4-digit code",
                        Color(0XFF181725), FontWeight.bold, 25)
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    UiHelper.CustomText(
                        "Code", Color(0XFF7C7C7C), FontWeight.bold, 16)
                  ],
                ),
                SizedBox(
                  height: 1,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    SizedBox(
                      width: 350,
                      child: TextField(
                        controller: OtpController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "- - - - - -",
                            hintStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 30),
                      child: UiHelper.CustomTextButton(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NumberScreen()));
                      }, "Resend Code?", Color(0XFF53B175), 16,
                          FontWeight.normal),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                UiHelper.CustomButton(() async {
                  try {
                    PhoneAuthCredential credential =
                        await PhoneAuthProvider.credential(
                            verificationId: widget.verificationid,
                            smsCode: OtpController.text.toString());
                    FirebaseAuth.instance.signInWithCredential(credential).then((value){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LocationScreen()));
                    });
                  } catch (ex) {
                    log(ex.toString());
                  }
                }, "Next")
              ],
            ),
          )
        ],
      ),
    );
  }
}
