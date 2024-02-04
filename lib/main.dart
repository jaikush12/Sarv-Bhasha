import 'package:flutter/material.dart';
import 'package:sih_project/SplashScreen/sreen.dart';
import 'package:sih_project/Test/Test2.dart';
import 'package:sih_project/TestApi/apifetch.dart';
import 'package:sih_project/TestApi/apiimage.dart';
import 'package:sih_project/TestApiPDF/PdfApi.dart';
import 'package:sih_project/UserPages/BottomNavi.dart';
import 'package:sih_project/UserPages/HomePage.dart';
import 'package:sih_project/UserPages/Test1.dart';
import 'package:sih_project/UserPages/UploadPdf.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;


  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
