import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/AssetModels/PostOfficeAccountRequest.dart';
import '../../Repositary/Retrofit/node_api_client.dart';
import '../../Utils/DisplayUtils.dart';
import '../get_asset_screens/post_office_account_screen.dart';

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

  File? file;
  String? fileName;
  String? downloadUrl;

  AccountType? _selectedAccountType;
  String? assetId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Post office account',
            style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextField(
              controller: _branchNameController,
              labelText: 'Branch name',
              mandatory: true,
            ),
            buildTextField(
              controller: _accountNumberController,
              labelText: 'Account number',
              isNumeric: true,
            ),
            buildAccountTypeDropdown(),
            buildTextField(
              controller: _commentsController,
              labelText: 'Comments',
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff429bb8),
                ),
                child:
                const Text('Save', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 20),
            buildFilePicker(),
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
              'Account type',
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
            ...AccountType.values.map((type) {
              return DropdownMenuItem<AccountType>(
                value: type,
                child: Text(accountTypeToString(type)),
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

  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    bool mandatory = false,
    bool isNumeric = false,
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
          keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
          inputFormatters: isNumeric
              ? [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10), // Limiting to 10 digits
            NoLeadingSpaceFormatter(),
          ]
              : [
            NoLeadingSpaceFormatter(),
          ],
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding:
            EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget buildFilePicker() {
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
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: submitImage,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff429bb8),
          ),
          child: const Text('Submit', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  Future<void> uploadFile() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.any, allowMultiple: false);

    if (result != null) {
      setState(() {
        file = File(result.files.single.path!);
        _attachmentController.text = result.files.single.name;
      });
    }
  }

  Future<void> submitImage() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    if (file == null || token == null || token.isEmpty || assetId == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PostofficeAccountScreen(
            assetType: widget.assetType,
          ),
        ),
      );
      return;
    }

    try {
      var uri = Uri.parse('http://43.205.12.154:8080/v2/asset/attachment');
      var request = http.MultipartRequest('POST', uri);

      request.headers['Authorization'] = 'Bearer $token';
      request.fields['assetId'] = assetId.toString();

      if (file != null) {
        request.files.add(await http.MultipartFile.fromPath(
          "attachment",
          file!.path,
          filename: file!.path.split('/').last,
        ));
      }

      var response = await request.send();

      if (response.statusCode == 201) {
        var responseBody = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseBody);
        var fileUrl = jsonResponse['fileUrl'];
        var returnedAssetId = jsonResponse['assetId'];

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PostofficeAccountScreen(
              assetType: widget.assetType,
            ),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PostofficeAccountScreen(
              assetType: widget.assetType,
            ),
          ),
        );
      }
    } catch (e) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PostofficeAccountScreen(
            assetType: widget.assetType,
          ),
        ),
      );
    }
  }

  void _submitForm() async {
    if (_branchNameController.text.isEmpty || _selectedAccountType == null) {
      if (_branchNameController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Branch name is required')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Account type is required')),
        );
      }
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    if (token == null || token.isEmpty) {
      return;
    }

    final dio = Dio();
    final client = NodeClient(dio);

    String accountTypeString = accountTypeToString(_selectedAccountType!);

    final request = PostOfficeAccountRequest(
      assetType: widget.assetType,
      branchName: _branchNameController.text,
      accountNumber: _accountNumberController.text,
      accountType: accountTypeString,
      comments: _commentsController.text,
      attachment: _attachmentController.text,
    );

    try {
      final response = await client.CreatePostOfficeAccount(token, request);

      setState(() {
        assetId = response.asset!.postOfficeAccount!.assetId?.toString();
      });

      if (response.success == 200) {
        DisplayUtils.showToast(
            "Post office account details added successfully");
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                PostofficeAccountScreen(assetType: widget.assetType),
          ),
        );
      }
    } catch (e) {
      // Handle errors
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
