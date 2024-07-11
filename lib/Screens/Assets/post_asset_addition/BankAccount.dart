import 'dart:io';
import 'package:Bsure_devapp/Screens/Utils/DisplayUtils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart'; // Required for TextInputFormatter
import '../../Repositary/Models/AssetModels/BankAccountRequest.dart';
import '../../Repositary/Models/AssetModels/BankAccountResponse.dart';
import '../../Repositary/Retrofit/node_api_client.dart';
import '../get_asset_screens/bank_account_screen.dart';

enum AccountType {
  Saving,
  Current,
  Salary,
}

class BankAccountAdd extends StatefulWidget {
  final String assetType;

  const BankAccountAdd({super.key, required this.assetType});

  @override
  _BankAccountAddState createState() => _BankAccountAddState();
}

String accountTypeToString(AccountType type) {
  return type.toString().split('.').last;
}

class _BankAccountAddState extends State<BankAccountAdd> {
  final TextEditingController _assetTypeController = TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _accountNumberController =
  TextEditingController();
  final TextEditingController _ifscCodeController = TextEditingController();
  final TextEditingController _branchNameController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  AccountType? _selectedAccountType;

  File? file;
  String? fileName;
  String? downloadUrl;
  String? assetId;

  Color color1 = const Color(0xff429bb8);
  String url = "";
  var name;
  var proof;

  @override
  void initState() {
    super.initState();
    _assetTypeController.text = widget.assetType;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title:
        const Text('Bank account', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextField(
                controller: _bankNameController,
                labelText: 'Bank name',
                mandatory: true,
              ),
              buildTextField(
                controller: _accountNumberController,
                labelText: 'Account number',
                mandatory: false,
                isNumeric: true
              ),
              buildTextField(
                controller: _ifscCodeController,
                labelText: 'IFSC code',
                mandatory: false,
              ),
              buildTextField(
                controller: _branchNameController,
                labelText: 'Branch name',
                mandatory: true,
              ),
              buildAccountTypeDropdown(),
              buildTextField(
                controller: _commentsController,
                labelText: 'Comments',
                mandatory: false,
              ),
              const SizedBox(height: 20),
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
              Column(
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
                      // Change the label for picking a file
                      ElevatedButton(
                        onPressed: uploadFile,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff429bb8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.01,
                            horizontal:
                            MediaQuery.of(context).size.width * 0.03,
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
                    onPressed: () async {
                      await submitImage();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff429bb8),
                    ),
                    child: const Text('Submit',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
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
          inputFormatters: isNumeric
              ? [FilteringTextInputFormatter.digitsOnly, NoLeadingSpaceFormatter()]
              : [NoLeadingSpaceFormatter()],
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding:
            EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
          keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
        ),
      ],
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
            const DropdownMenuItem<AccountType>(
              value: null,
              child: Text('Select type'),
            ),
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

  Future<void> _submitForm() async {
    if (_bankNameController.value.text.trim().isEmpty ||
        _branchNameController.value.text.trim().isEmpty ||
        _selectedAccountType == null) {
      if (_bankNameController.value.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Bank name is required')),
        );
      } else if (_branchNameController.value.text.trim().isEmpty) {
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

    final accountType = _selectedAccountType ?? AccountType.Saving; // Provide a default value if needed

    final req = BankAccountRequest(
      assetType: widget.assetType,
      bankName: _bankNameController.value.text.trim(),
      accountNumber: _accountNumberController.value.text.trim(),
      ifscCode: _ifscCodeController.value.text.trim(),
      branchName: _branchNameController.value.text.trim(),
      accountType: accountType,
      comments: _commentsController.value.text.trim(),
      attachment: downloadUrl ?? '', // Use the file URL obtained from the server
    );

    try {
      final BankAccountResponse response =
      await client.CreateBankAccount(token, req);

      setState(() {
        assetId = response.asset!.bankAccount!.assetId?.toString();
      });

      // Now you can use the assetId as needed
      print('Asset ID: $assetId');
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response);
      } else {
        print(e.message);
      }
    }
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

  Future<void> submitImage() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    if (proof == null || token == null || token.isEmpty || assetId == null) {
      // If any of the conditions are not met, return and navigate to the next screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BankAccountsScreen(
            assetType: widget.assetType,
          ),
        ),
      );
      return;
    }

    try {
      var uri = Uri.parse(
          'http://43.205.12.154:8080/v2/asset/attachment'); // Update the URL to your API endpoint
      var request = http.MultipartRequest('POST', uri);

      // Set headers
      request.headers['Authorization'] = token;

      // Add asset ID as a field
      request.fields['assetId'] = assetId.toString();

      if (proof != null) {
        request.files.add(http.MultipartFile.fromBytes(
          "attachment",
          proof.bytes!,
          filename: proof.name,
        ));
      }

      var response = await request.send();
      print(response);

      if (response.statusCode == 200) {
        DisplayUtils.showToast("Bank details added successfully");
        var responseBody = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseBody);
        var fileUrl = jsonResponse[
        'fileUrl']; // Assuming the server returns the file URL in 'fileUrl' key
        var returnedAssetId = jsonResponse[
        'assetId']; // Assuming the server returns the asset ID in 'assetId' key
        // Handle the file URL and asset ID
        print('File URL: $fileUrl');
        print('Asset ID: $returnedAssetId');

        // Navigate to the BankAccountsScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BankAccountsScreen(
              assetType: widget.assetType,
            ),
          ),
        );
      } else {
        // Handle error response
        print('Failed to upload file: ${response.statusCode}');
        // Navigate to the BankAccountsScreen even if upload fails
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BankAccountsScreen(
              assetType: widget.assetType,
            ),
          ),
        );
      }
    } catch (e) {
      // Handle exception
      print('Error uploading file: $e');
      // Navigate to the BankAccountsScreen in case of error
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BankAccountsScreen(
            assetType: widget.assetType,
          ),
        ),
      );
    }
  }
}

class NoLeadingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    if (newValue.text.startsWith(' ')) {
      return oldValue;
    }
    return newValue;
  }
}
