import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/get_asset_models/life_Insurance.dart';
import '../../Utils/DisplayUtils.dart';
import '../get_asset_screens/life_insurance_screen.dart';

class LifeInsuranceEdit extends StatefulWidget {
  final LifeInsurance insurance;
  final String assetType;

  LifeInsuranceEdit({
    Key? key,
    required this.insurance,
    required this.assetType,
  }) : super(key: key);

  @override
  State<LifeInsuranceEdit> createState() => _LifeInsuranceEditState();
}

class _LifeInsuranceEditState extends State<LifeInsuranceEdit> {
  late String insuranceCompanyName;
  late String policyName;
  late String policyNumber;
  late String coverageAmount;
  late DateTime? maturityDate; // Change to nullable DateTime
  late String comments;
  late String attachment;

  var proof;
  final TextEditingController _attachmentController = TextEditingController();
  final TextEditingController _maturityDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the local variables with the current values
    insuranceCompanyName = widget.insurance.insuranceCompanyName;
    policyName = widget.insurance.policyName;
    policyNumber = widget.insurance.policyNumber;
    coverageAmount = widget.insurance.coverageAmount != null
        ? widget.insurance.coverageAmount.toString()
        : ''; // Initialize coverage amount with empty string if null
    maturityDate = widget.insurance.maturityDate != null
        ? DateTime.parse(widget.insurance.maturityDate!)
        : null; // Use null as default value
    _maturityDateController.text = maturityDate != null ? formatDate(maturityDate!) : ''; // Format DateTime to string
    comments = widget.insurance.comments;
    attachment = widget.insurance.attachment;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Edit life insurance',
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
                labelText: 'Coverage amount',
                initialValue: coverageAmount,
                onChanged: (value) => setState(() => coverageAmount = value),
                isMandatory: false,
                isNumeric: true
              ),
              const SizedBox(height: 16.0),
              buildDateField(
                controller: _maturityDateController,
                labelText: 'Maturity date',
                mandatory: false,
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
                  // Validate fields
                  if (insuranceCompanyName.isEmpty) {
                    DisplayUtils.showToast('Please enter Insurance company name.');
                    return;
                  }

                  // Prepare the payload
                  int? parsedCoverageAmount; // Use nullable int
                  if (coverageAmount.isNotEmpty) {
                    try {
                      parsedCoverageAmount = int.parse(coverageAmount);
                    } catch (e) {
                      DisplayUtils.showToast('Invalid coverage amount.');
                      return;
                    }
                  }

                  String? maturityDateText; // Use nullable string
                  if (_maturityDateController.text.isNotEmpty) {
                    maturityDateText = _maturityDateController.text;
                  }

                  final updatedInsurance = LifeInsurance(
                    insuranceCompanyName: insuranceCompanyName,
                    policyName: policyName,
                    policyNumber: policyNumber,
                    coverageAmount: parsedCoverageAmount,
                    maturityDate: maturityDateText, // Use nullable string
                    comments: comments,
                    attachment: attachment,
                    assetId: widget.insurance.assetId,
                    category: widget.assetType,
                  );

                  // Call API to update insurance details
                  final response = await updateInsurance(updatedInsurance);

                  DisplayUtils.showToast('Asset updated successfully');
                  Navigator.pop(context);
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          LifeInsuranceScreen(assetType: widget.assetType),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff429bb8), // Set background color here
                ),
                child: const Text('Update', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
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
          onTap: () {
            _selectDate(context);
          },
          child: IgnorePointer(
            child: TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        maturityDate = picked; // Assign DateTime directly
        _maturityDateController.text =
            formatDate(maturityDate!); // Update text field
      });
    }
  }

  String formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
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

  Future<LifeInsurance?> updateInsurance(LifeInsurance insurance) async {
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
        'http://43.205.12.154:8080/v2/asset/${insurance.assetId}',
        data: insurance.toJson(),
      );

      if (response.statusCode == 200) {
        // Assuming the API returns the updated insurance details in the response
        final responseData = response.data;
        if (responseData is Map<String, dynamic>) {
          // Ensure the API response is correctly parsed into LifeInsurance object
          return LifeInsurance.fromJson(responseData);
        } else {
          throw Exception('Invalid response data');
        }
      } else {
        print('Failed to update asset: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Dio error: $e');
      return null;
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