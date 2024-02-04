import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sih_project/UserPages/BottomNavi.dart';

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
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => BottomNavi())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 38, 66, 1),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/SplashScreen.png"),
            Text(
              "VANIVISTA",
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.w800),
            ),
            Text(
              "Y O U R   C U L T U R A L   C O M P A S S",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            )
          ],
        ),
      )),
    );
  }
}
