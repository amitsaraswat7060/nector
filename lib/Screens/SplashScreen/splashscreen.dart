import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nector/Screens/OnbordingScreen/onbordinscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>OnbordingScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0XFF53B175),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset("assets/images/logo.png")
        ],),
      ),
    );
  }
}
