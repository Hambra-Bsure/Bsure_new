import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/get_asset_models/esop.dart';
import '../../Utils/DisplayUtils.dart';
import '../get_asset_screens/esop_screen.dart';

class EsopEdit extends StatefulWidget {
  final Esop esop;
  final String assetType;

  const EsopEdit({super.key, required this.esop, required this.assetType});

  @override
  State<EsopEdit> createState() => _EsopEditState();
}

class _EsopEditState extends State<EsopEdit> {
  late String companyName;
  late String numberOfStocks;
  late String optionPrice;
  late String expiryDate;
  late String totalSharesAvailableForIssue;
  late String issuePricePerShare;
  late String comments;
  late String attachment;

  @override
  void initState() {
    super.initState();
    // Initialize the local variables with the current values
    companyName = widget.esop.companyName ?? '';
    numberOfStocks = widget.esop.numberOfStocks?.toString() ?? '';
    optionPrice = widget.esop.optionPrice?.toString() ?? '';
    expiryDate = widget.esop.expiryDate ?? '';
    totalSharesAvailableForIssue =
        widget.esop.totalSharesAvailableForIssue?.toString() ?? '';
    issuePricePerShare = widget.esop.issuePricePerShare?.toString() ?? '';
    comments = widget.esop.comments ?? '';
    attachment = widget.esop.attachment ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Edit Esop', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                initialValue: companyName,
                decoration: const InputDecoration(labelText: 'Company Name'),
                onChanged: (value) {
                  setState(() {
                    companyName = value;
                  });
                },
              ),
              TextFormField(
                initialValue: numberOfStocks,
                decoration:
                    const InputDecoration(labelText: 'Number of Stocks'),
                onChanged: (value) {
                  setState(() {
                    numberOfStocks = value;
                  });
                },
              ),
              TextFormField(
                initialValue: optionPrice,
                decoration: const InputDecoration(labelText: 'Option Price'),
                onChanged: (value) {
                  setState(() {
                    optionPrice = value;
                  });
                },
              ),
              TextFormField(
                controller: TextEditingController(
                  text: expiryDate,
                ),
                // Format date as text
                decoration: const InputDecoration(labelText: 'Maturity Date'),
                onTap: () {
                  _selectDate(context);
                },
              ),
              TextFormField(
                initialValue: totalSharesAvailableForIssue,
                decoration: const InputDecoration(
                    labelText: 'Total Shares Available For Issue'),
                onChanged: (value) {
                  setState(() {
                    totalSharesAvailableForIssue = value;
                  });
                },
              ),
              TextFormField(
                initialValue: issuePricePerShare,
                decoration:
                    const InputDecoration(labelText: 'Issue Price Per Share'),
                onChanged: (value) {
                  setState(() {
                    issuePricePerShare = value;
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
                  // Update the Esop object with the new values
                  final updatedEsop = Esop(
                    companyName: companyName,
                    numberOfStocks: int.tryParse(numberOfStocks),
                    optionPrice: int.tryParse(optionPrice),
                    expiryDate: expiryDate,
                    totalSharesAvailableForIssue:
                        int.tryParse(totalSharesAvailableForIssue),
                    issuePricePerShare: int.tryParse(issuePricePerShare),
                    comments: comments,
                    attachment: attachment,
                    assetId: widget.esop.assetId,
                    category: widget.assetType,
                  );

                  // Call API to update Esop details
                  final response = await updateEsop(updatedEsop);

                  DisplayUtils.showToast('Asset Updated Successfully');

                  Navigator.pop(context);
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => EsopScreen(
                        assetType: widget.assetType,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor : const Color(0xff429bb8), // Set background color here
                ),
                child: const Text('Update', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime initialDateTime = DateTime.parse(expiryDate);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDateTime, // Pass DateTime object
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != initialDateTime) {
      setState(() {
        expiryDate = picked.toIso8601String(); // Convert DateTime to String
      });
    }
  }

  Future<Esop?> updateEsop(Esop esop) async {
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
        'http://43.205.12.154:8080/v2/asset/${esop.assetId}',
        data: esop
            .toJson(), // Convert Esop object to JSON and send as request body
      );

      if (response.statusCode == 200) {
        // Parse and return updated Esop details
        return Esop.fromJson(jsonDecode(response.data));
      } else {
        return null; // Return null if update fails
      }
    } catch (e) {
      return null; // Return null if an error occurs
    }
  }
}
