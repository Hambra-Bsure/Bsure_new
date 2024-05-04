import 'dart:convert';

import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/post_office_account_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/AssetModels/PostOfficeAccountRequest.dart';
import '../../Repositary/Retrofit/node_api_client.dart';

enum AccountType {
  Saving,
  Current,
  Salary,
}


class PostOfficeAccountAdd extends StatefulWidget {
  final String assetType;

  const PostOfficeAccountAdd({super.key, required this.assetType});

  @override
  _PostOfficeAccountAddState createState() => _PostOfficeAccountAddState();
}

String accountTypeToString(AccountType type) {
  return type.toString().split('.').last;
}

class _PostOfficeAccountAddState extends State<PostOfficeAccountAdd> {
  final TextEditingController _branchNameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();

  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  //AccountType? _selectedAccount;

  AccountType? _selectedAccountType;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Post Office Account',
            style: TextStyle(color: Colors.white)),
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
        const Row(
          children: [
            Text(
              'Account Type',
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
        DropdownButtonFormField<AccountType>(
          value: _selectedAccountType,
          onChanged: (value) {
            setState(() {
              _selectedAccountType = value;
            });
          },
          items: [
            // Add a null value as the default option
            const DropdownMenuItem<AccountType>(
              value: null,
              child: Text('Select Type'),
            ),
            // Add other account types
            ...AccountType.values.map((type) {
              return DropdownMenuItem<AccountType>(
                value: type,
                child: Text(accountTypeToString(type)),
              );
            }),
          ],
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
      print('Token is not available');
      return;
    }

    final dio = Dio();
    final client = NodeClient(dio);

    String accountTypeString; // Change type to String

    if (_selectedAccountType != null) {
      accountTypeString = accountTypeToString(_selectedAccountType!); // Convert AccountType to String
    } else {
      accountTypeString = accountTypeToString(AccountType.Saving); // Provide a default value
    }

    final request = PostOfficeAccountRequest(
      assetType: widget.assetType,
      branchName: _branchNameController.text,
      accountNumber: _accountNumberController.text,
      accountType: accountTypeString, // Pass the converted string
      comments: _commentsController.text,
      attachment: _attachmentController.text,
    );

    print(jsonEncode(request));

    try {
      final response = await client.CreatePostOfficeAccount(token, request);
      print(response);

      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              PostofficeAccountScreen(assetType: widget.assetType),
        ),
      );

    } catch (e) {
      // Handle errors
    }
  }

  bool _validateForm() {
    if (_branchNameController.value.text.isEmpty ||
        _selectedAccountType == null) {
      if (_branchNameController.value.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Branch Name is required')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Account Type is required')),
        );
      }
      return false;
    }
    return true;
  }
}
