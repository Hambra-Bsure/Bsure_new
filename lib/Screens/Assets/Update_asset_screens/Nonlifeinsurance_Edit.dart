import 'dart:convert';
import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/non_life_insurance_screen.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/get_asset_models/non_life_insurance.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Utils/DisplayUtils.dart';

class NonLifeInsuranceEdit extends StatefulWidget {
  final NonLifeInsurance nonlifeinsurance;
  final String assetType;

  const NonLifeInsuranceEdit(
      {super.key, required this.nonlifeinsurance, required this.assetType});

  @override
  State<NonLifeInsuranceEdit> createState() => _NonLifeInsuranceEditState();
}

class _NonLifeInsuranceEditState extends State<NonLifeInsuranceEdit> {
  late String insuranceCompanyName;
  late String typeOfInsurance;
  late String policyName;
  late String policyNumber;
  late String comments;
  late String attachment;

  final List<String> _insuranceTypes = [
    'Health Insurance',
    'Property Insurance',
    'Motor Insurance',
    'Other'
  ];

  String? _selectedDropdownValue; // Track selected dropdown value

  var proof;
  final TextEditingController _attachmentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the local variables with the current values
    insuranceCompanyName = widget.nonlifeinsurance.insuranceCompanyName;
    typeOfInsurance = widget.nonlifeinsurance.typeOfInsurance;
    _selectedDropdownValue = typeOfInsurance;
    policyName = widget.nonlifeinsurance.policyName;
    policyNumber = widget.nonlifeinsurance.policyNumber;
    comments = widget.nonlifeinsurance.comments;
    attachment = widget.nonlifeinsurance.attachment;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Edit non-life insurance',
            style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildTextField(
                labelText: 'Insurance company name',
                initialValue: insuranceCompanyName,
                onChanged: (value) =>
                    setState(() => insuranceCompanyName = value),
                isMandatory: true,
              ),
              const SizedBox(height: 16.0),
              buildDropdownField(),
              const SizedBox(height: 16.0),
              buildTextField(
                labelText: 'Policy name',
                initialValue: policyName,
                onChanged: (value) => setState(() => policyName = value),
                isMandatory: false,
              ),
              const SizedBox(height: 16.0),
              buildTextField(
                labelText: 'Policy number',
                initialValue: policyNumber,
                onChanged: (value) => setState(() => policyNumber = value),
                isMandatory: false,
                isNumeric: true
              ),
              const SizedBox(height: 16.0),
              buildTextField(
                labelText: 'Comments',
                initialValue: comments,
                onChanged: (value) => setState(() => comments = value),
                isMandatory: false,
              ),
              const SizedBox(height: 16.0),
              buildAttachmentField(),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  if (insuranceCompanyName.isEmpty) {
                    DisplayUtils.showToast(
                        'Please enter Insurance company name.');
                    return;
                  }

                  if (_selectedDropdownValue == null) {
                    DisplayUtils.showToast('Please select type of insurance');
                    return;
                  }

                  final updatednonlifeinsurance = NonLifeInsurance(
                    insuranceCompanyName: insuranceCompanyName,
                    typeOfInsurance: _selectedDropdownValue!,
                    policyName: policyName,
                    policyNumber: policyNumber,
                    comments: comments,
                    attachment: attachment,
                    assetId: widget.nonlifeinsurance.assetId,
                    category: widget.assetType,
                  );

                  // Call API to update bank account details
                  final response =
                      await updateNonlifeInsurance(updatednonlifeinsurance);
                  DisplayUtils.showToast('Asset updated successfully',
                      isSuccess: true);
                  Navigator.pop(context);
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => NonLifeInsuranceScreen(
                        assetType: widget.assetType,
                      ),
                    ),
                  );
                  if (response != null) {
                  } else {}
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xff429bb8), // Set background color here
                ),
                child:
                    const Text('Update', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
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
              _selectedDropdownValue = value;
              typeOfInsurance = value!;
            });
          },
          items: _insuranceTypes.map((type) {
            return DropdownMenuItem<String>(
              value: type,
              child: Text(type),
            );
          }).toList(),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
        ),
      ],
    );
  }

  Widget buildTextField({
    required String labelText,
    required String initialValue,
    required Function(String) onChanged,
    bool isMandatory = false,
    bool isNumeric = false,
  }) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        label: isMandatory
            ? RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: labelText,
                style: const TextStyle(color: Colors.black),
              ),
              const TextSpan(
                text: ' *',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        )
            : Text(labelText, style: const TextStyle(color: Colors.black)),
        border: const OutlineInputBorder(),
      ),
      onChanged: (value) {
        // Trim leading and trailing spaces
        final trimmedValue = value.trim();
        onChanged(trimmedValue);
      },
      validator: (value) {
        if (isMandatory && value!.isEmpty) {
          return 'Please enter $labelText.';
        }
        return null;
      },
      inputFormatters: isNumeric
          ? <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        NoLeadingSpaceFormatter(),
      ]
          : <TextInputFormatter>[
        NoLeadingSpaceFormatter(),
      ],
    );
  }

  Widget buildAttachmentField() {
    return Column(
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
                  hintText: "Select File",
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

  Future<NonLifeInsurance?> updateNonlifeInsurance(
      NonLifeInsurance nonLifeInsurance) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (token == null) {
      // Handle token absence or expiration here
      return null;
    }

    final dio = Dio();
    dio.options.headers["Authorization"] = token; // Add token to headers

    try {
      final response = await dio.put(
        'https://dev.bsure.live/v2/asset/${nonLifeInsurance.assetId}',
        data: nonLifeInsurance
            .toJson(), // Convert account object to JSON and send as request body
      );

      if (response.statusCode == 200) {
        return NonLifeInsurance.fromJson(jsonDecode(response.data));
      } else {
        return null; // Return null if update fails
      }
    } catch (e) {
      return null; // Return null if an error occurs
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