import 'dart:convert';
import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/nps_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Repositary/Models/get_asset_models/pf.dart';
import '../../Repositary/Retrofit/node_api_client.dart';
import '../get_asset_screens/Pf_screen.dart';
import '../get_asset_screens/bank_account_screen.dart';

class PfEdit extends StatefulWidget {
  final PF pf;
  final String assetType;

  const PfEdit({Key? key, required this.pf, required this.assetType})
      : super(key: key);

  @override
  State<PfEdit> createState() => _NPSEditState();
}

class _NPSEditState extends State<PfEdit> {
  late String uanNumber;
  late String comments;
  late String attachment;

  @override
  void initState() {
    super.initState();
    // Initialize the local variables with the current values
    uanNumber = widget.pf.uanNumber;
    comments = widget.pf.comments;
    attachment = widget.pf.attachment;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Edit PF', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              initialValue: uanNumber,
              decoration: const InputDecoration(labelText: 'Uan Number'),
              onChanged: (value) {
                setState(() {
                  uanNumber = value;
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
                final updatedpf = PF(
                  uanNumber: uanNumber,
                  comments: comments,
                  attachment: attachment,
                  assetId: widget.pf.assetId,
                  category: widget.assetType,
                );

                // Call API to update bank account details
                final response = await updatePf(updatedpf);
                Navigator.pop(context);
                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => PfScreen(
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

  Future<PF?> updatePf(PF pf) async {
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
        'http://43.205.12.154:8080/v2/asset/${pf.assetId}',
        data: pf
            .toJson(), // Convert account object to JSON and send as request body
      );

      if (response.statusCode == 200) {
        // Parse and return updated bank account details
        return PF.fromJson(jsonDecode(response.data));
      } else {
        return null; // Return null if update fails
      }
    } catch (e) {
      print(e);
      return null; // Return null if an error occurs
    }
  }
}
