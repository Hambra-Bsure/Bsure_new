import 'dart:convert';
import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/post_office_account_screen.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/get_asset_models/post_office_account.dart';
import '../../Utils/DisplayUtils.dart';


class PostOfficeAccountEdit extends StatefulWidget {
  final PostOfficeAccount postOffice;
  final String assetType;

  const PostOfficeAccountEdit(
      {super.key, required this.postOffice, required this.assetType});

  @override
  _PostOfficeAccountEditState createState() => _PostOfficeAccountEditState();
}

class _PostOfficeAccountEditState extends State<PostOfficeAccountEdit> {
  late String branchName;
  late String accountNumber;
  late String comments;
  late String attachment;

  AccountType? _selectedAccountType;
  var proof;
  final TextEditingController _attachmentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    branchName = widget.postOffice.branchName;
    accountNumber = widget.postOffice.accountNumber;
    _selectedAccountType = stringToAccountType(widget.postOffice.accountType);
    comments = widget.postOffice.comments;
    attachment = widget.postOffice.attachment;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Edit post office account',
            style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildTextField(
                labelText: 'Branch name',
                initialValue: branchName,
                onChanged: (value) => setState(() => branchName = value),
                isMandatory: true,
              ),
              const SizedBox(height: 10),
              buildTextField(
                labelText: 'Account number',
                initialValue: accountNumber,
                onChanged: (value) => setState(() => accountNumber = value),
                isMandatory: false,
                isNumeric: true
              ),
              const SizedBox(height: 10),
              buildAccountTypeDropdown(),
              const SizedBox(height: 10),
              buildTextField(
                labelText: 'Comments',
                initialValue: comments,
                onChanged: (value) => setState(() => comments = value),
                isMandatory: false,
              ),
              const SizedBox(height: 10),
              buildAttachmentField(),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  if (branchName.isEmpty) {
                    DisplayUtils.showToast('Please enter Branch name');
                    return;
                  }
                  if (_selectedAccountType == null) {
                    DisplayUtils.showToast('Please select Account type');
                    return;
                  }

                  final updatedPostOfficeAccount = PostOfficeAccount(
                    branchName: branchName,
                    accountNumber: accountNumber,
                    accountType: accountTypeToString(_selectedAccountType!),
                    comments: comments,
                    attachment: attachment,
                    assetId: widget.postOffice.assetId,
                    category: widget.assetType,
                  );

                  // Call API to update non-life insurance details
                  final response =
                      await updatePostOfficeAccount(updatedPostOfficeAccount);

                  DisplayUtils.showToast('Asset updated successfully');

                  Navigator.pop(context);
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          PostofficeAccountScreen(assetType: widget.assetType),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xff429bb8), // Set background color here
                ),
                child:
                    const Text('Update', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required String labelText,
    required String initialValue,
    required Function(String) onChanged,
    bool isMandatory = false,
    bool isNumeric = false,
  }) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        label: isMandatory
            ? RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: labelText,
                style: const TextStyle(color: Colors.black),
              ),
              const TextSpan(
                text: ' *',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        )
            : Text(labelText, style: const TextStyle(color: Colors.black)),
        border: const OutlineInputBorder(),
      ),
      onChanged: (value) {
        // Trim leading and trailing spaces
        final trimmedValue = value.trim();
        onChanged(trimmedValue);
      },
      validator: (value) {
        if (isMandatory && value!.isEmpty) {
          return 'Please enter $labelText.';
        }
        return null;
      },
      inputFormatters: isNumeric
          ? <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        NoLeadingSpaceFormatter(),
      ]
          : <TextInputFormatter>[
        NoLeadingSpaceFormatter(),
      ],
    );
  }

  Widget buildAttachmentField() {
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
      ],
    );
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
            const DropdownMenuItem<AccountType>(
              value: null,
              child: Text('Select Type'),
            ),
            ...AccountType.values.map((type) {
              return DropdownMenuItem<AccountType>(
                value: type,
                child: Text(accountTypeToString(type)),
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

  Future<PostOfficeAccount?> updatePostOfficeAccount(
      PostOfficeAccount postOfficeAccount) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      // Handle token absence or expiration here
      return null;
    }

    final dio = Dio();
    dio.options.headers['Authorization'] = token; // Add token to headers

    try {
      final response = await dio.put(
        'http://43.205.12.154:8080/v2/asset/${postOfficeAccount.assetId}',
        data: postOfficeAccount
            .toJson(), // Convert account object to JSON and send as request body
      );

      if (response.statusCode == 200) {
        //DisplayUtils.showToast("PostOfficeAccount Details Updated Successfully");
        return PostOfficeAccount.fromJson(jsonDecode(response.data));
      } else {
        return null; // Return null if update fails
      }
    } catch (e) {
      return null; // Handle error
    }
  }
}


enum AccountType { saving, current, salary }

String accountTypeToString(AccountType accountType) {
  switch (accountType) {
    case AccountType.saving:
      return 'Saving';
    case AccountType.current:
      return 'Current';
    case AccountType.salary:
      return 'Salary';
    default:
      return '';
  }
}

AccountType? stringToAccountType(String accountType) {
  switch (accountType) {
    case 'Saving':
      return AccountType.saving;
    case 'Current':
      return AccountType.current;
    case 'Salary':
      return AccountType.salary;
    default:
      return null;
  }
}

class NoLeadingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.startsWith(' ')) {
      return oldValue;
    }
    return newValue;
  }
}