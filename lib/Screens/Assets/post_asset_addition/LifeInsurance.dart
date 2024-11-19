import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart'; // Import this for FilteringTextInputFormatter
import 'package:Bsure_devapp/Screens/Repositary/Retrofit/node_api_client.dart';
import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/life_insurance_screen.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/LifeInsuranceRequest.dart';

import '../../LoginScreen.dart';
import '../../Utils/DisplayUtils.dart';
import '../Static_names_list/LifeInsurance.dart';

class LifeInsuranceAdd extends StatefulWidget {
  final String assetType;

  const LifeInsuranceAdd({super.key, required this.assetType});

  @override
  _LifeInsuranceAddState createState() => _LifeInsuranceAddState();
}

class _LifeInsuranceAddState extends State<LifeInsuranceAdd> {
  //final TextEditingController _insuranceCompanyNameController = TextEditingController();
  final TextEditingController _policyNameController = TextEditingController();
  final TextEditingController _policyNumberController = TextEditingController();
  final TextEditingController _coverageAmountController =
  TextEditingController();
  final TextEditingController _maturityDateController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  File? file;
  String? fileName;
  String? downloadUrl;

  String? _selectedLifeInsurance;
  List<Insurance> _lifeInsurance = [];

  //ImagePicker imagePicker = ImagePicker();
  Color color1 = const Color(0xff429bb8);
  String url = "";
  var name;
  var proof;
  String? assetId;

  String? maturityDate;

  @override
  void initState() {
    super.initState();
    _fetchLifeInsuranceNames();
  }

  Future<void> _fetchLifeInsuranceNames() async {
    const url = 'http://43.205.12.154:8080/v2/asset/static/lifeInsuranceCompanies';

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
        print('Response body: ${response.body}'); // For debugging

        // Decode the response body
        final List<dynamic> data = json.decode(response.body);

        // Ensure the data is a list of maps (or strings, if applicable)
        if (data is List) {
          setState(() {
            _lifeInsurance = data.map((insuranceJson) {
              if (insuranceJson is Map<String, dynamic>) {
                return Insurance.fromJson(insuranceJson); // Map to LifeInsurance
              } else if (insuranceJson is String) {
                return Insurance(name: insuranceJson); // For cases where it's a plain string
              } else {
                throw Exception('Unexpected data type: $insuranceJson');
              }
            }).toList();
          });

          // Print fetched insurance names
          print('Fetched insurance company names: ${_lifeInsurance.map((insurance) => insurance.name).toList()}');
        }
      } else {
        print('Failed to load insurance names. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching insurance names: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title:
        const Text('Life insurance', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, children: [
              buildLifeInsuranceDropdown(),
              buildTextField(
                controller: _policyNameController,
                labelText: 'Policy name',
              ),
              buildTextField(
                controller: _policyNumberController,
                labelText: 'Policy number',
                isNumeric: true,
              ),
              buildTextField(
                controller: _coverageAmountController,
                labelText: 'Coverage amount',
                isNumeric: true,
              ),
              buildDateField(
                controller: _maturityDateController,
                labelText: 'Maturity date',
                //mandatory: false,
              ),
              buildTextField(
                controller: _commentsController,
                labelText: 'Comments',
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
                      ElevatedButton(
                        onPressed: uploadFile,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff429bb8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery
                                .of(context)
                                .size
                                .width * 0.01,
                            horizontal: MediaQuery
                                .of(context)
                                .size
                                .width * 0.03,
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
                    child: const Text('Submit',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget buildLifeInsuranceDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              'Insurance Company name',
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
          value: _selectedLifeInsurance ?? '',
          isExpanded: true,
          // Set isExpanded to true
          onChanged: (value) {
            setState(() {
              _selectedLifeInsurance = value;
            });
          },
          items: [
            const DropdownMenuItem<String>(
              value: '',
              child: Text('Select Insurance Company Name'),
            ),
            ..._lifeInsurance.map((insurance) {
              return DropdownMenuItem<String>(
                value: insurance.name,
                child: Text(insurance.name),
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
    final result = await FilePicker.platform.pickFiles(
        type: FileType.any, allowMultiple: false);

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
        var fileUrl = jsonResponse['fileUrl']; // Assuming the server returns the file URL in 'fileUrl' key
        var returnedAssetId = jsonResponse['assetId']; // Assuming the server returns the asset ID in 'assetId' key
        // Handle the file URL and asset ID
        print('File URL: $fileUrl');
        print('Asset ID: $returnedAssetId');

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                LifeInsuranceScreen(
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
            builder: (context) =>
                LifeInsuranceScreen(
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
          builder: (context) =>
              LifeInsuranceScreen(
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

  Widget buildDateField({
    required TextEditingController controller,
    required String labelText,
    bool mandatory = false,
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
        InkWell(
          onTap: () async {
            final selectedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );

            if (selectedDate != null) {
              controller.text = selectedDate.toString().split(' ')[0];
            }
          },
          child: AbsorbPointer(
            child: TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
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
    if (_selectedLifeInsurance == null ) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Insurance company name is required')),
      );
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

    String? maturityDateValue = _maturityDateController.text.isEmpty
        ? null
        : _maturityDateController.text;

    // Parse coverage amount only if it's not empty
    int? coverageAmountValue;
    if (_coverageAmountController.text.isNotEmpty) {
      coverageAmountValue = int.tryParse(_coverageAmountController.text);
    }

    var assetType = widget.assetType; // Assuming widget.assetType is a String

    final request = LifeInsuranceRequest(
      assetType: assetType,
      insuranceCompanyName: _selectedLifeInsurance ?? '',
      policyName: _policyNameController.text,
      policyNumber: _policyNumberController.text,
      coverageAmount: coverageAmountValue,
      maturityDate: maturityDateValue,
      comments: _commentsController.text,
      attachment: _attachmentController.text,
    );

    try {
      final response = await client.CreateLifeInsurance(token, request);
      print(response);

      assetId = response.asset.assetId.toString();
      if (assetId != null) {
        submitImage();
      }

      if (response.success == 200) {
        DisplayUtils.showToast("Life insurance details added successfully");
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                LifeInsuranceScreen(assetType: widget.assetType),
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
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.startsWith(' ')) {
      return oldValue;
    }
    return newValue;
  }
}
