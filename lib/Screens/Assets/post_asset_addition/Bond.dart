import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Repositary/Models/AssetModels/BondRequest.dart';
import '../../Repositary/Retrofit/node_api_client.dart';
import '../get_asset_screens/bond_screen.dart';

class BondAdd extends StatefulWidget {
  final String assetType;

  const BondAdd({Key? key, required this.assetType}) : super(key: key);

  @override
  _BondAddState createState() => _BondAddState();
}

class _BondAddState extends State<BondAdd> {
  final TextEditingController _assetTypeController = TextEditingController();
  final TextEditingController _bondNameController = TextEditingController();
  final TextEditingController _bondNumberController = TextEditingController();
  final TextEditingController _authorityController = TextEditingController();
  final TextEditingController _typeOfBondController = TextEditingController();
  final TextEditingController _maturityDateController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Bond', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextField(
              controller: _bondNameController,
              labelText: 'Bond Name',
              mandatory: true,
            ),
            buildTextField(
              controller: _bondNumberController,
              labelText: 'Bond Number',
              mandatory: true,
            ),
            buildTextField(
              controller: _authorityController,
              labelText: 'Authority Who Issued The Bond',
              mandatory: true,
            ),
            buildTextField(
              controller: _typeOfBondController,
              labelText: 'Type of Bond',
              mandatory: true,
            ),
            buildDateField(
              controller: _maturityDateController,
              labelText: 'Maturity Date',
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
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _maturityDateController.text = picked.toIso8601String();
      });
    }
  }


  // Inside your _submitForm method
  Future<void> _submitForm() async {
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

    final request = BondRequest(
      assetType: widget.assetType,
      bondName: _bondNameController.text,
      bondNumber: _bondNumberController.text,
      authorityWhoIssuedTheBond: _authorityController.text,
      typeOfBond: _typeOfBondController.text,
      maturityDate: _maturityDateController.text == ""
          ? null
          : _maturityDateController
          .text,
      comments: _commentsController.text,
      attachment: _attachmentController.text,
    );

    try {
      final response = await client.CreateBond(token, request);
      print(response); // Handle the response data

      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BondScreen(assetType: widget.assetType),
        ),
      );

    } catch (e) {
      print('Failed to submit data: $e');
    }
  }

  bool _validateForm() {
    if (_bondNameController.text.isEmpty ||
        _bondNumberController.text.isEmpty ||
        _authorityController.text.isEmpty ||
        _typeOfBondController.text.isEmpty ||
        _maturityDateController.text.isEmpty) {
      if (_bondNameController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Bond Name is required')),
        );
      } else if (_bondNumberController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Bond Number is required')),
        );
      } else if (_authorityController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Authority Who Issued The Bond is required')),
        );
      } else if (_typeOfBondController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Type of Bond is required')),
        );
      } else if (_maturityDateController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Maturity Date is required')),
        );
      }
      return false;
    }
    return true;
  }
}
