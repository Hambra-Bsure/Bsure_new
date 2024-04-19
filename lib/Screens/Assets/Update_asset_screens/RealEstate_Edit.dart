import 'dart:convert';
import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/real_estate_screen.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/get_asset_models/real_estate.dart';
import '../get_asset_screens/bank_account_screen.dart';

class RealEstateEdit extends StatefulWidget {
  final RealEstate realestate;
  final String assetType;

  const RealEstateEdit(
      {Key? key, required this.realestate, required this.assetType})
      : super(key: key);

  @override
  State<RealEstateEdit> createState() => _RealEstateEditState();
}

class _RealEstateEditState extends State<RealEstateEdit> {
  late String typeOfProperty;
  late String address;
  late String khataNumber;
  late String northOfProperty;
  late String southOfProperty;
  late String eastOfProperty;
  late String westOfProperty;
  late String image = ''; // Initialize with an empty string
  late String comments;
  late String attachment;

  @override
  void initState() {
    super.initState();
    // Initialize the local variables with the current values
    typeOfProperty = widget.realestate.typeOfProperty ?? '';
    address = widget.realestate.address ?? '';
    khataNumber = widget.realestate.khataNumber ?? '';
    southOfProperty = widget.realestate.southOfProperty ?? '';
    eastOfProperty = widget.realestate.eastOfProperty ?? '';
    northOfProperty = widget.realestate.northOfProperty ?? '';
    westOfProperty = widget.realestate.westOfProperty ?? '';
    northOfProperty = widget.realestate.image ?? '';
    comments = widget.realestate.comments ?? '';
    attachment = widget.realestate.attachment ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Edit Real Estate',
            style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                initialValue: typeOfProperty,
                decoration: const InputDecoration(labelText: 'Type Of Property'),
                onChanged: (value) {
                  setState(() {
                    typeOfProperty = value;
                  });
                },
              ),
              TextFormField(
                initialValue: address,
                decoration: const InputDecoration(labelText: 'Address'),
                onChanged: (value) {
                  setState(() {
                    address = value;
                  });
                },
              ),
              TextFormField(
                initialValue: khataNumber,
                decoration: const InputDecoration(labelText: 'Khata Number'),
                onChanged: (value) {
                  setState(() {
                    khataNumber = value;
                  });
                },
              ),
              TextFormField(
                initialValue: northOfProperty,
                decoration:
                    const InputDecoration(labelText: ' North Of Property'),
                onChanged: (value) {
                  setState(() {
                    northOfProperty = value;
                  });
                },
              ),
              TextFormField(
                initialValue: northOfProperty,
                decoration:
                    const InputDecoration(labelText: ' North Of Property'),
                onChanged: (value) {
                  setState(() {
                    northOfProperty = value;
                  });
                },
              ),
              TextFormField(
                initialValue: southOfProperty,
                decoration:
                    const InputDecoration(labelText: ' South Of Property'),
                onChanged: (value) {
                  setState(() {
                    southOfProperty = value;
                  });
                },
              ),
              TextFormField(
                initialValue: eastOfProperty,
                decoration: const InputDecoration(labelText: ' East Of Property'),
                onChanged: (value) {
                  setState(() {
                    eastOfProperty = value;
                  });
                },
              ),
              TextFormField(
                initialValue: westOfProperty,
                decoration: const InputDecoration(labelText: ' West Of Property'),
                onChanged: (value) {
                  setState(() {
                    westOfProperty = value;
                  });
                },
              ),
              TextFormField(
                initialValue: image,
                decoration: const InputDecoration(labelText: 'Image'),
                onChanged: (value) {
                  setState(() {
                    image = value;
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
                  final updatedRealEstate = RealEstate(
                    typeOfProperty: typeOfProperty,
                    address: address,
                    khataNumber: khataNumber,
                    northOfProperty: northOfProperty,
                    southOfProperty: southOfProperty,
                    eastOfProperty: eastOfProperty,
                    westOfProperty: westOfProperty,
                    comments: comments,
                    attachment: attachment,
                    assetId: widget.realestate.assetId,
                    category: widget.assetType,
                    image: image,
                  );
        
                  // Call API to update real estate details
                  final response = await updateRealEstate(updatedRealEstate);
                  print(response);
        
                  Navigator.pop(context);
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => RealEstateScreen(
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

  Future<RealEstate?> updateRealEstate(RealEstate realEstate) async {
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
        'http://43.205.12.154:8080/v2/asset/${realEstate.assetId}',
        data: realEstate
            .toJson(), // Convert real estate object to JSON and send as request body
      );

      if (response.statusCode == 200) {
        // Parse and return updated real estate details
        return RealEstate.fromJson(jsonDecode(response.data));
      } else {
        return null; // Return null if update fails
      }
    } catch (e) {
      print(e);
      return null; // Return null if an error occurs
    }
  }
}
