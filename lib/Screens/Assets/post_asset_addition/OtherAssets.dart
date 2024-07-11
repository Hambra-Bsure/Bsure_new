import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/AssetModels/OtherAssetRequest.dart';
import '../../Repositary/Retrofit/node_api_client.dart';
import '../../Utils/DisplayUtils.dart';
import '../get_asset_screens/other_screen.dart';

class OtherAssetAdd extends StatefulWidget {
  final String assetType;

  const OtherAssetAdd({Key? key, required this.assetType}) : super(key: key);

  @override
  _OtherAssetAddState createState() => _OtherAssetAddState();
}

class _OtherAssetAddState extends State<OtherAssetAdd> {
  final TextEditingController _assetNameController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  File? proof;
  String? assetId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Other asset', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextField(
              controller: _assetNameController,
              labelText: 'Asset name',
              mandatory: true,
            ),
            buildTextField(
              controller: _commentsController,
              labelText: 'Comments',
              mandatory: false,
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff429bb8),
                ),
                child: const Text('Save', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _attachmentController,
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff429bb8)),
                          ),
                          hintText: "Select file",
                          hintStyle: TextStyle(fontSize: 16),
                        ),
                        readOnly: true,
                        onTap: uploadFile,
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: uploadFile,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff429bb8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.01,
                          horizontal: MediaQuery.of(context).size.width * 0.03,
                        ),
                      ),
                      child: const Text(
                        'File',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: submitImage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff429bb8),
                  ),
                  child: const Text('Submit', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> uploadFile() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.any, allowMultiple: false);

    if (result != null) {
      setState(() {
        proof = File(result.files.single.path!);
        _attachmentController.text = result.files.single.name;
      });
    } else {
      // Handle error when no file is selected.
      print('No file selected.');
    }
  }

  Future<void> submitImage() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    if (proof == null || token == null || token.isEmpty || assetId == null) {
      // If any of the conditions are not met, navigate to the next screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OtherScreen(
            assetType: widget.assetType,
          ),
        ),
      );
      return;
    }


    try {
      var uri = Uri.parse('http://43.205.12.154:8080/v2/asset/attachment');
      var request = http.MultipartRequest('POST', uri);

      // Set headers
      request.headers['Authorization'] = token!;

      // Add asset ID as a field
      request.fields['assetId'] = assetId!;

      if (proof != null) {
        request.files.add(http.MultipartFile.fromBytes(
          "attachment",
          proof!.readAsBytesSync(),
          filename: proof!.path.split('/').last,
        ));
      }

      var response = await request.send();
      print("Response: ${response.statusCode}");

      if (response.statusCode == 201) {
        var responseBody = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseBody);
        var fileUrl = jsonResponse['fileUrl'];
        var returnedAssetId = jsonResponse['assetId'];
        // Handle the file URL and asset ID
        print('File URL: $fileUrl');
        print('Asset ID: $returnedAssetId');

        // Navigate to the OtherScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OtherScreen(
              assetType: widget.assetType,
            ),
          ),
        );
      } else {
        // Handle error response
        print('Failed to upload file: ${response.statusCode}');
        print(await response.stream.bytesToString());
        // Navigate to the OtherScreen even if upload fails
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OtherScreen(
              assetType: widget.assetType,
            ),
          ),
        );
      }
    } catch (e) {
      // Handle exception
      print('Error uploading file: $e');
      // Navigate to the OtherScreen in case of error
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OtherScreen(
            assetType: widget.assetType,
          ),
        ),
      );
    }
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    bool mandatory = false,
    bool isNumeric = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              labelText,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (mandatory)
              const Text(
                ' *',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
          inputFormatters: isNumeric
              ? <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10), // Limiting to 10 digits
            NoLeadingSpaceFormatter(),
          ]
              : <TextInputFormatter>[
            NoLeadingSpaceFormatter(),
          ],
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding:
            EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  void _submitForm() async {
    if (_assetNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Asset name is required')),
      );
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    if (token == null || token.isEmpty) {
      // Handle the case where token is not available
      return;
    }

    final dio = Dio();
    final client = NodeClient(dio);

    final request = OtherAssetRequest(
      assetType: widget.assetType,
      assetName: _assetNameController.text,
      comments: _commentsController.text,
      attachment: _attachmentController.text,
    );

    try {
      final response = await client.CreateOtherAsset(token!, request);

      setState(() {
        assetId = response.asset?.otherAssets?.assetId.toString();
      });

      if (response.success == 200) {
        DisplayUtils.showToast("Other asset details added successfully");
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OtherScreen(assetType: widget.assetType),
          ),
        );
      }
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }
}

class NoLeadingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.startsWith(' ')) {
      return oldValue;
    }
    return newValue;
  }
}
