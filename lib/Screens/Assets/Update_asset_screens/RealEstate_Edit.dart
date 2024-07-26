import 'dart:convert';
import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/real_estate_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/get_asset_models/real_estate.dart';
import '../../Utils/DisplayUtils.dart';

enum PropertyType { Residential, Commercial }

String propertyTypeToString(PropertyType? propertyType) {
  switch (propertyType) {
    case PropertyType.Residential:
      return 'Residential';
    case PropertyType.Commercial:
      return 'Commercial';
    default:
      return '';
  }
}

class RealEstateEdit extends StatefulWidget {
  final RealEstate realestate;
  final String assetType;

  const RealEstateEdit(
      {super.key, required this.realestate, required this.assetType});

  @override
  State<RealEstateEdit> createState() => _RealEstateEditState();
}

class _RealEstateEditState extends State<RealEstateEdit> {
  late String address;
  late String khataNumber;
  late String northOfProperty;
  late String southOfProperty;
  late String eastOfProperty;
  late String westOfProperty;
  late String image;
  late String comments;
  late String attachment;

  PropertyType? _selectedPropertyType;
  var proof;
  final TextEditingController _attachmentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the local variables with the current values
    _selectedPropertyType = widget.realestate.typeOfProperty != null
        ? propertyTypeFromString(widget.realestate.typeOfProperty!)
        : null;
    address = widget.realestate.address ?? '';
    khataNumber = widget.realestate.khataNumber ?? '';
    southOfProperty = widget.realestate.southOfProperty ?? '';
    eastOfProperty = widget.realestate.eastOfProperty ?? '';
    northOfProperty = widget.realestate.northOfProperty ?? '';
    westOfProperty = widget.realestate.westOfProperty ?? '';
    image = widget.realestate.image ?? '';
    comments = widget.realestate.comments ?? '';
    attachment = widget.realestate.attachment ?? '';
  }

  PropertyType? propertyTypeFromString(String type) {
    switch (type) {
      case 'Residential':
        return PropertyType.Residential;
      case 'Commercial':
        return PropertyType.Commercial;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Edit real estate',
            style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildTextField(
                labelText: 'Address',
                initialValue: address,
                onChanged: (value) => setState(() => address = value),
                isMandatory: true,
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Text(
                    'Property type',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ' *',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              DropdownButtonFormField<PropertyType>(
                value: _selectedPropertyType,
                onChanged: (value) {
                  setState(() {
                    _selectedPropertyType = value;
                  });
                },
                items: [
                  const DropdownMenuItem<PropertyType>(
                    value: null,
                    child: Text('Select property type'),
                  ),
                  ...PropertyType.values.map((type) {
                    return DropdownMenuItem<PropertyType>(
                      value: type,
                      child: Text(type.toString().split('.').last),
                    );
                  }),
                ],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                ),
              ),
              const SizedBox(height: 10),
              buildTextField(
                labelText: 'Khata number',
                initialValue: khataNumber,
                onChanged: (value) => setState(() => khataNumber = value),
                isMandatory: false,
                isNumeric: true
              ),
              const SizedBox(height: 10),
              buildTextField(
                labelText: 'North of property',
                initialValue: northOfProperty,
                onChanged: (value) => setState(() => northOfProperty = value),
                isMandatory: false,
              ),
              const SizedBox(height: 10),
              buildTextField(
                labelText: 'South of property',
                initialValue: southOfProperty,
                onChanged: (value) => setState(() => southOfProperty = value),
                isMandatory: false,
              ),
              const SizedBox(height: 10),
              buildTextField(
                labelText: 'East of property',
                initialValue: eastOfProperty,
                onChanged: (value) => setState(() => eastOfProperty = value),
                isMandatory: false,
              ),
              const SizedBox(height: 10),
              buildTextField(
                labelText: 'West of property',
                initialValue: westOfProperty,
                onChanged: (value) => setState(() => westOfProperty = value),
                isMandatory: false,
              ),
              const SizedBox(height: 10),
              buildTextField(
                labelText: 'Image(url)',
                initialValue: image,
                onChanged: (value) => setState(() => image = value),
                isMandatory: false,
              ),
              const SizedBox(height: 10),
              buildTextField(
                labelText: 'Comments',
                initialValue: comments,
                onChanged: (value) => setState(() => comments = value),
                isMandatory: false,
              ),
              const SizedBox(height: 10),
              buildAttachmentField(),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {

                  if (address.isEmpty) {
                    DisplayUtils.showToast('Please enter Address');
                    return;
                  }
                  if (_selectedPropertyType == null) {
                    DisplayUtils.showToast('Please select Property type');
                    return;
                  }

                  final updatedRealEstate = RealEstate(
                    typeOfProperty: propertyTypeToString(_selectedPropertyType),
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

                  DisplayUtils.showToast('Asset updated successfully');

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
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff429bb8), // Set background color here
                ),
                child: const Text('Update', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
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
        'https://dev.bsure.live/v2/asset/${realEstate.assetId}',
        data: realEstate.toJson(), // Convert real estate object to JSON and send as request body
      );

      await _submitImage();

      if (response.statusCode == 200) {
        return RealEstate.fromJson(jsonDecode(response.data));
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
        "https://dev.bsure.live/v2/asset/${widget.realestate.assetId}/upload",
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