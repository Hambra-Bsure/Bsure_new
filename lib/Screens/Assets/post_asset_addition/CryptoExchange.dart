import 'dart:convert';
import 'dart:io';
import 'package:Bsure_devapp/Screens/Assets/Static_names_list/Crypto_Exchange.dart';
import 'package:http/http.dart' as http;
import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/crypto_exchange_screen.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this for TextInputFormatter
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../LoginScreen.dart';
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
  // final TextEditingController _exchangeNameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _walletAddressController =
      TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  File? file;
  String? fileName;
  String? downloadUrl;

  String? _selectedCryptoExchange;
  List<Exchange> _cryptoExchange = [];

  Color color1 = const Color(0xff429bb8);
  String url = "";
  var name;
  var proof;
  String? assetId;

  @override
  void initState() {
    super.initState();
    _fetchCryptoExchangeNames();
  }

  Future<void> _fetchCryptoExchangeNames() async {
    const url = 'http://43.205.12.154:8080/v2/asset/static/cryptoExchanges';

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (token == null || token.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Token'),
          content: const Text('Please log in again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Print the raw response body for debugging
        print('Response body: ${response.body}'); // Debugging purposes

        // Decode the response body
        final List<dynamic> data = json.decode(response.body);

        // Ensure the data is a list of strings or maps
        setState(() {
          _cryptoExchange = data.map((exchangeJson) {
            if (exchangeJson is Map<String, dynamic>) {
              return Exchange.fromJson(exchangeJson); // Map to CryptoExchange
            } else if (exchangeJson is String) {
              return Exchange(name: exchangeJson); // Handle plain strings
            } else {
              throw Exception('Unexpected data type: $exchangeJson');
            }
          }).toList();
        });

        // Print fetched exchange names for debugging
        print('Fetched exchange names: ${_cryptoExchange.map((exchange) => exchange.name).toList()}');
      } else {
        print('Failed to load exchange names. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching exchange names: $e');
    }
  }

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
          buildExchangeNameDropdown(),
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
                        hintText: "Attachemnt you want to upload(optional)",
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
                      'Choose file',
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
                  _submitForm();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff429bb8),
                ),
                child:
                    const Text('Submit', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Widget buildExchangeNameDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              'Exchange name',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ' *',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: _selectedCryptoExchange ?? '',
          isExpanded: true,
          // Set isExpanded to true
          onChanged: (value) {
            setState(() {
              _selectedCryptoExchange = value;
            });
          },
          items: [
            const DropdownMenuItem<String>(
              value: '',
              child: Text('Select Exchange Name'),
            ),
            ..._cryptoExchange.map((cryptoExchange) {
              return DropdownMenuItem<String>(
                value: cryptoExchange.name,
                child: Text(cryptoExchange.name),
              );
            }).toList(),
          ],
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
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

    if (token == null || token.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Token'),
          content: const Text('Please log in again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    try {
      var uri = Uri.parse(
          'https://dev.bsure.live/v2/asset/attachment'); // Update the URL to your API endpoint
      var request = http.MultipartRequest('POST', uri);

      // Set headers
      request.headers['Authorization'] = token.toString();

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
        DisplayUtils.showToast("Attachment uploaded successfully");
        var responseBody = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseBody);
        var fileUrl = jsonResponse[
            'fileUrl']; // Assuming the server returns the file URL in 'fileUrl' key
        var returnedAssetId = jsonResponse[
            'assetId']; // Assuming the server returns the asset ID in 'assetId' key
        // Handle the file URL and asset ID
        print('File URL: $fileUrl');
        print('Asset ID: $returnedAssetId');

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
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  void _submitForm() async {
    if (_selectedCryptoExchange == null ||
        _accountNumberController.text.isEmpty) {
      if (_selectedCryptoExchange == null) {
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
    var token =
        prefs.getString("token"); // Retrieve token from SharedPreferences

    if (token == null || token.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Token'),
          content: const Text('Please log in again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    final dio = Dio();
    final client = NodeClient(dio);

    final request = CryptoExchangeRequest(
      assetType: widget.assetType,
      exchangeName: _selectedCryptoExchange ?? '',
      accountNumber: _accountNumberController.text,
      walletAddress: _walletAddressController.text,
      comments: _commentsController.text,
      attachment: _attachmentController.text,
    );

    try {
      final response = await client.CreateCryptoExchange(token, request);

      assetId = response.asset.assetId.toString();
      if (assetId != null) {
        submitImage();
      }
      // Handle the response data
      if (response.success == 200) {
        DisplayUtils.showToast("Crypto exchange details added successfully");
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CryptoExchangeScreen(assetType: widget.assetType),
          ),
        );
      }
    } catch (e) {}
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
