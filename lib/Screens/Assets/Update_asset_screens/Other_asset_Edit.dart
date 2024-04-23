import 'dart:convert';
import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/nps_screen.dart';
import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/other_screen.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/get_asset_models/others.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Repositary/Models/get_asset_models/pf.dart';
import '../../Repositary/Retrofit/node_api_client.dart';
import '../../Utils/DisplayUtils.dart';
import '../get_asset_screens/Pf_screen.dart';
import '../get_asset_screens/bank_account_screen.dart';

class OtherEdit extends StatefulWidget {
  final Other others;
  final String assetType;

  const OtherEdit({Key? key, required this.others, required this.assetType})
      : super(key: key);

  @override
  State<OtherEdit> createState() => _OtherEditState();
}

class _OtherEditState extends State<OtherEdit> {
  late String assetName;
  late String comments;
  late String attachment;

  @override
  void initState() {
    super.initState();
    // Initialize the local variables with the current values
    assetName = widget.others.assetName;
    comments = widget.others.comments;
    attachment = widget.others.attachment;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Edit Other', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              initialValue: assetName,
              decoration: const InputDecoration(labelText: 'Asset Name'),
              onChanged: (value) {
                setState(() {
                  assetName = value;
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
                final updatedothers = Other(
                  assetName: assetName,
                  comments: comments,
                  attachment: attachment,
                  assetId: widget.others.assetId,
                  category: widget.assetType,
                );

                // Call API to update bank account details
                final response = await updateOther(updatedothers);
                DisplayUtils.showToast('Asset Updated Successfully');

                Navigator.pop(context);
                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => OtherScreen(
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

  Future<Other?> updateOther(Other other) async {
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
        'http://43.205.12.154:8080/v2/asset/${other.assetId}',
        data: other
            .toJson(), // Convert account object to JSON and send as request body
      );

      if (response.statusCode == 200) {
        // Parse and return updated bank account details
        return Other.fromJson(jsonDecode(response.data));
      } else {
        return null; // Return null if update fails
      }
    } catch (e) {
      print(e);
      return null; // Return null if an error occurs
    }
  }
}
