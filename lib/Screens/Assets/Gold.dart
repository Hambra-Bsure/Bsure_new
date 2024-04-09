import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Repositary/Models/AssetModels/GoldRequest.dart';
import '../Repositary/Retrofit/node_api_client.dart';

class GoldScreen extends StatefulWidget {
  final String assetType;

  const GoldScreen({Key? key, required this.assetType}) : super(key: key);

  @override
  _GoldScreenState createState() => _GoldScreenState();
}

enum MetalType { Gold, Silver }
enum Type { Ring, Earing, Necklace }

class _GoldScreenState extends State<GoldScreen> {
  final TextEditingController _assetTypeController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _whereItIsKeptController = TextEditingController();
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
                  child: Text(type
                      .toString()
                      .split('.')
                      .last),
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
                  child: Text(type
                      .toString()
                      .split('.')
                      .last),
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
            contentPadding: EdgeInsets.symmetric(
                vertical: 12.0, horizontal: 16.0),
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
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(
                vertical: 12.0, horizontal: 16.0),
          ),
        ),
      ],
    );
  }

  void _submitForm() async {
    const String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.'
        'eyJ1c2VySWQiOjIsInVzZXJFbWFpbCI6bnVsbCwidXNlck1vYmlsZSI6IjgzM'
        'jg1NjQ2ODMiLCJpYXQiOjE3MTIzMTkyMTUsImV4cCI6MTcxMjkyNDAxNX0.'
        'bh3HdNwm5-SYVIRwkqVl5z3giOUY9kTGSk7pV7aedwc'; // Replace with your actual token

    final dio = Dio();
    final client = NodeClient(dio);

    final request = GoldRequest(
      assetType: widget.assetType,
      metalType: _selectedMetalType != null ? _selectedMetalType
          .toString()
          .split('.')
          .last : null,
      type: _selectedType != null ? _selectedType
          .toString()
          .split('.')
          .last : null,
      weightInGrams: int.parse(_weightController.text),
      whereItIsKept: _whereItIsKeptController.text,
      comments: _commentsController.text,
      attachment: _attachmentController.text,
    );

    try {
      final response = await client.CreateGold(token, request);
      print(response);
      // Handle the response data as needed
    } catch (e) {
      print('Failed to submit data: $e');
      // Handle errors
    }
  }
}
