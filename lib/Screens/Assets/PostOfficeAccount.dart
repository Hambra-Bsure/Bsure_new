import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Repositary/Models/AssetModels/PostOfficeAccountRequest.dart';
import '../Repositary/Retrofit/node_api_client.dart';

class PostOfficeAccountScreen extends StatefulWidget {
  final String assetType;

  const PostOfficeAccountScreen({Key? key, required this.assetType}) : super(key: key);

  @override
  _PostOfficeAccountScreenState createState() => _PostOfficeAccountScreenState();
}

class _PostOfficeAccountScreenState extends State<PostOfficeAccountScreen> {
  final TextEditingController _branchNameController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();
  AccountType? _selectedAccountType; // Change to AccountType enum

  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Post Office Account', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextField(
              controller: _branchNameController,
              labelText: 'Branch Name',
              mandatory: true,
            ),
            buildTextField(
              controller: _accountNumberController,
              labelText: 'Account Number (Optional)',
              mandatory: false,
            ),
            buildAccountTypeDropdown(), // Account Type Dropdown
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
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAccountTypeDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Account Type',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<AccountType>(
          value: _selectedAccountType,
          onChanged: (value) {
            setState(() {
              _selectedAccountType = value;
            });
          },
          items: AccountType.values.map((type) {
            return DropdownMenuItem<AccountType>(
              value: type,
              child: Text(type.toString().split('.').last),
            );
          }).toList(),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
        ),
      ],
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
            contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
        ),
      ],
    );
  }

  void _submitForm() async {
    const String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.'
        'eyJ1c2VySWQiOjIsInVzZXJFbWFpbCI6bnVsbCwidXNlck1vYmlsZSI6IjgzM'
        'jg1NjQ2ODMiLCJpYXQiOjE3MTIzMTkyMTUsImV4cCI6MTcxMjkyNDAxNX0.'
        'bh3HdNwm5-SYVIRwkqVl5z3giOUY9kTGSk7pV7aedwc';

    final dio = Dio();
    final client = NodeClient(dio);

    final request = PostOfficeAccountRequest(
      assetType: widget.assetType,
      branchName: _branchNameController.text,
      accountNumber: _accountNumberController.text,
      accountType: _selectedAccountType, // Convert enum to string
      comments: _commentsController.text,
      attachment: _attachmentController.text,
    );

    try {
      final response = await client.CreatePostOfficeAccount(token, request);
      // Handle the response as needed
    } catch (e) {
      // Handle errors
    }
  }
}
