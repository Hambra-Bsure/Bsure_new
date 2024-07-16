import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/crypto_exchange_screen.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this for TextInputFormatter
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/AssetModels/CryptoExchangeRequest.dart';
import '../../Repositary/Retrofit/node_api_client.dart';
import '../../Utils/DisplayUtils.dart';

class CryptoExchangeAdd extends StatefulWidget {
  final String assetType;

  const CryptoExchangeAdd({super.key, required this.assetType});

  @override
  _CryptoExchangeAddState createState() => _CryptoExchangeAddState();
}

class _CryptoExchangeAddState extends State<CryptoExchangeAdd> {
  final TextEditingController _exchangeNameController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();
  final TextEditingController _walletAddressController = TextEditingController();
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
        title: const Text('Crypto exchange account',
            style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          buildTextField(
            controller: _exchangeNameController,
            labelText: 'Exchange name',
            mandatory: true,
          ),
          buildTextField(
            controller: _accountNumberController,
            labelText: 'Account number',
            mandatory: true,
            isNumeric: true,
          ),
          buildTextField(
            controller: _walletAddressController,
            labelText: 'Wallet address',
            mandatory: false,
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
                  // Change the label for picking a file
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
          builder: (context) => CryptoExchangeScreen(
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

      print("url");
      print(assetId);

      if (proof != null) {
        request.files.add(http.MultipartFile.fromBytes(
          "attachment",
          proof.bytes!,
          filename: proof.name,
        ));
      }

      var response = await request.send();
      print(response);

      if (response.statusCode == 201) {
        var responseBody = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseBody);
        var fileUrl = jsonResponse['fileUrl']; // Assuming the server returns the file URL in 'fileUrl' key
        var returnedAssetId = jsonResponse['assetId']; // Assuming the server returns the asset ID in 'assetId' key
        // Handle the file URL and asset ID
        print('File URL: $fileUrl');
        print('Asset ID: $returnedAssetId');

        // Navigate to the BankAccountsScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CryptoExchangeScreen(
              assetType: widget.assetType,
            ),
          ),
        );
      } else {
        // Handle error response
        print('Failed to upload file: ${response.statusCode}');
        // Navigate to the BankAccountsScreen even if upload fails
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CryptoExchangeScreen(
              assetType: widget.assetType,
            ),
          ),
        );
      }
    } catch (e) {
      // Handle exception
      print('Error uploading file: $e');
      // Navigate to the BankAccountsScreen in case of error
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CryptoExchangeScreen(
            assetType: widget.assetType,
          ),
        ),
      );
    }
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
          keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
          inputFormatters: isNumeric
              ? [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10), // Limiting to 10 digits
            NoLeadingSpaceFormatter(),
          ]
              : [
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
    if (_exchangeNameController.text.isEmpty || _accountNumberController.text.isEmpty) {
      if (_exchangeNameController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Exchange name is required')),
        );
      }
      if (_accountNumberController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Account number is required')),
        );
      }
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

    final request = CryptoExchangeRequest(
      assetType: widget.assetType,
      exchangeName: _exchangeNameController.text,
      accountNumber: _accountNumberController.text,
      walletAddress: _walletAddressController.text,
      comments: _commentsController.text,
      attachment: _attachmentController.text,
    );

    try {
      final response = await client.CreateCryptoExchange(token, request);

      setState(() {
        assetId = response.asset!.cryptoExchange!.assetId?.toString();
      });
      // Handle the response data
      if (response.success == 200) {
        DisplayUtils.showToast("Crypto exchange details added successfully");
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CryptoExchangeScreen(assetType: widget.assetType),
          ),
        );
      }
    } catch (e) {}
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
