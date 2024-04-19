import 'dart:convert';
import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/nps_screen.dart';
import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/ppf_screen.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/get_asset_models/Ppf.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PpfEdit extends StatefulWidget {
  final PPf ppf;
  final String assetType;

  const PpfEdit({super.key, required this.ppf, required this.assetType});

  @override
  State<PpfEdit> createState() => _PpfEditState();
}

class _PpfEditState extends State<PpfEdit> {
  late String ppfAccountNumber;
  late String institutionName;
  late String comments;
  late String attachment;

  @override
  void initState() {
    super.initState();
    // Initialize the local variables with the current values
    ppfAccountNumber = widget.ppf.ppfAccountNumber;
    institutionName = widget.ppf.institutionName;
    comments = widget.ppf.comments;
    attachment = widget.ppf.attachment;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Edit PPF', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              initialValue: ppfAccountNumber,
              decoration:
                  const InputDecoration(labelText: 'ppf Account Number'),
              onChanged: (value) {
                setState(() {
                  ppfAccountNumber = value;
                });
              },
            ),
            TextFormField(
              initialValue: institutionName,
              decoration: const InputDecoration(labelText: 'Institution Name'),
              onChanged: (value) {
                setState(() {
                  institutionName = value;
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
                final updatedppf = PPf(
                  ppfAccountNumber: ppfAccountNumber,
                  institutionName: institutionName,
                  comments: comments,
                  attachment: attachment,
                  assetId: widget.ppf.assetId,
                  category: widget.assetType,
                );

                // Call API to update bank account details
                final response = await updateNps(updatedppf);
                Navigator.pop(context);
                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => PPfScreen(
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

  Future<PPf?> updateNps(PPf ppf) async {
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
        'http://43.205.12.154:8080/v2/asset/${ppf.assetId}',
        data: ppf
            .toJson(), // Convert account object to JSON and send as request body
      );

      if (response.statusCode == 200) {
        // Parse and return updated bank account details
        return PPf.fromJson(jsonDecode(response.data));
      } else {
        return null; // Return null if update fails
      }
    } catch (e) {
      print(e);
      return null; // Return null if an error occurs
    }
  }
}
