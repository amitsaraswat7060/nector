import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nector/Repositry/Wigets/uihelper.dart';
import 'package:nector/Screens/SigninScreen/signinscreen.dart';
import 'package:nector/Screens/VerificationScreen/verificationscreen.dart';

class NumberScreen extends StatefulWidget {
  const NumberScreen({super.key});

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  TextEditingController PhoneController = TextEditingController();
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
        Column(
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
                            builder: (context) => SigninScreen()));
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
              ],
            ),
            SizedBox(
              height: 90,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                UiHelper.CustomText("Enter your mobile number",
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
                    "Mobile Number", Color(0XFF7C7C7C), FontWeight.bold, 16)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 40,
                ),
                SizedBox(
                  width: 290,
                  child: TextField(
                    controller: PhoneController,
                    keyboardType: TextInputType.number,
                    decoration:
                        InputDecoration(hintText: "Enter Mobile Number"),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 67,
              width: 353,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0XFF53B175),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException ex) {},
                      codeSent: (String verificationid, int? resendtoken) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerificationScreen(
                                    verificationid: verificationid)));
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                      phoneNumber: PhoneController.text.toString());
                },
                child: Text(
                  "Next",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        )
      ],
    ));
  }
}
