import 'dart:convert';
import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/nps_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/get_asset_models/Nps.dart';
import '../../Utils/DisplayUtils.dart';

class NpsEdit extends StatefulWidget {
  final NPS nps;
  final String assetType;

  const NpsEdit({super.key, required this.nps, required this.assetType});

  @override
  State<NpsEdit> createState() => _NPSEditState();
}

class _NPSEditState extends State<NpsEdit> {
  late String pranNumber;
  late String comments;
  late String attachment;

  @override
  void initState() {
    super.initState();
    // Initialize the local variables with the current values
    pranNumber = widget.nps.pranNumber;
    comments = widget.nps.comments;
    attachment = widget.nps.attachment;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Edit Nps', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              initialValue: pranNumber,
              decoration: const InputDecoration(labelText: 'Bank Name'),
              onChanged: (value) {
                setState(() {
                  pranNumber = value;
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
                final updatednps = NPS(
                  pranNumber: pranNumber,
                  comments: comments,
                  attachment: attachment,
                  assetId: widget.nps.assetId,
                  category: widget.assetType,
                );

                // Call API to update bank account details
                final response = await updateNps(updatednps);
                DisplayUtils.showToast('Asset Updated Successfully');

                Navigator.pop(context);
                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => NpsScreen(
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

  Future<NPS?> updateNps(NPS nps) async {
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
        'http://43.205.12.154:8080/v2/asset/${nps.assetId}',
        data: nps
            .toJson(), // Convert account object to JSON and send as request body
      );

      if (response.statusCode == 200) {
        // Parse and return updated bank account details
        return NPS.fromJson(jsonDecode(response.data));
      } else {
        return null; // Return null if update fails
      }
    } catch (e) {
      print(e);
      return null; // Return null if an error occurs
    }
  }
}
