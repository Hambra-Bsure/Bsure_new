import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/stock_broker_screen.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/StockBrokerRequest.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:Bsure_devapp/Screens/Repositary/Retrofit/node_api_client.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart'; // Add this import
import '../../Utils/DisplayUtils.dart';

class StockBrokerAdd extends StatefulWidget {
  final String assetType;

  const StockBrokerAdd({super.key, required this.assetType});

  @override
  _StockBrokerAddState createState() => _StockBrokerAddState();
}

class _StockBrokerAddState extends State<StockBrokerAdd> {
  final TextEditingController _brokerNameController = TextEditingController();
  final TextEditingController _dematAccountNumberController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  File? file;
  String? fileName;
  String? downloadUrl;

  Color color1 = const Color(0xff429bb8);
  String url = "";
  var name;
  var proof;
  String? assetId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Stock broker', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextField(
                controller: _brokerNameController,
                labelText: 'Broker name',
                mandatory: true,
              ),
              const SizedBox(height: 16),
              buildTextField(
                controller: _dematAccountNumberController,
                labelText: 'Demat account number',
                mandatory: true,
                isNumeric: true, // Make this field numeric
              ),
              const SizedBox(height: 16),
              buildTextField(
                controller: _commentsController,
                labelText: 'Comments',
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff429bb8),
                  ),
                  child: const Text('Save', style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 16),
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
              Center(
                child: ElevatedButton(
                  onPressed: submitImage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff429bb8),
                  ),
                  child: const Text('Submit', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String?> saveFileLocally(FilePickerResult result) async {
    final file = File(result.files.single.path!); // Get the file
    // Define a directory where the file will be saved
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/${result.files.single.name}';

    // Copy the file to the application directory
    await file.copy(filePath);

    return filePath; // Return the saved file path
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
          inputFormatters: isNumeric
              ? [FilteringTextInputFormatter.digitsOnly, NoLeadingSpaceFormatter()]
              : [NoLeadingSpaceFormatter()],
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
          keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
        ),
      ],
    );
  }

  Future<void> uploadFile() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.any, allowMultiple: false);

    if (result != null) {
      setState(() {
        proof = result.files.single;
        _attachmentController.text = proof.name;
      });
    } else {
      // Handle error when no file is selected.
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
          builder: (context) => StockBrokerScreen(
            assetType: widget.assetType,
          ),
        ),
      );
      return;
    }

    try {
      var uri = Uri.parse(
          'https://dev.bsure.live/v2/asset/attachment'); // Update the URL to your API endpoint
      var request = http.MultipartRequest('POST', uri);

      // Set headers
      request.headers['Authorization'] = token;

      // Add asset ID as a field
      request.fields['assetId'] = assetId.toString();

      if (proof != null) {
        request.files.add(http.MultipartFile.fromBytes(
          "attachment",
          proof.bytes!,
          filename: proof.name,
        ));
      }

      var response = await request.send();

      if (response.statusCode == 201) {
        var responseBody = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseBody);
        var fileUrl = jsonResponse['fileUrl']; // Assuming the server returns the file URL in 'fileUrl' key
        var returnedAssetId = jsonResponse['assetId']; // Assuming the server returns the asset ID in 'assetId' key
        // Handle the file URL and asset ID

        // Navigate to the StockBrokerScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => StockBrokerScreen(
              assetType: widget.assetType,
            ),
          ),
        );
      } else {
        // Handle error response
        // Navigate to the StockBrokerScreen even if upload fails
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => StockBrokerScreen(
              assetType: widget.assetType,
            ),
          ),
        );
      }
    } catch (e) {
      // Handle exception
      // Navigate to the StockBrokerScreen in case of error
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => StockBrokerScreen(
            assetType: widget.assetType,
          ),
        ),
      );
    }
  }

  void _submitForm() async {
    if (_brokerNameController.value.text.isEmpty ||
        _dematAccountNumberController.value.text.isEmpty) {
      if (_brokerNameController.value.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Broker name is required')),
        );
      } else if (_dematAccountNumberController.value.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Demat account number is required')),
        );
      }
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token"); // Retrieve token from SharedPreferences

    // Check if token is null or empty
    if (token == null || token.isEmpty) {
      // Handle the case where token is not available
      return;
    }

    final dio = Dio();
    final client = NodeClient(dio);

    final request = StockBrokerRequest(
      assetType: widget.assetType,
      brokerName: _brokerNameController.text,
      dematAccountNumber: _dematAccountNumberController.text,
      comments: _commentsController.text,
      attachment: _attachmentController.text,
    );

    try {
      final response = await client.CreateStockBroker(token, request);

      setState(() {
        assetId = response.asset!.stockBroker!.assetId?.toString();
      });

      if (response.success == 200) {
        DisplayUtils.showToast("Stock broker details added successfully");
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => StockBrokerScreen(assetType: widget.assetType),
          ),
        );
      }
    } catch (e) {
      // Handle errors
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
