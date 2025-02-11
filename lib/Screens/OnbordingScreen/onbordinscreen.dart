import 'package:flutter/material.dart';
import 'package:nector/Repositry/Wigets/uihelper.dart';
import 'package:nector/Screens/LoginScreen/loginscreen.dart';
import 'package:nector/Screens/SigninScreen/signinscreen.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

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
                    image: AssetImage("assets/images/onbord.png"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
            ),
            Center(
              child: UiHelper.CustomImage("logoonbording.png"),
            ),
            SizedBox(
              height: 20,
            ),
            UiHelper.CustomText(
                "Welcome", Color(0XFFFFFFFF), FontWeight.bold, 40),
            UiHelper.CustomText(
                "to our store", Color(0XFFFFFFFF), FontWeight.bold, 40),
            UiHelper.CustomText("Ger your groceries in as fast as one hour",
                Color(0XFFFFEFEF), FontWeight.bold, 14),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 67,
              width: 353,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0XFF53B175),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    "Get Started",
                    style: TextStyle(fontSize: 18, color: Color(0XFFFFF9FF)),
                  )),
            )
          ],
        )
      ],
    ));
  }
}
