import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/get_asset_models/gold.dart';
import '../../Utils/DisplayUtils.dart';
import '../get_asset_screens/gold_screen.dart';
import '../post_asset_addition/Gold.dart';

class GoldEdit extends StatefulWidget {
  final Golds gold;
  final String assetType;

  const GoldEdit({
    super.key,
    required this.gold,
    required this.assetType,
  });

  @override
  State<GoldEdit> createState() => _GoldEditState();
}

class _GoldEditState extends State<GoldEdit> {
  late String metalType;
  late String type;
  late String weightInGrams;
  late String whereItIsKept;
  late String comments;
  late String attachment;

  @override
  void initState() {
    super.initState();
    // Initialize the local variables with the current values
    metalType = widget.gold.metalType ?? '';
    type = widget.gold.type ?? '';
    weightInGrams = widget.gold.weightInGrams?.toString() ?? '';
    whereItIsKept = widget.gold.whereItIsKept ?? '';
    comments = widget.gold.comments ?? '';
    attachment = widget.gold.attachment ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Edit Gold', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildDropdownField(
                value: metalType,
                onChanged: (value) {
                  setState(() {
                    metalType = value.toString();
                  });
                },
                items: MetalType.values.map((type) {
                  return DropdownMenuItem<String>(
                    value: type.toString().split('.').last,
                    child: Text(type.toString().split('.').last),
                  );
                }).toList(),
                labelText: 'Metal Type',
                mandatory: true,
              ),
              buildDropdownField(
                value: type,
                onChanged: (value) {
                  setState(() {
                    type = value.toString();
                  });
                },
                items: Type.values.map((type) {
                  return DropdownMenuItem<String>(
                    value: type.toString().split('.').last,
                    child: Text(type.toString().split('.').last),
                  );
                }).toList(),
                labelText: 'Type',
                mandatory: true,
              ),
              TextFormField(
                initialValue: weightInGrams,
                decoration: const InputDecoration(labelText: 'Weight In Grams'),
                onChanged: (value) {
                  setState(() {
                    weightInGrams = value;
                  });
                },
              ),
              TextFormField(
                initialValue: whereItIsKept,
                decoration: const InputDecoration(labelText: 'Where It Is Kept'),
                onChanged: (value) {
                  setState(() {
                    whereItIsKept = value;
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
                  // Update the Gold object with the new values
                  final updatedGold = Golds(
                    metalType: metalType,
                    type: type,
                    weightInGrams: int.tryParse(weightInGrams) ?? 0,
                    whereItIsKept: whereItIsKept,
                    comments: comments,
                    attachment: attachment,
                    assetId: widget.gold.assetId,
                    category: widget.assetType,
                  );

                  // Call API to update gold details
                  final response = await updateGold(updatedGold);
                  print(response);
                  DisplayUtils.showToast('Asset Updated Successfully');

                  Navigator.pop(context);
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => GoldScreen(
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

  Widget buildDropdownField({
    required String value,
    required ValueChanged<String?> onChanged,
    required List<DropdownMenuItem<String>> items,
    required String labelText,
    bool mandatory = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          value: value,
          onChanged: onChanged,
          items: items,
          decoration: InputDecoration(
            labelText: labelText, // Update to include labelText as label
           // border: const OutlineInputBorder(),
           // contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
        ),
      ],
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    bool mandatory = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText + (mandatory ? ' *' : ''),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: const InputDecoration(
            //border: OutlineInputBorder(),
            //contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
        ),
      ],
    );
  }

  Future<Golds?> updateGold(Golds gold) async {
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
        'http://43.205.12.154:8080/v2/asset/${gold.assetId}',
        data: gold.toJson(), // Convert gold object to JSON and send as request body
      );

      if (response.statusCode == 200) {
        // Parse and return updated gold details
        return Golds.fromJson(jsonDecode(response.data));
      } else {
        return null; // Return null if update fails
      }
    } catch (e) {
      print(e);
      return null; // Return null if an error occurs
    }
  }
}
