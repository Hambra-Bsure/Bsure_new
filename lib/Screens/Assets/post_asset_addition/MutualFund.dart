import 'dart:convert';
import 'dart:io';
import 'package:Bsure_devapp/Screens/Assets/Static_names_list/Mutualfund.dart';
import 'package:http/http.dart' as http;
import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/mutual_fund_screen.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/MutualFundRequest.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../LoginScreen.dart';
import '../../Repositary/Retrofit/node_api_client.dart';
import '../../Utils/DisplayUtils.dart';

class MutualFundAdd extends StatefulWidget {
  final String assetType;

  const MutualFundAdd({super.key, required this.assetType});

  @override
  _MutualFundAddState createState() => _MutualFundAddState();
}

class _MutualFundAddState extends State<MutualFundAdd> {
  final TextEditingController _assetTypeController = TextEditingController();

  // final TextEditingController _amcNameController = TextEditingController();
  final TextEditingController _schemeNameController = TextEditingController();
  final TextEditingController _folioNumberController = TextEditingController();
  final TextEditingController _fundTypeController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  FilePickerResult? proof;
  String? assetId;

  String? _selectedmutulFund;
  List<Fund> _mutualFunds = [];

  @override
  void initState() {
    super.initState();
    _fetchMutualFunds();
  }

  Future<void> _fetchMutualFunds() async {
    const url = 'http://43.205.12.154:8080/v2/asset/static/mutualFunds';

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
        print('Response body: ${response.body}'); // For debugging purposes

        // Decode the response body
        final List<dynamic> data = json.decode(response.body);

        // Ensure the data is a list of maps (or strings, if applicable)
        if (data is List) {
          setState(() {
            _mutualFunds = data.map((fundJson) {
              if (fundJson is Map<String, dynamic>) {
                return Fund.fromJson(fundJson); // Map to MutualFund
              } else if (fundJson is String) {
                return Fund(name: fundJson); // Handle plain string response
              } else {
                throw Exception('Unexpected data type: $fundJson');
              }
            }).toList();
          });

          // Print fetched mutual fund names
          print('Fetched mutual fund names: ${_mutualFunds.map((fund) => fund.name).toList()}');
        }
      } else {
        print('Failed to load mutual fund names. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching mutual fund names: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff429bb8),
          title:
              const Text('Mutual fund', style: TextStyle(color: Colors.white)),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 16),
            buildMutualFundDropdown(),
            const SizedBox(height: 16),
            buildTextField(
              controller: _schemeNameController,
              labelText: 'Scheme name',
            ),
            const SizedBox(height: 16),
            buildTextField(
              controller: _folioNumberController,
              labelText: 'Folio number',
              isNumeric: true,
            ),
            const SizedBox(height: 16),
            buildTextField(
              controller: _fundTypeController,
              labelText: 'Fund type',
            ),
            const SizedBox(height: 16),
            buildTextField(
              controller: _commentsController,
              labelText: 'Comments',
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
                      hintText: "Attachemnt you want to upload(optional)",
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
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  _submitForm();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff429bb8),
                ),
                child:
                    const Text('Submit', style: TextStyle(color: Colors.white)),
              ),
            ),
          ]),
        ));
  }

  Widget buildMutualFundDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              'AMC Name',
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
          value: _selectedmutulFund ?? '',
          isExpanded: true,
          // Set isExpanded to true
          onChanged: (value) {
            setState(() {
              _selectedmutulFund = value;
            });
          },
          items: [
            const DropdownMenuItem<String>(
              value: '',
              child: Text('Select AMC Name'),
            ),
            ..._mutualFunds.map((mutualfund) {
              return DropdownMenuItem<String>(
                value: mutualfund.name,
                child: Text(mutualfund.name),
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
        proof = result;
        _attachmentController.text = result.files.single.name;
      });
    } else {
      // Handle error when no file is selected.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No file selected')),
      );
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

      if (proof != null) {
        request.files.add(http.MultipartFile.fromBytes(
          "attachment",
          proof!.files.single.bytes!,
          filename: proof!.files.single.name,
        ));
      }

      var response = await request.send();

      if (response.statusCode == 201) {
        DisplayUtils.showToast("Attachment uploaded successfully");
        var responseBody = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseBody);
        var fileUrl = jsonResponse[
            'fileUrl']; // Assuming the server returns the file URL in 'fileUrl' key
        var returnedAssetId = jsonResponse[
            'assetId']; // Assuming the server returns the asset ID in 'assetId' key
        // Handle the file URL and asset ID

        // Navigate to the MutualFundScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MutualFundScreen(assetType: widget.assetType),
          ),
        );
      } else {
        // Handle error response
        print('Failed to upload file: ${response.statusCode}');
        // Navigate to the MutualFundScreen even if upload fails
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MutualFundScreen(assetType: widget.assetType),
          ),
        );
      }
    } catch (e) {
      // Handle exception
      print('Error uploading file: $e');
      // Navigate to the MutualFundScreen in case of error
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MutualFundScreen(assetType: widget.assetType),
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
          inputFormatters: isNumeric
              ? [
                  FilteringTextInputFormatter.digitsOnly,
                  NoLeadingSpaceFormatter()
                ]
              : [NoLeadingSpaceFormatter()],
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
          keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
        ),
      ],
    );
  }

  void _submitForm() async {
    if (_selectedmutulFund == null || _selectedmutulFund!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('AMC name is required')),
      );
      return;
    }

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

    final dio = Dio();
    final client = NodeClient(dio);

    final request = MutualFundRequest(
      assetType: widget.assetType,
      amcName: _selectedmutulFund ?? '',
      schemeName: _schemeNameController.text,
      folioNumber: _folioNumberController.text,
      fundType: _fundTypeController.text,
      comments: _commentsController.text,
      attachment: _attachmentController.text,
    );

    try {
      final response = await client.CreateMutualFund(token, request);

      assetId = response.asset.assetId.toString();
      if (assetId != null) {
        submitImage();
      }

      if (response.success == 200) {
        DisplayUtils.showToast("Mutual fund details added successfully");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MutualFundScreen(assetType: widget.assetType),
          ),
        );
      }
    } catch (e) {
      print('Error creating mutual fund: $e');
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
