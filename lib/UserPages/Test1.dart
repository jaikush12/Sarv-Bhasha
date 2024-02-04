import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_tts/flutter_tts.dart';

class DropdownTest extends StatefulWidget {
  const DropdownTest({super.key});

  @override
  State<DropdownTest> createState() => _DropdownTestState();
}

class _DropdownTestState extends State<DropdownTest> {
  String _selectedItem = 'hi';
  FlutterTts flutterTts = FlutterTts();

  Future<void> initTts() async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setSpeechRate(0.5); // Adjust the speech rate as needed
  }

  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  String data = '';
  Future<void> speakText(String text) async {
    await flutterTts.speak(text);
  }

  senddata() async {
    if (_namecontroller.text.isNotEmpty && _selectedItem.isNotEmpty) {
      var reqbody = {
        "text": _namecontroller.text,
        "lang": _selectedItem.toString(),
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

  // List of items for the dropdown
  List<String> _dropdownItems = ["hi", "bn", "gu", "mr", "ta", "te"];
  void initState() {
    super.initState();
    senddata();
  }

  @override
  Widget build(BuildContext context) {
    print(_selectedItem);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: _namecontroller),
            // TextField(
            //   controller: TextEditingController(text: _selectedItem),
            //   readOnly: true,
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: _selectedItem,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedItem = newValue ?? 'hi';
                  print('Selected Item: $_selectedItem');
                });
              },
              items:
                  _dropdownItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
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
        ),
      ),
    );
  }
}
