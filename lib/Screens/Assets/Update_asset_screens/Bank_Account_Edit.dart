import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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

  const BankAccountEdit(
      {super.key, required this.account, required this.assetType});

  @override
  State<BankAccountEdit> createState() => _BankAccountEditState();
}

class _BankAccountEditState extends State<BankAccountEdit> {
  late String bankName;
  late String accountNumber;
  late String ifscCode;
  late String branchName;
  late AccountType accountType; // Change type to AccountType
  late String comments;
  late String attachment;

  @override
  void initState() {
    super.initState();
    // Initialize the local variables with the current values
    bankName = widget.account.bankName;
    accountNumber = widget.account.accountNumber ?? "";
    ifscCode = widget.account.ifscCode ?? "";
    branchName = widget.account.branchName;
    accountType =
        parseAccountType(widget.account.accountType); // Convert to AccountType
    comments = widget.account.comments;
    attachment = widget.account.attachment;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Edit Bank Account',
            style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              initialValue: bankName,
              decoration: const InputDecoration(
                labelText: 'Bank Name',
                // border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  bankName = value;
                });
              },
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              initialValue: accountNumber,
              decoration: const InputDecoration(
                labelText: 'Account Number',
                //  border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  accountNumber = value;
                });
              },
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              initialValue: ifscCode,
              decoration: const InputDecoration(
                labelText: 'IFSC Code',
                // border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  ifscCode = value;
                });
              },
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              initialValue: branchName,
              decoration: const InputDecoration(
                labelText: 'Branch Name',
                // border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  branchName = value;
                });
              },
            ),
            const SizedBox(height: 12.0),
            buildAccountTypeDropdown(),
            const SizedBox(height: 12.0),
            TextFormField(
              initialValue: comments,
              decoration: const InputDecoration(
                labelText: 'Comments',
                // border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  comments = value;
                });
              },
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              initialValue: attachment,
              decoration: const InputDecoration(
                labelText: 'Attachment',
                //border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  attachment = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                // Update the BankAccount object with the new values
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
                // Call API to update bank account details
                final response = await updateBankAccount(updatedAccount);

                DisplayUtils.showToast('Asset Updated Successfully');

                Navigator.pop(context);
                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => BankAccountsScreen(
                      assetType: widget.assetType,
                    ),
                  ),
                );
                if (response != null) {
                  // Handle success
                } else {}
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff429bb8), // Set background color here
              ),
              child: const Text('Update',style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
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
      decoration: const InputDecoration(
        labelText: 'Account Type',
        //border: OutlineInputBorder(),
        //contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
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

  Future<BankAccount?> updateBankAccount(BankAccount account) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (token == null) {
      // Handle token absence or expiration here
      return null;
    }

    final dio = Dio();
    dio.options.headers["Authorization"] = token; // Add token to headers

    try {
      final response = await dio.put(
        'http://43.205.12.154:8080/v2/asset/${account.assetId}',
        data: account
            .toJson(), // Convert account object to JSON and send as request body
      );

      if (response.statusCode == 200) {
        // Parse and return updated bank account details
        return BankAccount.fromJson(jsonDecode(response.data));
      } else {
        return null; // Return null if update fails
      }
    } catch (e) {
      return null; // Return null if an error occurs
    }
  }
}
