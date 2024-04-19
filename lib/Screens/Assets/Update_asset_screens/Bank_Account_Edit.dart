import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/get_asset_models/bank_account.dart';
import '../../Repositary/Retrofit/node_api_client.dart';
import '../get_asset_screens/bank_account_screen.dart';

class BankAccountEdit extends StatefulWidget {
  final BankAccount account;
  final String assetType;

  const BankAccountEdit({Key? key, required this.account, required this.assetType}) : super(key: key);

  @override
  State<BankAccountEdit> createState() => _BankAccountEditState();
}

class _BankAccountEditState extends State<BankAccountEdit> {
  late String bankName;
  late String accountNumber;
  late String ifscCode;
  late String branchName;
  late String accountType;
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
    accountType = widget.account.accountType;
    comments = widget.account.comments;
    attachment = widget.account.attachment;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Edit BankAccount', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              initialValue: bankName,
              decoration: const InputDecoration(labelText: 'Bank Name'),
              onChanged: (value) {
                setState(() {
                  bankName = value;
                });
              },
            ),
            TextFormField(
              initialValue: accountNumber,
              decoration: const InputDecoration(labelText: 'Account Number'),
              onChanged: (value) {
                setState(() {
                  accountNumber = value;
                });
              },
            ),
            TextFormField(
              initialValue: ifscCode,
              decoration: const InputDecoration(labelText: 'IFSC Code'),
              onChanged: (value) {
                setState(() {
                  ifscCode = value;
                });
              },
            ),
            TextFormField(
              initialValue: branchName,
              decoration: const InputDecoration(labelText: 'Branch Name'),
              onChanged: (value) {
                setState(() {
                  branchName = value;
                });
              },
            ),
            TextFormField(
              initialValue: accountType,
              decoration: const InputDecoration(labelText: 'Account Type'),
              onChanged: (value) {
                setState(() {
                  accountType = value;
                });
              },
            ),
            TextFormField(
              initialValue: comments,
              decoration: const InputDecoration(labelText: 'Comments'),
              onChanged: (value) {
                setState(() {
                  comments = value;
                });
              },
            ),
            TextFormField(
              initialValue: attachment,
              decoration: const InputDecoration(labelText: 'Attachment'),
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
                  accountType: accountType,
                  comments: comments,
                  attachment: attachment,
                  assetId: widget.account.assetId,
                  category: widget.assetType,
                );

                // Call API to update bank account details
                final response = await updateBankAccount(updatedAccount);
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

                } else {
                  // Handle error
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Failed to update bank account'),
                    ),
                  );
                }
              },
              child: const Text('Update'),
            ),

          ],
        ),
      ),
    );
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
        data: account.toJson(), // Convert account object to JSON and send as request body
      );

      if (response.statusCode == 200) {
        // Parse and return updated bank account details
        return BankAccount.fromJson(jsonDecode(response.data));
      } else {
        return null; // Return null if update fails
      }
    } catch (e) {
      print(e);
      return null; // Return null if an error occurs
    }
  }
}
