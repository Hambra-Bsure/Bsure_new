import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/real_estate_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Repositary/Models/AssetModels/RealEstateRequest.dart';
import '../../Repositary/Retrofit/node_api_client.dart';

enum PropertyType { Residential, Commercial }

class RealEstateAdd extends StatefulWidget {
  final String assetType;

  const RealEstateAdd({Key? key, required this.assetType}) : super(key: key);

  @override
  _RealEstateAddState createState() => _RealEstateAddState();
}

class _RealEstateAddState extends State<RealEstateAdd> {
  final TextEditingController _typeOfPropertyController =
      TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _khataNumberController = TextEditingController();
  final TextEditingController _northOfPropertyController =
      TextEditingController();
  final TextEditingController _southOfPropertyController =
      TextEditingController();
  final TextEditingController _eastOfPropertyController =
      TextEditingController();
  final TextEditingController _westOfPropertyController =
      TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  PropertyType? _selectedPropertyType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Real Estate', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<PropertyType>(
              value: _selectedPropertyType,
              onChanged: (value) {
                setState(() {
                  _selectedPropertyType = value;
                });
              },
              items: const [
                DropdownMenuItem(
                  value: PropertyType.Residential,
                  child: Text('Residential'),
                ),
                DropdownMenuItem(
                  value: PropertyType.Commercial,
                  child: Text('Commercial'),
                ),
              ],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Type of Property *',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              ),
            ),
            buildTextField(
              controller: _addressController,
              labelText: 'Address',
              mandatory: true,
            ),
            buildTextField(
              controller: _khataNumberController,
              labelText: 'Khata Number (Optional)',
              mandatory: false,
            ),
            buildTextField(
              controller: _northOfPropertyController,
              labelText: 'North of Property (Optional)',
              mandatory: false,
            ),
            buildTextField(
              controller: _southOfPropertyController,
              labelText: 'South of Property (Optional)',
              mandatory: false,
            ),
            buildTextField(
              controller: _eastOfPropertyController,
              labelText: 'East of Property (Optional)',
              mandatory: false,
            ),
            buildTextField(
              controller: _westOfPropertyController,
              labelText: 'West of Property (Optional)',
              mandatory: false,
            ),
            buildTextField(
              controller: _imageController,
              labelText: 'Image (Optional)',
              mandatory: false,
            ),
            buildTextField(
              controller: _commentsController,
              labelText: 'Comments (Optional)',
              mandatory: false,
            ),
            buildTextField(
              controller: _attachmentController,
              labelText: 'Attachment (Optional)',
              mandatory: false,
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle submit button press
                  _submitForm();
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
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
        TextFormField(
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
        ),
      ],
    );
  }

  void _submitForm() async {
    final prefs = await SharedPreferences.getInstance();
    var token =
        prefs.getString("token"); // Retrieve token from SharedPreferences

    // Check if token is null or empty
    if (token == null || token.isEmpty) {
      // Handle the case where token is not available
      print('Token is not available');
      return;
    }

    final dio = Dio();
    final client = NodeClient(dio);

    final request = RealEstateRequest(
      assetType: widget.assetType,
      typeOfProperty: _selectedPropertyType.toString().split('.').last,
      address: _addressController.text,
      khataNumber: _khataNumberController.text,
      northOfProperty: _northOfPropertyController.text,
      southOfProperty: _southOfPropertyController.text,
      eastOfProperty: _eastOfPropertyController.text,
      westOfProperty: _westOfPropertyController.text,
      image: _imageController.text,
      comments: _commentsController.text,
      attachment: _attachmentController.text,
    );

    try {
      final response = await client.CreateRealEstate(token, request);
      print(response); // Handle the response data

      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => RealEstateScreen(assetType: widget.assetType),
        ),
      );

    } catch (e) {
      print('Failed to submit data: $e');
    }
  }
}
