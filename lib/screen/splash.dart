import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quizee/screen/home.dart';
import 'package:quizee/screen/quiz_screen.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);


  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2) , (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home.navigate()));

    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(color: Color(0xff111111),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Image(image: AssetImage('assets/images/logo.jpg'))
      ],),),

    );
  }
}

