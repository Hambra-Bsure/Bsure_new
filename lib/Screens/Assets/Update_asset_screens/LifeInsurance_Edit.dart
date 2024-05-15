import 'dart:convert';
import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/life_insurance_screen.dart';
import 'package:Bsure_devapp/Screens/Utils/DisplayUtils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/get_asset_models/life_Insurance.dart';

class LifeInsuranceEdit extends StatefulWidget {
  final LifeInsurance insurance;
  final String assetType;

  const LifeInsuranceEdit(
      {super.key, required this.insurance, required this.assetType});

  @override
  State<LifeInsuranceEdit> createState() => _LifeInsuranceEditState();
}

class _LifeInsuranceEditState extends State<LifeInsuranceEdit> {
  late String insuranceCompanyName;
  late String policyName;
  late String policyNumber;
  late String coverageAmount;
  late DateTime maturityDate;
  late String comments;
  late String attachment;

  @override
  void initState() {
    super.initState();
    // Initialize the local variables with the current values
    insuranceCompanyName = widget.insurance.insuranceCompanyName;
    policyName = widget.insurance.policyName;
    policyNumber = widget.insurance.policyNumber;
    coverageAmount = widget.insurance.coverageAmount != null
        ? widget.insurance.coverageAmount.toString()
        : ''; // Initialize coverage amount with empty string if null
    maturityDate = widget.insurance.maturityDate != null
        ? DateTime.parse(widget.insurance.maturityDate!)
        : DateTime.now(); // Use DateTime.now() as default value
    comments = widget.insurance.comments;
    attachment = widget.insurance.attachment;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: maturityDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != maturityDate) {
      final String formattedDate = picked.toIso8601String();
      setState(() {
        maturityDate = DateTime.parse(formattedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Edit Life Insurance',
            style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              initialValue: insuranceCompanyName,
              decoration:
                  const InputDecoration(labelText: 'Insurance Company Name'),
              onChanged: (value) {
                setState(() {
                  insuranceCompanyName = value;
                });
              },
            ),
            TextFormField(
              initialValue: policyName,
              decoration: const InputDecoration(labelText: 'Policy Name'),
              onChanged: (value) {
                setState(() {
                  policyName = value;
                });
              },
            ),
            TextFormField(
              initialValue: policyNumber,
              decoration: const InputDecoration(labelText: ' Policy Number'),
              onChanged: (value) {
                setState(() {
                  policyNumber = value;
                });
              },
            ),
            TextFormField(
              initialValue: coverageAmount,
              decoration: const InputDecoration(labelText: 'Coverage Amount'),
              onChanged: (value) {
                setState(() {
                  coverageAmount = value;
                });
              },
            ),
            TextFormField(
              controller: TextEditingController(
                  text: DateFormat('yyyy-MM-dd').format(maturityDate)),
              // Format date as text
              decoration: const InputDecoration(labelText: 'Maturity Date'),
              onTap: () {
                _selectDate(context);
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
                int parsedCoverageAmount = 0; // Default value if parsing fails

                try {
                  parsedCoverageAmount = int.parse(coverageAmount);
                } catch (e) {
                  // Handle the parsing error here, such as showing a message to the user
                }

                final updatedInsurance = LifeInsurance(
                  insuranceCompanyName: insuranceCompanyName,
                  policyName: policyName,
                  policyNumber: policyNumber,
                  coverageAmount: parsedCoverageAmount,
                  maturityDate: maturityDate.toString(),
                  // Pass DateTime object directly
                  comments: comments,
                  attachment: attachment,
                  assetId: widget.insurance.assetId,
                  category: widget.assetType,
                );
                // Call API to update bank account details
                final response = await updateInsurance(updatedInsurance);
                DisplayUtils.showToast('Asset Updated Successfully');

                Navigator.pop(context);
                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        LifeInsuranceScreen(assetType: widget.assetType),
                  ),
                );
                if (response != null) {
                  // Handle success
                } else {}
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

  Future<LifeInsurance?> updateInsurance(LifeInsurance insurance) async {
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
        'http://43.205.12.154:8080/v2/asset/${insurance.assetId}',
        data: insurance
            .toJson(), // Convert account object to JSON and send as request body
      );

      if (response.statusCode == 200) {
        // Parse and return updated bank account details
        return LifeInsurance.fromJson(jsonDecode(response.data));
      } else {
        return null; // Return null if update fails
      }
    } catch (e) {
      return null; // Return null if an error occurs
    }
  }
}
