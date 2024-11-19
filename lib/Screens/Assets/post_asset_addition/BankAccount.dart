import 'dart:io';
import 'package:Bsure_devapp/Screens/LoginScreen.dart';
import 'package:Bsure_devapp/Screens/Utils/DisplayUtils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart'; // Required for TextInputFormatter
import '../../Repositary/Models/AssetModels/BankAccountRequest.dart';
import '../../Repositary/Models/AssetModels/PostAssetResponse.dart';
import '../../Repositary/Retrofit/node_api_client.dart';
import '../Static_names_list/Bank.dart';
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
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _ifscCodeController = TextEditingController();
  final TextEditingController _branchNameController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  AccountType? _selectedAccountType;
  String? _selectedBank;
  List<Bank> _banks = [];

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
    _fetchBankNames();
  }

  Future<void> _fetchBankNames() async {
    const url = 'http://43.205.12.154:8080/v2/asset/static/banks';

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (token == null || token.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Token'),
          content: const Text('Please log in again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Print the raw response body for debugging
        print('Response body: ${response.body}'); // <-- Add this line

        // Decode the response
        final List<dynamic> data = json.decode(response.body);

        // Check if the data is a list of strings or a list of maps
        if (data is List) {
          // Use the Bank class to create a list of Bank instances
          setState(() {
            _banks = data.map((bankJson) {
              if (bankJson is Map<String, dynamic>) {
                return Bank.fromJson(bankJson);
              } else if (bankJson is String) {
                return Bank(name: bankJson); // Adjust based on actual response
              } else {
                throw Exception('Unexpected data type: $bankJson');
              }
            }).toList();
          });

          print(
              'Fetched bank names: ${_banks.map((bank) => bank.name).toList()}');
        }
      } else {
        print('Failed to load bank names. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching bank names: $e');
    }
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
              buildBankDropdown(),
              buildTextField(
                  controller: _accountNumberController,
                  labelText: 'Account number',
                  mandatory: false,
                  isNumeric: true),
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
                            hintText: "Attachemnt you want to upload(optional)",
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
                          'Choose file',
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
                      await _submitForm();
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
    bool capitalizeFirstLetter = false,
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
                  fontSize: 16, // Adjust size for better visibility
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          inputFormatters: isNumeric
              ? [
            FilteringTextInputFormatter.digitsOnly,
            NoLeadingSpaceFormatter()
          ]
              : [NoLeadingSpaceFormatter()],
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding:
            EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
          keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
          textCapitalization: capitalizeFirstLetter
              ? TextCapitalization.words
              : TextCapitalization.none,
        ),
      ],
    );
  }


  Widget buildBankDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              'Bank name',
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
        DropdownButtonFormField<String>(
          value: _selectedBank ?? '',
          isExpanded: true,
          // Set isExpanded to true
          onChanged: (value) {
            setState(() {
              _selectedBank = value;
            });
          },
          items: [
            const DropdownMenuItem<String>(
              value: '',
              child: Text('Select Bank Name'),
            ),
            ..._banks.map((bank) {
              return DropdownMenuItem<String>(
                value: bank.name,
                child: Text(bank.name),
              );
            }).toList(),
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
    // Validate the form inputs
    if (_selectedBank == null ||
        _branchNameController.text.trim().isEmpty ||
        _selectedAccountType == null) {
      // Display appropriate error messages based on which field is empty
      if (_selectedBank == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Bank name is required')),
        );
      } else if (_branchNameController.text.trim().isEmpty) {
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

    // Get token from SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    if (token == null || token.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Token'),
          content: const Text('Please log in again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    // Create Dio and API client instance
    final dio = Dio();
    final client = NodeClient(dio);

    // Set a default account type if _selectedAccountType is null
    final accountType = _selectedAccountType ?? AccountType.Saving;

    // Prepare the request object
    final req = BankAccountRequest(
      assetType: widget.assetType,
      bankName: _selectedBank ?? '',
      // Assuming _selectedBank has a name property
      accountNumber: _accountNumberController.text.trim(),
      ifscCode: _ifscCodeController.text.trim(),
      branchName: _branchNameController.text.trim(),
      accountType: accountType,
      comments: _commentsController.text.trim(),
      // TODO: remove attachment field from all the assets
    );

    try {
      // Make the API call to create the bank account
      final PostAssetResponse response =
          await client.CreateBankAccount(token, req);

      DisplayUtils.showToast("Bank account details added successfully");

      // Extract assetId from the response
      String? assetId = response.asset?.assetId?.toString();

      if (assetId != null) {
        // If assetId is available, submit the image
        await submitImage();
      }

      // Now you can use the assetId as needed
      print('Asset ID: $assetId');
    } on DioError catch (e) {
      // Handle DioError and print the response or message
      if (e.response != null) {
        print('Error response: ${e.response}');
      } else {
        print('Error message: ${e.message}');
      }

      // Display an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: ${e.message}')),
      );
    } catch (e) {
      // Handle any other errors
      print('An unexpected error occurred: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An unexpected error occurred')),
      );
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

    if (token == null || token.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Token'),
          content: const Text('Please log in again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    try {
      var uri = Uri.parse(
          'https://dev.bsure.live/v2/asset/attachment'); // Update the URL to your API endpoint
      var request = http.MultipartRequest('POST', uri);

      // Set headers
      request.headers['Authorization'] = token.toString();

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

      if (response.statusCode == 201) {
        DisplayUtils.showToast("Attachment uploaded successfully ");
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
