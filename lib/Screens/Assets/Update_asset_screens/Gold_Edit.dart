import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../LoginScreen.dart';
import '../../Repositary/Models/get_asset_models/gold.dart';
import '../../Utils/DisplayUtils.dart';
import '../get_asset_screens/gold_screen.dart';

enum MetalType { Gold, Silver }

enum Type { Ring, Earing, Necklace }

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

  var proof;
  final TextEditingController _attachmentController = TextEditingController();

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
        title: const Text('Edit gold', style: TextStyle(color: Colors.white)),
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
                labelText: 'Metal type',
                mandatory: true,
              ),
              const SizedBox(height: 12.0),
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
              const SizedBox(height: 12.0),
              buildTextField(
                initialValue: weightInGrams,
                labelText: 'Weight (in grams)',
                onChanged: (value) => setState(() => weightInGrams = value),
                isMandatory: true,
                isNumeric: true
              ),
              const SizedBox(height: 12.0),
              buildTextField(
                initialValue: whereItIsKept,
                labelText: 'Where it is kept',
                onChanged: (value) => setState(() => whereItIsKept = value),
                isMandatory: false,
              ),
              const SizedBox(height: 12.0),
              buildTextField(
                initialValue: comments,
                labelText: 'Comments',
                onChanged: (value) => setState(() => comments = value),
                isMandatory: false,
              ),
              const SizedBox(height: 12.0),
              buildAttachmentField(),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  // Validate mandatory fields

                  if (metalType.isEmpty) {
                    DisplayUtils.showToast('Please select Metal type.');
                    return;
                  }

                  if (type.isEmpty) {
                    DisplayUtils.showToast('Please select Type.');
                    return;
                  }

                  if (weightInGrams.isEmpty) {
                    DisplayUtils.showToast('Please enter Weight in grams.');
                    return;
                  }

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

                  DisplayUtils.showToast('Gold asset details updated successfully');
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
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xff429bb8), // Set background color here
                ),
                child:
                    const Text('Update', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDropdownField({
    required dynamic value,
    required ValueChanged<dynamic> onChanged,
    required List<DropdownMenuItem<dynamic>> items,
    required String labelText,
    bool mandatory = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              labelText,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (mandatory)
              const Text(
                ' *',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<dynamic>(
          value: value,
          onChanged: onChanged,
          items: items,
          decoration: InputDecoration(
            labelText: labelText, // Update to include labelText as label
            border: const OutlineInputBorder(),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
        ),
      ],
    );
  }

  Widget buildTextField({
    required String labelText,
    required String initialValue,
    required Function(String) onChanged,
    bool isMandatory = false,
    bool isNumeric = false,
  }) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        label: isMandatory
            ? RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: labelText,
                style: const TextStyle(color: Colors.black),
              ),
              const TextSpan(
                text: ' *',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        )
            : Text(labelText, style: const TextStyle(color: Colors.black)),
        border: const OutlineInputBorder(),
      ),
      onChanged: (value) {
        // Trim leading and trailing spaces
        final trimmedValue = value.trim();
        onChanged(trimmedValue);
      },
      validator: (value) {
        if (isMandatory && value!.isEmpty) {
          return 'Please enter $labelText.';
        }
        return null;
      },
      inputFormatters: isNumeric
          ? <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        NoLeadingSpaceFormatter(),
      ]
          : <TextInputFormatter>[
        NoLeadingSpaceFormatter(),
      ],
    );
  }

  Widget buildAttachmentField() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _attachmentController,
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff429bb8)),
                  ),
                  hintText: "Attachemnt you want to upload(optional)",
                  hintStyle: TextStyle(fontSize: 16),
                ),
                readOnly: true,
                onTap: uploadFile,
              ),
            ),
            const SizedBox(width: 10),
            // Change the label for picking a file
            ElevatedButton(
              onPressed: uploadFile,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff429bb8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.width * 0.01,
                  horizontal: MediaQuery.of(context).size.width * 0.03,
                ),
              ),
              child: const Text(
                'Choose file',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> uploadFile() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.any, allowMultiple: false);

    if (result != null) {
      setState(() {
        proof = result.files.single;
        _attachmentController.text = proof.name;
      });
    } else {
      // Handle error when no file is selected.
    }
  }

  Future<Golds?> updateGold(Golds gold) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (token == null || token.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Token'),
          content: const Text('Please log in again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }

    final dio = Dio();
    dio.options.headers["Authorization"] = token; // Add token to headers

    try {
      final response = await dio.put(
        'https://dev.bsure.live/v2/asset/${gold.assetId}',
        data: gold
            .toJson(), // Convert gold object to JSON and send as request body
      );

      await _submitImage();

      if (response.statusCode == 200) {
        //  DisplayUtils.showToast("Gold Details Updated Successfully");
        return Golds.fromJson(jsonDecode(response.data));
      } else {
        return null; // Return null if update fails
      }
    } catch (e) {
      return null; // Return null if an error occurs
    }
  }

  Future<void> _submitImage() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (proof == null || token == null) {
      return;
    }

    final formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(proof.path),
    });

    final dio = Dio();
    dio.options.headers["Authorization"] = token;

    try {
      await dio.post(
        "https://dev.bsure.live/v2/asset/${widget.gold.assetId}/upload",
        data: formData,
      );
    } catch (e) {
      DisplayUtils.showToast('Failed to upload file');
    }
  }
}


class NoLeadingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.startsWith(' ')) {
      return oldValue;
    }
    return newValue;
  }
}