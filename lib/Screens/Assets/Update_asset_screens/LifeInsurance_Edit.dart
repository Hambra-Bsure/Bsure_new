import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../LoginScreen.dart';
import '../../Repositary/Models/get_asset_models/life_Insurance.dart';
import '../../Utils/DisplayUtils.dart';
import '../Static_names_list/LifeInsurance.dart';
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

  String? _selectedLifeInsurance;
  List<Insurance> _lifeInsurance = [];

  @override
  void initState() {
    super.initState();

    _fetchLifeInsuranceNames();
    // Initialize the local variables with the current values
    insuranceCompanyName = widget.insurance.insuranceCompanyName;
    policyName = widget.insurance.policyName ?? "";
    policyNumber = widget.insurance.policyNumber ?? "";
    coverageAmount = widget.insurance.coverageAmount != null
        ? widget.insurance.coverageAmount.toString()
        : ''; // Initialize coverage amount with empty string if null
    maturityDate = widget.insurance.maturityDate != null
        ? DateTime.parse(widget.insurance.maturityDate!)
        : null; // Use null as default value
    _maturityDateController.text = maturityDate != null
        ? formatDate(maturityDate!)
        : ''; // Format DateTime to string
    comments = widget.insurance.comments ?? "";
    attachment = widget.insurance.attachment ?? "";
  }

  Future<void> _fetchLifeInsuranceNames() async {
    const url =
        'http://43.205.12.154:8080/v2/asset/static/lifeInsuranceCompanies';

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
                return Insurance.fromJson(insuranceJson); // Map to Insurance
              } else if (insuranceJson is String) {
                return Insurance(
                    name: insuranceJson); // For cases where it's a plain string
              } else {
                throw Exception('Unexpected data type: $insuranceJson');
              }
            }).toList();

            _selectedLifeInsurance = _lifeInsurance
                .firstWhere((bank) =>
                    bank.name == widget.insurance.insuranceCompanyName)
                .name;
          });

          // Print fetched insurance names
          print(
              'Fetched insurance company names: ${_lifeInsurance.map((insurance) => insurance.name).toList()}');
        }
      } else {
        print(
            'Failed to load insurance names. Status code: ${response.statusCode}');
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
        title: const Text('Edit life insurance',
            style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildLifeInsuranceDropdown(),
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
                  isNumeric: true),
              const SizedBox(height: 16.0),
              buildTextField(
                  labelText: 'Coverage amount',
                  initialValue: coverageAmount,
                  onChanged: (value) => setState(() => coverageAmount = value),
                  isMandatory: false,
                  isNumeric: true),
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
                    DisplayUtils.showToast(
                        'Please enter Insurance company name.');
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
                    insuranceCompanyName: _selectedLifeInsurance ?? '',
                    policyName: policyName,
                    policyNumber: policyNumber,
                    coverageAmount: parsedCoverageAmount,
                    maturityDate: maturityDateText,
                    // Use nullable string
                    comments: comments,
                    attachment: attachment,
                    assetId: widget.insurance.assetId,
                    category: widget.assetType,
                  );

                  // Call API to update insurance details
                  final response = await updateInsurance(updatedInsurance);

                  DisplayUtils.showToast('Life insurance asset details updated successfully');
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
    }

    final dio = Dio();
    dio.options.headers["Authorization"] = token; // Add token to headers

    try {
      final response = await dio.put(
        'https://dev.bsure.live/v2/asset/${insurance.assetId}',
        data: insurance.toJson(),
      );

      await _submitImage();

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

  Future<void> _submitImage() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (proof == null || token == null) {
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

    final formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(proof.path),
    });

    final dio = Dio();
    dio.options.headers["Authorization"] = token;

    try {
      await dio.post(
        "https://dev.bsure.live/v2/asset/${widget.insurance.assetId}/upload",
        data: formData,
      );
    } catch (e) {
      DisplayUtils.showToast('Failed to upload file');
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
