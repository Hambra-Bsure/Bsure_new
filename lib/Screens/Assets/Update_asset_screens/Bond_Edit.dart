import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/get_asset_models/bond.dart';
import '../get_asset_screens/bond_screen.dart';

class BondEdit extends StatefulWidget {
  final Bond bond;
  final String assetType;

  const BondEdit(
      {Key? key, required this.bond, required this.assetType})
      : super(key: key);

  @override
  State<BondEdit> createState() => _BondEditState();
}

class _BondEditState extends State<BondEdit> {
  late String bondName;
  late String bondNumber;
  late String authorityWhoIssuedTheBond;
  late String typeOfBond;
  late String maturityDate;
  late String comments;
  late String attachment;

  @override
  void initState() {
    super.initState();
    // Initialize the local variables with the current values
    bondName = widget.bond.bondName ?? '';
    bondNumber = widget.bond.bondNumber ?? '';
    authorityWhoIssuedTheBond = widget.bond.authorityWhoIssuedTheBond ?? '';
    typeOfBond = widget.bond.typeOfBond ?? '';
    maturityDate = widget.bond.maturityDate ?? '';
    comments = widget.bond.comments ?? '';
    attachment = widget.bond.attachment ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Edit Bond',
            style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                initialValue: bondName,
                decoration: const InputDecoration(labelText: 'Bond Name'),
                onChanged: (value) {
                  setState(() {
                    bondName = value;
                  });
                },
              ),
              TextFormField(
                initialValue: bondNumber,
                decoration: const InputDecoration(labelText: 'Bond Number'),
                onChanged: (value) {
                  setState(() {
                    bondNumber = value;
                  });
                },
              ),
              TextFormField(
                initialValue: authorityWhoIssuedTheBond,
                decoration: const InputDecoration(labelText: 'Authority Who Issued The Bond'),
                onChanged: (value) {
                  setState(() {
                    authorityWhoIssuedTheBond = value;
                  });
                },
              ),
              TextFormField(
                initialValue: typeOfBond,
                decoration: const InputDecoration(labelText: 'Type Of Bond'),
                onChanged: (value) {
                  setState(() {
                    typeOfBond = value;
                  });
                },
              ),
              TextFormField(
                initialValue: maturityDate,
                decoration: const InputDecoration(labelText: 'Maturity Date'),
                onChanged: (value) {
                  setState(() {
                    maturityDate = value;
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
                  // Update the RealEstate object with the new values
                  final updatedbond = Bond(
                    bondName: bondName,
                    bondNumber : bondNumber,
                    authorityWhoIssuedTheBond: authorityWhoIssuedTheBond,
                    typeOfBond: typeOfBond,
                    maturityDate : maturityDate,
                    comments: comments,
                    attachment: attachment,
                    assetId: widget.bond.assetId,
                    category: widget.assetType,
                  );

                  // Call API to update real estate details
                  final response = await updateBond(updatedbond);
                  print(response);

                  Navigator.pop(context);
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => BondScreen(
                        assetType: widget.assetType,
                      ),
                    ),
                  );
                },
                child: const Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Bond?> updateBond(Bond bond) async {
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
        'http://43.205.12.154:8080/v2/asset/${bond.assetId}',
        data: bond
            .toJson(), // Convert real estate object to JSON and send as request body
      );

      if (response.statusCode == 200) {
        // Parse and return updated real estate details
        return Bond.fromJson(jsonDecode(response.data));
      } else {
        return null; // Return null if update fails
      }
    } catch (e) {
      print(e);
      return null; // Return null if an error occurs
    }
  }
}
