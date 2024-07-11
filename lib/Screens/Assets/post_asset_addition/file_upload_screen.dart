// ignore_for_file: library_private_types_in_public_api, prefer_typing_uninitialized_variables, no_logic_in_create_state, use_build_context_synchronously, file_names, empty_catches

import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FileUploadScreen extends StatefulWidget {
  const FileUploadScreen({super.key});

  @override
  _FileUploadScreenState createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen> {
  var proof;

  final TextEditingController fileNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('File upload Screen'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: fileNameController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Selected File',
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              await uploadFile();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff429bb8),
            ),
            child: const Text('Upload File'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              await submitImage();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff429bb8),
            ),
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  Future<void> uploadFile() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.any, allowMultiple: false);

    if (result != null) {
      setState(() {
        proof = result.files.single;
        fileNameController.text = proof.name;
      });
    } else {
      // Handle error when no file is selected.
    }
  }

  Future<void> submitImage() async {
    final prefs = await SharedPreferences.getInstance();
    var token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsInVzZXJNb2JpbGUiOiI4MzI4NTY0NjgzIiwiaWF0IjoxNzE4MzQ5ODQyLCJleHAiOjE3MTg5NTQ2NDJ9.cjq8epefsN2YbOZ4pYDwzkAa_U-wpkrCVPrVK9QRnwo';
    var assetId = '5'; // Manually set assetId

    if (proof == null) {
      // Handle error when no file is selected.
      return;
    }

    try {
      var uri = Uri.parse('http://43.205.12.154:8080/v2/asset/attachment'); // Update the URL to your API endpoint
      var request = http.MultipartRequest('POST', uri);

      // Set headers
      request.headers['Authorization'] = token;

      // Add asset ID as a field
      request.fields['assetId'] = assetId;

      if (proof != null) {
        request.files.add(http.MultipartFile.fromBytes(
          "attachment",
          proof.bytes!,
          filename: proof.name,
        ));
      }

      var response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseBody);
        var fileUrl = jsonResponse['fileUrl']; // Assuming the server returns the file URL in 'fileUrl' key
        var returnedAssetId = jsonResponse['assetId']; // Assuming the server returns the asset ID in 'assetId' key

        // Handle the file URL and asset ID
        print('File URL: $fileUrl');
        print('Asset ID: $returnedAssetId');
      } else {
        // Handle error response
        print('Failed to upload file: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exception
      print('Error uploading file: $e');
    }
  }
}
