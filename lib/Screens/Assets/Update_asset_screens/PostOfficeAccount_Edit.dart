import 'dart:convert';

import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/post_office_account_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
  late String accountType;
  late String comments;
  late String attachment;

  @override
  void initState() {
    super.initState();
    // Initialize the local variables with the current values
    branchName = widget.postOffice.branchName;
    accountNumber = widget.postOffice.accountNumber;
    accountType = widget.postOffice.accountType;
    comments = widget.postOffice.comments;
    attachment = widget.postOffice.attachment;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Edit Post Office Account',
            style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
              initialValue: accountNumber,
              decoration: const InputDecoration(labelText: 'Account Number'),
              onChanged: (value) {
                setState(() {
                  accountNumber = value;
                });
              },
            ),
            DropdownButtonFormField<String>(
              value: accountType,
              onChanged: (value) {
                setState(() {
                  accountType = value!;
                });
              },
              items: <String>{
                'Saving',
                'Current',
                'Salary'
              } // Convert to a set to remove duplicates
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: const InputDecoration(labelText: 'Account Type'),
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
                // Update the NonLifeInsurance object with the new values
                final updatedPostOfficeAccount = PostOfficeAccount(
                  branchName: branchName,
                  accountNumber: accountNumber,
                  accountType: accountType,
                  comments: comments,
                  attachment: attachment,
                  assetId: widget.postOffice.assetId,
                  category: widget.assetType,
                );

                // Call API to update non-life insurance details
                final response = await updatePostOfficeAccount(updatedPostOfficeAccount);
                print(response);
                DisplayUtils.showToast('Asset Updated Successfully');

                Navigator.pop(context);
                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => PostofficeAccountScreen(
                      assetType: widget.assetType,
                    ),
                  ),
                );
                if (response != null) {
                } else {
                }
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
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
        // Parse and return updated non-life insurance details
        return PostOfficeAccount.fromJson(jsonDecode(response.data));
      } else {
        return null; // Return null if update fails
      }
    } catch (e) {
      print(e);
      return null; // Return null if an error occurs
    }
  }
}
