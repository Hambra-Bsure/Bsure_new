import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for TextInputFormatter
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/AssetModels/NpsRequest.dart';
import '../../Repositary/Retrofit/node_api_client.dart';
import '../../Utils/DisplayUtils.dart';
import '../get_asset_screens/nps_screen.dart';

class NpsAdd extends StatefulWidget {
  final String assetType;

  const NpsAdd({Key? key, required this.assetType}) : super(key: key);

  @override
  _NpsAddState createState() => _NpsAddState();
}

class _NpsAddState extends State<NpsAdd> {
  final TextEditingController _pranNumberController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  PlatformFile? proof;
  String? assetId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Nps Account', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          buildTextField(
            controller: _pranNumberController,
            labelText: 'Pran Number',
            mandatory: true,
            isNumeric: true,
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
                onPressed: () async {
                  await submitImage();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff429bb8),
                ),
                child: const Text('Submit', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Future<void> uploadFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.any, allowMultiple: false);

    if (result != null) {
      setState(() {
        proof = result.files.single;
        _attachmentController.text = proof!.name;
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
      // If any of the conditions are not met, return and navigate to the next screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NpsScreen(assetType: widget.assetType),
        ),
      );
      return;
    }

    try {
      var uri = Uri.parse('https://dev.bsure.live/v2/asset/attachment'); // Update the URL to your API endpoint
      var request = http.MultipartRequest('POST', uri);

      // Set headers
      request.headers['Authorization'] = token;

      // Add asset ID as a field
      request.fields['assetId'] = assetId!;

      if (proof != null) {
        request.files.add(http.MultipartFile.fromBytes(
          "attachment",
          proof!.bytes!,
          filename: proof!.name,
        ));
      }

      var response = await request.send();

      if (response.statusCode == 201) {
        var responseBody = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseBody);
        var fileUrl = jsonResponse['fileUrl']; // Assuming the server returns the file URL in 'fileUrl' key
        var returnedAssetId = jsonResponse['assetId']; // Assuming the server returns the asset ID in 'assetId' key
        // Handle the file URL and asset ID

        // Navigate to the NpsScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => NpsScreen(assetType: widget.assetType),
          ),
        );
      } else {
        // Handle error response
        // Navigate to the NpsScreen even if upload fails
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => NpsScreen(assetType: widget.assetType),
          ),
        );
      }
    } catch (e) {
      // Handle exception
      // Navigate to the NpsScreen in case of error
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NpsScreen(assetType: widget.assetType),
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
            contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  void _submitForm() async {
    if (_pranNumberController.value.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pran Number is required')),
      );
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    // Check if token is null or empty
    if (token == null || token.isEmpty) {
      // Handle the case where token is not available
      print('Token is not available');
      return;
    }

    final dio = Dio();
    final client = NodeClient(dio);

    final request = NpsRequest(
      assetType: widget.assetType,
      pranNumber: _pranNumberController.text,
      comments: _commentsController.text,
      attachment: _attachmentController.text,
    );

    try {
      final response = await client.CreateNps(token, request);

      setState(() {
        assetId = response.asset?.id?.toString();
      });

      if (response.success == 200) {
        DisplayUtils.showToast("Nps details added successfully");
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => NpsScreen(assetType: widget.assetType),
          ),
        );
      }

      // Perform file upload after creating NPS
      if (assetId != null) {
        // Call submitImage() here if you want to upload the attached file after form submission
        // await submitImage();
      } else {
      }

    } catch (e) {

    }
  }
}

class NoLeadingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.startsWith(' ')) {
      return oldValue;
    }
    return newValue;
  }
}
