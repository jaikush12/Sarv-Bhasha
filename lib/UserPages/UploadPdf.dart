import 'package:flutter/material.dart';

class UploadPdf extends StatefulWidget {
  const UploadPdf({super.key});

  @override
  State<UploadPdf> createState() => _UploadPdfState();
}

class _UploadPdfState extends State<UploadPdf> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
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
      body: SingleChildScrollView(
          child: Container(
        height: screenSize.height * 0.8,
        width: screenSize.width * 1,
        decoration: BoxDecoration(
            color: Color.fromRGBO(31, 38, 66, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: Column(
          children: [
            SizedBox(height: screenSize.height * 0.13),
            Container(
                height: screenSize.height * 0.3,
                width: screenSize.width * 0.7,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(47, 57, 100, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: screenSize.height * 0.07,
                      width: screenSize.width * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.green.shade400,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Upload PDF",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.02),
                    Text(
                      "or Drop a file",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
            SizedBox(height: screenSize.height * 0.09),
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
                SizedBox(height: screenSize.height * 0.1),
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
                        Icons.mic,
                        color: Colors.white,
                      ),
                      Text(
                        "Speech",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
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
