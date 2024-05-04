import 'dart:convert';
import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/mutual_fund_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/get_asset_models/mutual_fund.dart';
import '../../Utils/DisplayUtils.dart';

class MutualFundEdit extends StatefulWidget {
  final MutualFund fund;
  final String assetType;

  const MutualFundEdit(
      {super.key, required this.assetType, required this.fund});

  @override
  State<MutualFundEdit> createState() => _MutualFundEditState();
}

class _MutualFundEditState extends State<MutualFundEdit> {
  late String amcName;
  late String schemeName;
  late String folioNumber;
  late String fundType;
  late String comments;
  late String attachment;

  @override
  void initState() {
    super.initState();
    // Initialize the local variables with the current values
    amcName = widget.fund.amcName!;
    schemeName = widget.fund.schemeName!;
    folioNumber = widget.fund.folioNumber!;
    fundType = widget.fund.fundType!;
    comments = widget.fund.comments!;
    attachment = widget.fund.attachment!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Edit MutualFund',
            style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              initialValue: amcName,
              decoration: const InputDecoration(labelText: 'Amc Name'),
              onChanged: (value) {
                setState(() {
                  amcName = value;
                });
              },
            ),
            TextFormField(
              initialValue: schemeName,
              decoration: const InputDecoration(labelText: 'Scheme Name'),
              onChanged: (value) {
                setState(() {
                  schemeName = value;
                });
              },
            ),
            TextFormField(
              initialValue: folioNumber,
              decoration: const InputDecoration(labelText: 'Folio Number'),
              onChanged: (value) {
                setState(() {
                  folioNumber = value;
                });
              },
            ),
            TextFormField(
              initialValue: fundType,
              decoration: const InputDecoration(labelText: 'Fund Type'),
              onChanged: (value) {
                setState(() {
                  fundType = value;
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
                final updatedFund = MutualFund(
                  amcName: amcName,
                  schemeName: schemeName,
                  folioNumber: folioNumber,
                  fundType: fundType,
                  comments: comments,
                  attachment: attachment,
                  category: widget.assetType,
                  assetId: widget.fund.assetId,
                );

                // Call API to update bank account details
                final response = await updateMutualFund(updatedFund);
                DisplayUtils.showToast('Asset Updated Successfully');

                Navigator.pop(context, updatedFund);
                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => MutualFundScreen(
                      assetType: widget.assetType,
                    ),
                  ),
                );
                if (response != null) {
                } else {}
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }

  Future<MutualFund?> updateMutualFund(MutualFund fund) async {
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
        'http://43.205.12.154:8080/v2/asset/${fund.assetId}',
        data: fund
            .toJson(), // Convert account object to JSON and send as request body
      );

      if (response.statusCode == 200) {
        // Parse and return updated bank account details
        return MutualFund.fromJson(jsonDecode(response.data));
      } else {
        return null; // Return null if update fails
      }
    } catch (e) {
      return null; // Return null if an error occurs
    }
  }
}
