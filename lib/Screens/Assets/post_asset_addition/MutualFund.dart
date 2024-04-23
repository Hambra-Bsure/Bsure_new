import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/mutual_fund_screen.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/MutualFundRequest.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Repositary/Retrofit/node_api_client.dart';

class MutualFundAdd extends StatefulWidget {
  final String assetType;

  const MutualFundAdd({Key? key, required this.assetType}) : super(key: key);

  @override
  _MutualFundAddState createState() => _MutualFundAddState();
}

class _MutualFundAddState extends State<MutualFundAdd> {
  final TextEditingController _assetTypeController = TextEditingController();
  final TextEditingController _amcNameController = TextEditingController();
  final TextEditingController _schemeNameController = TextEditingController();
  final TextEditingController _folioNumberController = TextEditingController();
  final TextEditingController _fundTypeController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Mutual Fund', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            buildTextField(
              controller: _amcNameController,
              labelText: 'AMC Name',
              mandatory: true,
            ),
            const SizedBox(height: 16),
            buildTextField(
              controller: _schemeNameController,
              labelText: 'Scheme Name (Optional)',
            ),
            const SizedBox(height: 16),
            buildTextField(
              controller: _folioNumberController,
              labelText: 'Folio Number (Optional)',
            ),
            const SizedBox(height: 16),
            buildTextField(
              controller: _fundTypeController,
              labelText: 'Fund Type (Optional)',
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
                onPressed: () {
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
      print('Token is not available');
      return;
    }

    final dio = Dio();
    final client = NodeClient(dio);

    final request = MutualFundRequest(
      assetType: widget.assetType,
      amcName: _amcNameController.text,
      schemeName: _schemeNameController.text,
      folioNumber: _folioNumberController.text,
      fundType: _fundTypeController.text,
      comments: _commentsController.text,
      attachment: _attachmentController.text,
    );

    try {
      final response = await client.CreateMutualFund(token, request);
      print(response);
      // Handle the response data
      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MutualFundScreen(assetType: widget.assetType),
        ),
      );
    } catch (e) {
      print('Failed to submit data: $e');
    }

    // Clear text fields
    _assetTypeController.clear();
    _amcNameController.clear();
    _schemeNameController.clear();
    _folioNumberController.clear();
    _fundTypeController.clear();
    _commentsController.clear();
    _attachmentController.clear();
  }


  bool _validateForm() {
    if (_amcNameController.value.text.isEmpty) { // Check if AMC name is empty

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('AMC Name is required')),
      );
      return false;
    }
    return true;
  }
}
