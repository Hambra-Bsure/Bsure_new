import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/post_office_account_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/get_asset_models/post_office_account.dart';
import '../../Repositary/Models/AssetModels/PostOfficeAccountRequest.dart';
import '../../Repositary/Retrofit/node_api_client.dart';

class PostOfficeAccountAdd extends StatefulWidget {
  final String assetType;

  const PostOfficeAccountAdd({Key? key, required this.assetType})
      : super(key: key);

  @override
  _PostOfficeAccountAddState createState() => _PostOfficeAccountAddState();
}



enum AccountTypePost {
  Saving,
  Current,
  Salary,
}

class _PostOfficeAccountAddState extends State<PostOfficeAccountAdd> {
  final TextEditingController _branchNameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();

  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  AccountTypePost? _selectedAccount;

  AccountTypePost _selectedAccountType = AccountTypePost.Saving;

  String accountTypeToString(AccountTypePost type) {
    return type.toString().split('.').last;
  }

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
        DropdownButtonFormField<AccountTypePost>(
          value: _selectedAccountType,
          onChanged: (value) {
            setState(() {
              _selectedAccountType = value!;
            });
          },
          items: AccountTypePost.values.map((type) {
            return DropdownMenuItem<AccountTypePost>(
              value: type,
              child: Text(accountTypeToString(type)),
            );
          }).toList(),
          decoration: const InputDecoration(
            border: OutlineInputBorder(), // Adding border to dropdown field
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
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
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    if (token == null || token.isEmpty) {
      print('Token is not available');
      return;
    }

    final dio = Dio();
    final client = NodeClient(dio);

    final request = PostOfficeAccountRequest(
      assetType: widget.assetType,
      branchName: _branchNameController.text,
      accountNumber: _accountNumberController.text,
      accountType: _selectedAccountType.toString(),
      // Convert enum to string
      comments: _commentsController.text,
      attachment: _attachmentController.text,
    );

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

      Navigator.pop(context); // Close the current screen
    } catch (e) {
      // Handle errors
    }
  }
}
