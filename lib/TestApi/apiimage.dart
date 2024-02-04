// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class UploadImageScreen extends StatefulWidget {
//   const UploadImageScreen({Key? key}) : super(key: key);

//   @override
//   _UploadImageScreenState createState() => _UploadImageScreenState();
// }

// class _UploadImageScreenState extends State<UploadImageScreen> {
//   File? image;
//   final _picker = ImagePicker();
//   bool showSpinner = false;

//   Future getImage() async {
//     final pickedFile =
//         await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

//     if (pickedFile != null) {
//       image = File(pickedFile.path);
//       print(image);
//       setState(() {});
//     } else {
//       print('no image selected');
//     }
//   }

//   Future<void> uploadImage() async {
//     var stream = http.ByteStream(image!.openRead());

//     stream.cast();

//     var length = await image!.length();

//     var request = http.MultipartRequest('POST', uri);
//     request.headers.addAll({'Content-Type': 'multipart/form-data'});

//     var multiport = http.MultipartFile('image', stream, length);

//     request.fields.addAll({
//       'lang': 'hi',
//       'image': image!.path,
//     });
//     // print(stream.toBytes());
//     request.files.add(multiport);
//     print(length);

//     print(request.fields);

//     var response = await request.send();
//     print(response.statusCode);

//     print(multiport);

//     print(response.stream.toString());
//     if (response.statusCode == 200) {
//       print('image uploaded');
//     } else {
//       print('failed');
//       setState(() {
//         showSpinner = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload Image'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           GestureDetector(
//             onTap: () {
//               getImage();
//             },
//             child: Container(
//               child: image == null
//                   ? Center(
//                       child: Text('Pick Image'),
//                     )
//                   : Container(
//                       child: Center(
//                         child: Image.file(
//                           File(image!.path).absolute,
//                           height: 100,
//                           width: 100,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//             ),
//           ),
//           SizedBox(
//             height: 150,
//           ),
//           InkWell(
//             onTap: uploadImage,
//             child: Container(
//               height: 50,
//               width: 200,
//               color: Colors.green,
//               child: Center(child: Text('Upload')),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({Key? key}) : super(key: key);

  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;
  String data = "";

  Future getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
    } else {
      print('no image selected');
    }
  }

  Future<void> uploadImage() async {
    setState(() {
      showSpinner = true;
    });

    var stream = new http.ByteStream(image!.openRead());
    List<int> imageBytes = await image!.readAsBytes();
    stream.cast();

    var length = await image!.length();

    var uri = Uri.parse(
        "https://image-translation-api.onrender.com/extract_and_translate");

    var request = await http.MultipartRequest('POST', uri);
    request.headers.addAll({'Content-Type': 'multipart/form-data'});

    request.fields['lang'] = "hi";
    print(request.fields);

    var multiport = await http.MultipartFile.fromBytes("image", imageBytes,
        filename: '$image');

    request.files.add(multiport);

    final response = await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      // print('Response: $jsonResponse');
      setState(() {
        data = jsonResponse['translated_text'];
        showSpinner = false;
      });
      print(data);
      print('image uploaded');
    } else {
      print('failed');
      setState(() {
        showSpinner = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Upload Image'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                getImage();
              },
              child: Container(
                child: image == null
                    ? Center(
                        child: Text('Pick Image'),
                      )
                    : Container(
                        child: Center(
                          child: Image.file(
                            File(image!.path).absolute,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            GestureDetector(
              onTap: () {
                uploadImage();
              },
              child: Container(
                height: 50,
                width: 200,
                color: Colors.green,
                child: Center(child: Text('Upload')),
              ),
            ),
            Text(data)
          ],
        ),
      ),
    );
  }
}
