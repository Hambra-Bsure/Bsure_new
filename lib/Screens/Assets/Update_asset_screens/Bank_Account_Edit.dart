import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/get_asset_models/bank_account.dart';
import '../../Utils/DisplayUtils.dart';
import '../get_asset_screens/bank_account_screen.dart';

enum AccountType {
  Saving,
  Current,
  Salary,
}

class BankAccountEdit extends StatefulWidget {
  final BankAccount account;
  final String assetType;

  const BankAccountEdit({Key? key, required this.account, required this.assetType})
      : super(key: key);

  @override
  State<BankAccountEdit> createState() => _BankAccountEditState();
}

class _BankAccountEditState extends State<BankAccountEdit> {
  late String bankName;
  late String accountNumber;
  late String ifscCode;
  late String branchName;
  late AccountType accountType;
  late String comments;
  late String attachment;

  var proof;
  final TextEditingController _attachmentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    bankName = widget.account.bankName;
    accountNumber = widget.account.accountNumber ?? "";
    ifscCode = widget.account.ifscCode ?? "";
    branchName = widget.account.branchName;
    accountType = parseAccountType(widget.account.accountType);
    comments = widget.account.comments ?? "";
    attachment = widget.account.attachment ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Edit bank account', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildTextField(
                labelText: 'Bank name',
                initialValue: bankName,
                onChanged: (value) => setState(() => bankName = value),
                isMandatory: true,
              ),
              const SizedBox(height: 12.0),
              buildTextField(
                labelText: 'Account number',
                initialValue: accountNumber,
                onChanged: (value) => setState(() => accountNumber = value),
                isNumeric: true,
              ),
              const SizedBox(height: 12.0),
              buildTextField(
                labelText: 'IFSC code',
                initialValue: ifscCode,
                onChanged: (value) => setState(() => ifscCode = value),
              ),
              const SizedBox(height: 12.0),
              buildTextField(
                labelText: 'Branch name',
                initialValue: branchName,
                onChanged: (value) => setState(() => branchName = value),
                isMandatory: true,
              ),
              const SizedBox(height: 12.0),
              buildAccountTypeDropdown(),
              const SizedBox(height: 12.0),
              buildTextField(
                labelText: 'Comments',
                initialValue: comments,
                onChanged: (value) => setState(() => comments = value),
              ),
              const SizedBox(height: 12.0),
              buildAttachmentField(),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _updateBankAccount,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff429bb8),
                ),
                child: const Text('Update', style: TextStyle(color: Colors.white)),
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
        final trimmedValue = value.trim();
        onChanged(trimmedValue);
      },
      inputFormatters: isNumeric
          ? <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ]
          : <TextInputFormatter>[],
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
                  hintText: "Attachment you want to upload (optional)",
                  hintStyle: TextStyle(fontSize: 16),
                ),
                readOnly: true,
                onTap: _uploadFile,
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: _uploadFile,
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
      ],
    );
  }

  Future<void> _uploadFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.any, allowMultiple: false);

    if (result != null) {
      setState(() {
        proof = result.files.single;
        _attachmentController.text = proof.name;
      });
    }
  }

  Widget buildAccountTypeDropdown() {
    return DropdownButtonFormField<AccountType>(
      value: accountType,
      onChanged: (value) {
        setState(() {
          accountType = value!;
        });
      },
      items: AccountType.values.map((type) {
        return DropdownMenuItem<AccountType>(
          value: type,
          child: Text(type.toString().split('.').last),
        );
      }).toList(),
      decoration: InputDecoration(
        label: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Account Type',
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text: ' *',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        border: const OutlineInputBorder(),
      ),
    );
  }

  AccountType parseAccountType(String accountTypeString) {
    switch (accountTypeString) {
      case 'Saving':
        return AccountType.Saving;
      case 'Current':
        return AccountType.Current;
      case 'Salary':
        return AccountType.Salary;
      default:
        return AccountType.Saving;
    }
  }

  Future<void> _updateBankAccount() async {
    if (bankName.isEmpty) {
      DisplayUtils.showToast('Please enter Bank name.');
      return;
    }
    if (branchName.isEmpty) {
      DisplayUtils.showToast('Please enter Branch name.');
      return;
    }

    final updatedAccount = BankAccount(
      bankName: bankName,
      accountNumber: accountNumber,
      ifscCode: ifscCode,
      branchName: branchName,
      accountType: accountType.toString().split('.').last,
      comments: comments,
      attachment: attachment,
      assetId: widget.account.assetId,
      category: widget.assetType,
    );

    final response = await _performUpdate(updatedAccount);

    if (response != null) {
      DisplayUtils.showToast('Bank account details Updated Successfully');
    } else {
      DisplayUtils.showToast('Failed to update Bank account');
    }

    Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BankAccountsScreen(
          assetType: widget.assetType,
        ),
      ),
    );
  }

  Future<BankAccount?> _performUpdate(BankAccount account) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (token == null) {
      return null;
    }

    final dio = Dio();
    dio.options.headers["Authorization"] = token;

    try {
      final response = await dio.put(
        'https://dev.bsure.live/v2/asset/${account.assetId}',
        data: account.toJson(),
      );

      await _submitImage();

      if (response.statusCode == 200) {
        return BankAccount.fromJson(jsonDecode(response.data));
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<void> _submitImage() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (proof == null || token == null) {
      return;
    }

    final formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(proof.path),
    });

    final dio = Dio();
    dio.options.headers["Authorization"] = token;

    try {
      await dio.post(
        "https://dev.bsure.live/v2/asset/${widget.account.assetId}/upload",
        data: formData,
      );
    } catch (e) {
      DisplayUtils.showToast('Failed to upload file');
    }
  }
}
