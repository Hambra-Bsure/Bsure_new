import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/ppf_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Repositary/Models/AssetModels/PpfRequest.dart';
import '../../Repositary/Retrofit/node_api_client.dart';

class PpfAdd extends StatefulWidget {
  final String assetType;

  const PpfAdd({super.key, required this.assetType});

  @override
  _PpfAddState createState() => _PpfAddState();
}

class _PpfAddState extends State<PpfAdd> {
  final TextEditingController _ppfAccountNumberController =
      TextEditingController();
  final TextEditingController _institutionNameController =
      TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('PPF Account', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextField(
              controller: _ppfAccountNumberController,
              labelText: 'PPF Account Number',
              mandatory: true,
            ),
            buildTextField(
              controller: _institutionNameController,
              labelText: 'Institution Name',
              mandatory: true,
            ),
            buildTextField(
              controller: _commentsController,
              labelText: 'Comments (Optional)',
              mandatory: false,
            ),
            buildTextField(
              controller: _attachmentController,
              labelText: 'Attachment (Optional)',
              mandatory: false,
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle submit button press
                  _submitForm();
                },
                child: const Text('Submit'),
              ),
            ),
          ],
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
    var token =
        prefs.getString("token"); // Retrieve token from SharedPreferences

    // Check if token is null or empty
    if (token == null || token.isEmpty) {
      // Handle the case where token is not available

      return;
    }

    final dio = Dio();
    final client = NodeClient(dio);

    final request = PpfRequest(
      assetType: widget.assetType,
      ppfAccountNumber: _ppfAccountNumberController.text,
      institutionName: _institutionNameController.text,
      comments: _commentsController.text,
      attachment: _attachmentController.text,
    );

    try {
      final response = await client.CreatePpf(token, request);
      // Handle the response data

      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PPfScreen(assetType: widget.assetType),
        ),
      );
    } catch (e) {}
  }

  bool _validateForm() {
    if (_ppfAccountNumberController.text.isEmpty ||
        _institutionNameController.text.isEmpty) {
      if (_ppfAccountNumberController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('PPF Account Number is required')),
        );
      }
      if (_institutionNameController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Institution Name is required')),
        );
      }
      return false;
    }
    return true;
  }
}
