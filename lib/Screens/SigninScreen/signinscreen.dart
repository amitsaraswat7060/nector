import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nector/Repositry/Wigets/uihelper.dart';
import 'package:nector/Screens/LoginScreen/loginscreen.dart';
import 'package:nector/Screens/NumberScreen/numberscreen.dart';

class SigninScreen extends StatelessWidget {

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
                    height: 896,
                    width: 414,
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
          SingleChildScrollView(
            child: Column(
              children: [
                UiHelper.CustomImage("sin1.png"),
                SizedBox(
                  height: 0,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    UiHelper.CustomText("Get your groceries", Color(0XFF030303),
                        FontWeight.bold, 25),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    UiHelper.CustomText(
                        "with nectar", Color(0XFF030303), FontWeight.bold, 25),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 50,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "+91",
                          hintStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 290,
                      child: TextField(
                         onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                         },
                        controller: PhoneController,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(hintText: "Enter Mobile Number"),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                UiHelper.CustomText("Or connect with social media",
                    Color(0XFF828282), FontWeight.normal, 14),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 67,
                  width: 364,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0XFF5383EC),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19))),
                    onPressed: () {},
                    child: Row(
                      children: [
                        SizedBox(
                          width: 35,
                        ),
                        UiHelper.CustomImage("google.png"),
                        SizedBox(
                          width: 40,
                        ),
                        Center(
                            child: Text(
                          "Continue with Google",
                          style:
                              TextStyle(fontSize: 18, color: Color(0XFFFCFCFC)),
                        )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 67,
                  width: 364,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0XFF4A66AC),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {},
                      child: Row(
                        children: [
                          SizedBox(
                            width: 35,
                          ),
                          UiHelper.CustomImage("facebook.png"),
                          SizedBox(
                            width: 40,
                          ),
                          Center(
                              child: Text(
                            "Continue with Google",
                            style:
                                TextStyle(fontSize: 18, color: Color(0XFFFCFCFC)),
                          )),
                        ],
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
