import 'package:flutter/material.dart';
import 'package:nector/Repositry/Wigets/uihelper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 60,),
              UiHelper.CustomImage("loginlogo.png"),
              SizedBox(height: 10,),
              UiHelper.CustomText("Dhaka, Banassre", Color(0XFF4C4F4D), FontWeight.normal, 18),
              SizedBox(height: 20,),
              Container(height: 50,width: 365,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color(0XFFF3F2F2)),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              SingleChildScrollView(scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 30,),
                    UiHelper.CustomContainer(115, 369, Color(0XFFF2F3F2), UiHelper.CustomImage("banner.png")),
                    SizedBox(width: 30,),
                    UiHelper.CustomContainer(115, 369, Color(0XFFF2F3F2), UiHelper.CustomImage("banner.png")),
                    UiHelper.CustomContainer(115, 369, Color(0XFFF2F3F2), UiHelper.CustomImage("banner.png")),
                    UiHelper.CustomContainer(115, 369, Color(0XFFF2F3F2), UiHelper.CustomImage("banner.png")),
                    UiHelper.CustomContainer(115, 369, Color(0XFFF2F3F2), UiHelper.CustomImage("banner.png")),
                    UiHelper.CustomContainer(115, 369, Color(0XFFF2F3F2), UiHelper.CustomImage("banner.png")),
                    SizedBox(width: 30,)
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
