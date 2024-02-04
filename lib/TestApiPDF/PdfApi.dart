// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:http/http.dart' as http;

// Future<http.Response> sendPdfFile(String targetLanguage) async {
//   // Pick a PDF file using the file picker package.
//   FilePickerResult? result = await FilePicker.platform.pickFiles(
//     type: FileType.custom,
//     allowedExtensions: ['pdf'],
//   );

//   if (result != null) {
//     // Get the selected file.
//     File pdfFile = File(result.files.single.path!);

//     // Create a MultipartRequest object.
//     var request = http.MultipartRequest('POST', Uri.parse('https://pdf-translation.onrender.com/translate-pdf'));

//     // Set the Content-Type header.
//     request.headers.addAll({'Content-Type': 'multipart/form-data'});

//     // Create a MultipartFile object from the selected file.
//     var file = await http.MultipartFile.fromPath('file', pdfFile.path);

//     // Add the file and target language to the request.
//     request.files.add(file);
//     request.fields.add('target_language', targetLanguage); // Use 'target_language' instead of 'target language'

//     // Send the request and await the response.
//     var response = await request.send();
//     return response;
//   } else {
//     // User canceled the file picker.
//     throw Exception('No file selected');
//   }
// }
