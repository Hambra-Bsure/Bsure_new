import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/gold_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Repositary/Models/AssetModels/GoldRequest.dart';
import '../../Repositary/Retrofit/node_api_client.dart';

class GoldAdd extends StatefulWidget {
  final String assetType;

  const GoldAdd({super.key, required this.assetType});

  @override
  _GoldAddState createState() => _GoldAddState();
}

enum MetalType { Gold, Silver }

enum Type { Ring, Earing, Necklace }

class _GoldAddState extends State<GoldAdd> {
  final TextEditingController _assetTypeController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _whereItIsKeptController =
      TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  MetalType? _selectedMetalType;
  Type? _selectedType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Gold', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildDropdownField(
              value: _selectedMetalType,
              onChanged: (value) {
                setState(() {
                  _selectedMetalType = value as MetalType?;
                });
              },
              items: MetalType.values.map((type) {
                return DropdownMenuItem<MetalType>(
                  value: type,
                  child: Text(type.toString().split('.').last),
                );
              }).toList(),
              labelText: 'Metal Type',
              mandatory: true,
            ),
            buildDropdownField(
              value: _selectedType,
              onChanged: (value) {
                setState(() {
                  _selectedType = value as Type?;
                });
              },
              items: Type.values.map((type) {
                return DropdownMenuItem<Type>(
                  value: type,
                  child: Text(type.toString().split('.').last),
                );
              }).toList(),
              labelText: 'Type',
              mandatory: true,
            ),
            buildTextField(
              controller: _weightController,
              labelText: 'Weight (in grams)',
              mandatory: true,
            ),
            buildTextField(
              controller: _whereItIsKeptController,
              labelText: 'Where it is kept (Optional)',
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
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
        ),
      ],
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

  void _submitForm() async {
    if (!_validateForm()) {
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    var token =
        prefs.getString("token"); // Retrieve token from SharedPreferences

    // Check if token is null or empty
    if (token == null || token.isEmpty) {
      // Handle the case where token is not available

      return;
    }

    final dio = Dio();
    final client = NodeClient(dio);

    final request = GoldRequest(
      assetType: widget.assetType,
      metalType: _selectedMetalType?.toString().split('.').last,
      type: _selectedType?.toString().split('.').last,
      weightInGrams: int.parse(_weightController.text),
      whereItIsKept: _whereItIsKeptController.text,
      comments: _commentsController.text,
      attachment: _attachmentController.text,
    );

    try {
      final response = await client.CreateGold(token, request);

      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => GoldScreen(assetType: widget.assetType),
        ),
      );

      // Handle the response data as needed
    } catch (e) {
      // Handle errors
    }
  }

  bool _validateForm() {
    if (_selectedMetalType == null ||
        _selectedType == null ||
        _weightController.text.isEmpty) {
      if (_selectedMetalType == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Metal Type is required')),
        );
      } else if (_selectedType == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Type is required')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Weight in grams is required')),
        );
      }
      return false;
    }
    return true;
  }
}
