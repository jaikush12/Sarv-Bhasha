import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_tts/flutter_tts.dart';

class APiTest extends StatefulWidget {
  const APiTest({super.key});

  @override
  State<APiTest> createState() => _APiTestState();
}

class _APiTestState extends State<APiTest> {
  FlutterTts flutterTts = FlutterTts();

  Future<void> initTts() async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setSpeechRate(0.5); // Adjust the speech rate as needed
  }

  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  String data = '';

  senddata() async {
    if (_emailcontroller.text.isNotEmpty && _namecontroller.text.isNotEmpty) {
      var reqbody = {
        "text": _namecontroller.text,
        "lang": _emailcontroller.text,
      };
      final response = await http.post(
          //posting req
          Uri.parse("https://translatetext.onrender.com/translate-text"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(reqbody));
      final jsonData = json.decode(response.body);
      print(jsonData);
      setState(() {
        data = jsonData['translated_text'];
      });
      // print(response);

      //   if(response.statusCode==200){
      //     final jsonData = json.decode(response.body);
      //  print(jsonData);
      //   }
    } else {
      print("Error");
    }
  }

  // Future fetchData() async {
  //   final response = await http
  //       .get(Uri.parse("https://translatetext.onrender.com/translate-text"));
  //   if (response.statusCode == 200) {
  //     final jsonData = json.decode(response.body);
  //     print(jsonData);
  //     setState(() {
  //       data = jsonData['message'];
  //       data1 = jsonData['finald'];
  //     });
  //   } else {
  //     throw Exception('Failed to fetch data');
  //   }
  // }

  @override
  void initState() {
    super.initState();
    senddata();
  }

  Future<void> speakText(String text) async {
    await flutterTts.speak(text);
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Testing'),
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _namecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Text',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Language',
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: senddata,
                icon: Icon(
                  // <-- Icon
                  Icons.arrow_circle_up,
                  size: 24.0,
                ),
                label: Text('Translate'), // <-- Text
              ),
              SizedBox(height: 20),
              Text(
                "Output:  $data",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  speakText(data);
                },
                child: Image.asset(
                  "assets/Speaker.png",
                  height: 40,
                ),
              ),
            ],
          )),
    );
  }
}

