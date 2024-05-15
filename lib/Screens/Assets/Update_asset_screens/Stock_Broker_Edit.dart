import 'dart:convert';
import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/stock_broker_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/get_asset_models/stock_broker.dart';
import '../../Utils/DisplayUtils.dart';

class StockBrokerEdit extends StatefulWidget {
  final StockBroker broker;
  final String assetType;

  const StockBrokerEdit(
      {super.key, required this.broker, required this.assetType});

  @override
  State<StockBrokerEdit> createState() => _StockBrokerEditState();
}

class _StockBrokerEditState extends State<StockBrokerEdit> {
  late String brokerName;
  late String dematAccountNumber;
  late String comments;
  late String attachment;

  @override
  void initState() {
    super.initState();
    // Initialize the local variables with the current values
    brokerName = widget.broker.brokerName;
    dematAccountNumber = widget.broker.dematAccountNumber;
    comments = widget.broker.comments;
    attachment = widget.broker.attachment;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Edit StockBroker',
            style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              initialValue: brokerName,
              decoration: const InputDecoration(labelText: 'Broker Name'),
              onChanged: (value) {
                setState(() {
                  brokerName = value;
                });
              },
            ),
            TextFormField(
              initialValue: dematAccountNumber,
              decoration:
                  const InputDecoration(labelText: ' Demat Account Number'),
              onChanged: (value) {
                setState(() {
                  dematAccountNumber = value;
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
                final updatedBroker = StockBroker(
                  brokerName: brokerName,
                  dematAccountNumber: dematAccountNumber,
                  comments: comments,
                  attachment: attachment,
                  assetId: widget.broker.assetId,
                  category: widget.assetType,
                );

                // Call API to update bank account details
                final response = await updateStockBroker(updatedBroker);
                DisplayUtils.showToast('Asset Updated Successfully');

                Navigator.pop(context);
                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => StockBrokerScreen(
                      assetType: widget.assetType,
                    ),
                  ),
                );
                if (response != null) {
                } else {
                  // Handle error
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor : const Color(0xff429bb8), // Set background color here
              ),
              child: const Text('Update', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Future<StockBroker?> updateStockBroker(StockBroker broker) async {
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
        'http://43.205.12.154:8080/v2/asset/${broker.assetId}',
        data: broker
            .toJson(), // Convert account object to JSON and send as request body
      );

      if (response.statusCode == 200) {
        // Parse and return updated bank account details
        return StockBroker.fromJson(jsonDecode(response.data));
      } else {
        return null; // Return null if update fails
      }
    } catch (e) {
      return null; // Return null if an error occurs
    }
  }
}
