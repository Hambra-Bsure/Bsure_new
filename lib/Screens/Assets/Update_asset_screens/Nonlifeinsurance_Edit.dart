import 'dart:convert';
import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/non_life_insurance_screen.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/get_asset_models/non_life_insurance.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/DisplayUtils.dart';

class NonLifeInsuranceEdit extends StatefulWidget {
  final NonLifeInsurance nonlifeinsurance;
  final String assetType;

  const NonLifeInsuranceEdit(
      {super.key, required this.nonlifeinsurance, required this.assetType});

  @override
  State<NonLifeInsuranceEdit> createState() => _NonLifeInsuranceEditState();
}

class _NonLifeInsuranceEditState extends State<NonLifeInsuranceEdit> {
  late String insuranceCompanyName;
  late String typeOfInsurance;
  late String policyName;
  late String policyNumber;
  late String comments;
  late String attachment;

  @override
  void initState() {
    super.initState();
    // Initialize the local variables with the current values
    insuranceCompanyName = widget.nonlifeinsurance.insuranceCompanyName;
    typeOfInsurance = widget.nonlifeinsurance.typeOfInsurance;
    policyName = widget.nonlifeinsurance.policyName;
    policyNumber = widget.nonlifeinsurance.policyNumber;
    comments = widget.nonlifeinsurance.comments;
    attachment = widget.nonlifeinsurance.attachment;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Edit Non-Life Insurance',
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
            DropdownButtonFormField<String>(
              value: typeOfInsurance,
              onChanged: (value) {
                setState(() {
                  typeOfInsurance = value!;
                });
              },
              items: <String>{
                'Health Insurance',
                'Property Insurance',
                'Motor Insurance',
                'Other'
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
              decoration: const InputDecoration(labelText: ' policyNumber'),
              onChanged: (value) {
                setState(() {
                  policyNumber = value;
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
                final updatednonlifeinsurance = NonLifeInsurance(
                  insuranceCompanyName: insuranceCompanyName,
                  typeOfInsurance: typeOfInsurance,
                  policyName: policyName,
                  policyNumber: policyNumber,
                  comments: comments,
                  attachment: attachment,
                  assetId: widget.nonlifeinsurance.assetId,
                  category: widget.assetType,
                );

                // Call API to update bank account details
                final response =
                    await updateNonlifeInsurance(updatednonlifeinsurance);
                DisplayUtils.showToast('Asset Updated Successfully');
                Navigator.pop(context);
                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => NonLifeInsuranceScreen(
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

  Future<NonLifeInsurance?> updateNonlifeInsurance(
      NonLifeInsurance nonLifeInsurance) async {
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
        'http://43.205.12.154:8080/v2/asset/${nonLifeInsurance.assetId}',
        data: nonLifeInsurance
            .toJson(), // Convert account object to JSON and send as request body
      );

      if (response.statusCode == 200) {
        // Parse and return updated bank account details
        return NonLifeInsurance.fromJson(jsonDecode(response.data));
      } else {
        return null; // Return null if update fails
      }
    } catch (e) {
      return null; // Return null if an error occurs
    }
  }
}
