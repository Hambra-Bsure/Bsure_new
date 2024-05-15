import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:Bsure_devapp/Screens/Repositary/Retrofit/node_api_client.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/NonLifeInsuranceRequest.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  String? _selectedDropdownValue; // Track selected dropdown value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Non-Life Insurance',
            style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextField(
                controller: _insuranceCompanyNameController,
                labelText: 'Insurance Company Name',
                mandatory: true,
              ),
              const SizedBox(height: 16),
              buildDropdownField(),
              const SizedBox(height: 16),
              buildTextField(
                controller: _policyNameController,
                labelText: 'Policy Name (Optional)',
              ),
              const SizedBox(height: 16),
              buildTextField(
                controller: _policyNumberController,
                labelText: 'Policy Number (Optional)',
              ),
              const SizedBox(height: 16),
              buildTextField(
                controller: _commentsController,
                labelText: 'Comments (Optional)',
              ),
              const SizedBox(height: 16),
              buildTextField(
                controller: _attachmentController,
                labelText: 'Attachment (Optional)',
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor : const Color(0xff429bb8), // Set background color here
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

  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    bool mandatory = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: labelText,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (mandatory)
                const TextSpan(
                  text: ' *',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
        ),
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
                text: 'Type of Insurance ',
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
              child: Text('Select Type'),
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

  void _submitForm() async {
    if (!_validateForm()) {
      return;
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

      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              NonLifeInsuranceScreen(assetType: widget.assetType),
        ),
      );

      _insuranceCompanyNameController.clear();
      _policyNameController.clear();
      _policyNumberController.clear();
      _commentsController.clear();
      _attachmentController.clear();

      setState(() {
        _selectedDropdownValue = null;
      });
    } catch (e) {}
  }

  bool _validateForm() {
    if (_insuranceCompanyNameController.text.isEmpty ||
        _selectedDropdownValue == null) {
      if (_insuranceCompanyNameController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Insurance Company Name is required')),
        );
      }
      if (_selectedDropdownValue == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Type of Insurance is required')),
        );
      }
      return false;
    }
    return true;
  }
}
