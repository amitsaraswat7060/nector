import 'package:flutter/material.dart';
import 'package:nector/Screens/LoginScreen/loginscreen.dart';

import '../../Repositry/Wigets/uihelper.dart';
import '../NumberScreen/numberscreen.dart';

class LocationScreen extends StatelessWidget {
  TextEditingController YourzoneController = TextEditingController();
  TextEditingController YourareaController = TextEditingController();
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
                SizedBox(height: 55,),
                Row(
                  children: [
                    SizedBox(width: 25,),
                    IconButton(onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NumberScreen()));
                    }, icon: Icon(Icons.arrow_back_ios),),
                  ],
                ),
                SizedBox(height: 20,),
                UiHelper.CustomImage("location.png"),
                SizedBox(
                  height: 40,
                ),
                UiHelper.CustomText("Select Your Location", Color(0XFF181725), FontWeight.bold, 25),
                SizedBox(height: 15,),
                UiHelper.CustomText("Swithch on your location to stay in tune with", Color(0XFF7C7C7C), FontWeight.w500, 16),
                UiHelper.CustomText("what’s happening in your area", Color(0XFF7C7C7C), FontWeight.w500, 16),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    UiHelper.CustomText(
                        "Your Zone", Color(0XFF7C7C7C), FontWeight.bold, 16)
                  ],
                ),
                SizedBox(height: 1,),
                Row(
                  children: [
                    SizedBox(width: 30,),
                    SizedBox(width: 350,
                      child: TextField(
                        controller: YourzoneController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Enter your Zone",
                            hintStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.normal)
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 40,),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    UiHelper.CustomText(
                        "Your Area", Color(0XFF7C7C7C), FontWeight.bold, 16)
                  ],
                ),
                SizedBox(height: 1,),
                Row(
                  children: [
                    SizedBox(width: 30,),
                    SizedBox(width: 350,
                      child: TextField(
                        controller: YourareaController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Enter your Zone",
                            hintStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.normal)
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 50,),
                UiHelper.CustomButton((){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                }, "Submit")
              ],),
          )
        ],
      ),
    );
  }
}
