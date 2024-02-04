import 'package:flutter/material.dart';
import 'package:sih_project/UserPages/BottomNavi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_tts/flutter_tts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        "lang": _selectedItem,
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
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // bottomNavigationBar: BottomNavi(),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Column(
          children: [
            Text(
              "VANIVISTA",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w800),
            ),
            Text(
              "Y O U R   C U L T U R A L   C O M P A S S",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 7,
              ),
            )
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
          height: screenSize.height * 0.8,
          width: screenSize.width * 1,
          decoration: BoxDecoration(
              color: Color.fromRGBO(31, 38, 66, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: screenSize.height * 0.03),
                Container(
                  height: screenSize.height * 0.25,
                  width: screenSize.width * 0.95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Color.fromRGBO(
                          78, 76, 187, 1), // Set the color of the border
                      width: 2.0, // Set the width of the border
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenSize.height * 0.01),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("English",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            )),
                      ),
                      Divider(
                        endIndent: 10,
                        indent: 10,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          showCursor: false,
                          controller: _namecontroller,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Enter Text",
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // TextField(
                //   controller: TextEditingController(text: _selectedItem),
                //   readOnly: true,
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //   ),
                // ),
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: senddata,
                      child: Container(
                        height: screenSize.height * 0.042,
                        width: screenSize.width * 0.25,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Translate",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: senddata,
                      child: Container(
                        height: screenSize.height * 0.042,
                        width: screenSize.width * 0.25,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Simplify",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: senddata,
                      child: Container(
                        height: screenSize.height * 0.042,
                        width: screenSize.width * 0.25,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Summarize",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                Container(
                  height: screenSize.height * 0.2,
                  width: screenSize.width * 0.95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Color.fromRGBO(
                          78, 76, 187, 1), // Set the color of the border
                      width: 2.0, // Set the width of the border
                    ),
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              width: screenSize.width * 0.8,
                              child: DropdownButton<String>(
                                dropdownColor: Color.fromRGBO(110, 79, 175, 1),
                                value: _selectedItem,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedItem = newValue ?? 'hi';
                                    print('Selected Item: $_selectedItem');
                                  });
                                },
                                items: _dropdownItems
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 30),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                    height: screenSize.height * 0.08,
                                    width: screenSize.width * 0.7,
                                    child: Text(
                                      data,
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Text(
                //   "Output:  $data",
                //   style: TextStyle(
                //     fontSize: 25,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),

                SizedBox(height: screenSize.height * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: screenSize.height * 0.08,
                      width: screenSize.width * 0.4,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(31, 38, 66, 1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color.fromRGBO(
                              78, 76, 187, 1), // Set the color of the border
                          width: 2.0, // Set the width of the border
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.picture_as_pdf_sharp,
                            color: Colors.white,
                          ),
                          Text(
                            "Pdf",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: screenSize.height * 0.08,
                      width: screenSize.width * 0.4,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(31, 38, 66, 1),
                        border: Border.all(
                          color: Color.fromRGBO(
                              78, 76, 187, 1), // Set the color of the border
                          width: 2.0, // Set the width of the border
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.assignment,
                            color: Colors.white,
                          ),
                          Text(
                            "Word",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: screenSize.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: screenSize.height * 0.08,
                      width: screenSize.width * 0.4,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(31, 38, 66, 1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color.fromRGBO(
                              78, 76, 187, 1), // Set the color of the border
                          width: 2.0, // Set the width of the border
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                          Text(
                            "Image",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        speakText(data);
                      },
                      child: Container(
                        height: screenSize.height * 0.08,
                        width: screenSize.width * 0.4,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(31, 38, 66, 1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromRGBO(
                                78, 76, 187, 1), // Set the color of the border
                            width: 2.0, // Set the width of the border
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.mic,
                              color: Colors.white,
                            ),
                            Text(
                              "Speech",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
