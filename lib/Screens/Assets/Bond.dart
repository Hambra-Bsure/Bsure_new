import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Repositary/Models/AssetModels/BondRequest.dart';
import '../Repositary/Retrofit/node_api_client.dart';

class BondScreen extends StatefulWidget {
  final String assetType;

  const BondScreen({Key? key, required this.assetType}) : super(key: key);

  @override
  _BondScreenState createState() => _BondScreenState();
}

class _BondScreenState extends State<BondScreen> {
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
            contentPadding: EdgeInsets.symmetric(
                vertical: 12.0, horizontal: 16.0),
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
                contentPadding: EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
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
        _maturityDateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  // Inside your _submitForm method
  Future<void> _submitForm() async {
    const String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.'
        'eyJ1c2VySWQiOjIsInVzZXJFbWFpbCI6bnVsbCwidXNlck1vYmlsZSI6IjgzM'
        'jg1NjQ2ODMiLCJpYXQiOjE3MTIzMTkyMTUsImV4cCI6MTcxMjkyNDAxNX0.'
        'bh3HdNwm5-SYVIRwkqVl5z3giOUY9kTGSk7pV7aedwc'; // Replace with your actual token

    final dio = Dio();
    final client = NodeClient(dio);

    final request = BondRequest(
      assetType: widget.assetType,
      bondName: _bondNameController.text,
      bondNumber: _bondNumberController.text,
      authorityWhoIssuedTheBond: _authorityController.text,
      typeOfBond: _typeOfBondController.text,
      maturityDate: _maturityDateController.text,
      comments: _commentsController.text,
      attachment: _attachmentController.text,
    );

    try {
      final response = await client.CreateBond(token, request);
      print(response); // Handle the response data
    } catch (e) {
      print('Failed to submit data: $e');
    }
  }
}
