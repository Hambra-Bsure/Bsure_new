import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../LoginScreen.dart';
import '../../Repositary/Models/AssetModels/RealEstateRequest.dart';
import '../../Repositary/Retrofit/node_api_client.dart';
import '../../Utils/DisplayUtils.dart';
import '../get_asset_screens/real_estate_screen.dart';
import 'package:flutter/services.dart';

// Import other necessary packages and files

enum PropertyType { Residential, Commercial, Plot, Agricultureland, Others }

class RealEstateAdd extends StatefulWidget {
  final String assetType;

  const RealEstateAdd({super.key, required this.assetType});

  @override
  _RealEstateAddState createState() => _RealEstateAddState();
}

class _RealEstateAddState extends State<RealEstateAdd> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _khataNumberController = TextEditingController();
  final TextEditingController _northOfPropertyController =
      TextEditingController();
  final TextEditingController _southOfPropertyController =
      TextEditingController();
  final TextEditingController _eastOfPropertyController =
      TextEditingController();
  final TextEditingController _westOfPropertyController =
      TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  PropertyType? _selectedPropertyType;

  File? file;
  String? fileName;
  String? downloadUrl;

  //ImagePicker imagePicker = ImagePicker();
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
        title: const Text('Real estate', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              buildTextField(
                controller: _addressController,
                labelText: 'Address',
                mandatory: true,
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Text(
                    'Property type',
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
              DropdownButtonFormField<PropertyType>(
                value: _selectedPropertyType,
                onChanged: (value) {
                  setState(() {
                    _selectedPropertyType = value;
                  });
                },
                items: [
                  const DropdownMenuItem<PropertyType>(
                    value: null,
                    child: Text('Select property type'),
                  ),
                  ...PropertyType.values.map((type) {
                    return DropdownMenuItem<PropertyType>(
                      value: type,
                      child: Text(type.toString().split('.').last),
                    );
                  }),
                ],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                ),
              ),
              const SizedBox(height: 10),
              buildTextField(
                  controller: _khataNumberController,
                  labelText: 'Khata number',
                  mandatory: false,
                  isNumeric: true),
              buildTextField(
                controller: _northOfPropertyController,
                labelText: 'North of property ',
                mandatory: false,
              ),
              buildTextField(
                controller: _southOfPropertyController,
                labelText: 'South of property',
                mandatory: false,
              ),
              buildTextField(
                controller: _eastOfPropertyController,
                labelText: 'East of property',
                mandatory: false,
              ),
              buildTextField(
                controller: _westOfPropertyController,
                labelText: 'West of property ',
                mandatory: false,
              ),
              buildTextField(
                controller: _imageController,
                labelText: 'Image ',
                mandatory: false,
              ),
              buildTextField(
                controller: _commentsController,
                labelText: 'Comments ',
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
                      ElevatedButton(
                        onPressed: uploadFile,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff429bb8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.01,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.03,
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
      request.fields['assetId'] = assetId!;

      if (proof != null) {
        request.files.add(http.MultipartFile.fromBytes(
          "attachment",
          proof.bytes!,
          filename: proof!.name,
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

        // Navigate to the NpsScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => RealEstateScreen(
              assetType: widget.assetType,
            ),
          ),
        );
      } else {
        // Handle error response
        // Navigate to the NpsScreen even if upload fails
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => RealEstateScreen(
              assetType: widget.assetType,
            ),
          ),
        );
      }
    } catch (e) {
      // Handle exception
      print('Error uploading file: $e');
      // Navigate to the NpsScreen in case of error
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => RealEstateScreen(
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
    if (_addressController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Address is required')),
      );
    } else if (_selectedPropertyType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Select property type is required')),
      );
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

    final request = RealEstateRequest(
      assetType: widget.assetType,
      typeOfProperty: _selectedPropertyType.toString().split('.').last,
      address: _addressController.text,
      khataNumber: _khataNumberController.text,
      northOfProperty: _northOfPropertyController.text,
      southOfProperty: _southOfPropertyController.text,
      eastOfProperty: _eastOfPropertyController.text,
      westOfProperty: _westOfPropertyController.text,
      image: _imageController.text,
      comments: _commentsController.text,
      attachment: _attachmentController.text,
    );

    try {
      final response = await client.CreateRealEstate(token, request);

      assetId = response.asset.assetId.toString();
      if (assetId != null) {
        submitImage();
      }
      // Handle the response data

      if (response.success == 200) {
        DisplayUtils.showToast("Real estate details added successfully");
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => RealEstateScreen(assetType: widget.assetType),
          ),
        );
      }
    } catch (e) {
      // Handle exception
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
