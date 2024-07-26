import 'dart:convert';
import 'dart:io';
import 'package:Bsure_devapp/Screens/Repositary/Retrofit/node_api_client.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import '../../Repositary/Models/AssetModels/NonLifeInsuranceRequest.dart';
import '../../Utils/DisplayUtils.dart';
import '../get_asset_screens/non_life_insurance_screen.dart';

class NonLifeInsuranceAdd extends StatefulWidget {
  final String assetType;

  const NonLifeInsuranceAdd({super.key, required this.assetType});

  @override
  _NonLifeInsuranceAddState createState() => _NonLifeInsuranceAddState();
}

class _NonLifeInsuranceAddState extends State<NonLifeInsuranceAdd> {
  final TextEditingController _insuranceCompanyNameController =
      TextEditingController();
  final TextEditingController _policyNameController = TextEditingController();
  final TextEditingController _policyNumberController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  final List<String> _insuranceTypes = [
    'Health Insurance',
    'Property Insurance',
    'Motor Insurance',
    'Other'
  ];

  String? _selectedDropdownValue;
  File? file;
  String? fileName;
  String? downloadUrl;
  String? assetId;

  var proof;
  var name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Non-Life insurance',
            style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            buildTextField(
              controller: _insuranceCompanyNameController,
              labelText: 'Insurance company name',
              mandatory: true,
            ),
            const SizedBox(height: 16),
            buildDropdownField(),
            const SizedBox(height: 16),
            buildTextField(
              controller: _policyNameController,
              labelText: 'Policy name',
            ),
            const SizedBox(height: 16),
            buildTextField(
                controller: _policyNumberController,
                labelText: 'Policy number',
                isNumeric: true),
            const SizedBox(height: 16),
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
                  child: const Text('Submit',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ]),
        ),
      ),
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
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget buildDropdownField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Type of insurance ',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: '*',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: _selectedDropdownValue,
          onChanged: (value) {
            setState(() {
              _selectedDropdownValue = value!;
            });
          },
          items: [
            const DropdownMenuItem<String>(
              value: null,
              child: Text('Select type'),
            ),
            ..._insuranceTypes.map((type) {
              return DropdownMenuItem<String>(
                value: type,
                child: Text(type),
              );
            }),
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

    try {
      var uri = Uri.parse('https://dev.bsure.live/v2/asset/attachment');
      var request = http.MultipartRequest('POST', uri);

      request.headers['Authorization'] = token.toString();
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
        DisplayUtils.showToast("Attachment uploaded successfully");
        var responseBody = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseBody);
        var fileUrl = jsonResponse['fileUrl'];
        var returnedAssetId = jsonResponse['assetId'];

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => NonLifeInsuranceScreen(
              assetType: widget.assetType,
            ),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => NonLifeInsuranceScreen(
              assetType: widget.assetType,
            ),
          ),
        );
      }
    } catch (e) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NonLifeInsuranceScreen(
            assetType: widget.assetType,
          ),
        ),
      );
    }
  }

  void _submitForm() async {
    if (_insuranceCompanyNameController.text.isEmpty ||
        _selectedDropdownValue == null) {
      if (_insuranceCompanyNameController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Insurance company name is required')),
        );
      }
      if (_selectedDropdownValue == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Type of insurance is required')),
        );
      }
    }

    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    if (token == null || token.isEmpty) {
      return;
    }

    final dio = Dio();
    final client = NodeClient(dio);

    try {
      final response = await client.CreateNonLifeInsurance(
        token,
        NonLifeInsuranceRequest(
          assetType: widget.assetType,
          insuranceCompanyName: _insuranceCompanyNameController.text,
          typeOfInsurance: _selectedDropdownValue,
          policyName: _policyNameController.text,
          policyNumber: _policyNumberController.text,
          comments: _commentsController.text,
          attachment: _attachmentController.text,
        ),
      );

      assetId = response.asset.assetId.toString();
      if (assetId != null) {
        submitImage();
      }

      if (response.success == 200) {
        DisplayUtils.showToast("Non-Life insurance details added successfully");
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                NonLifeInsuranceScreen(assetType: widget.assetType),
          ),
        );
      }

      setState(() {
        _selectedDropdownValue = null;
      });
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
