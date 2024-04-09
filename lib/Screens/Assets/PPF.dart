import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Repositary/Models/AssetModels/PpfRequest.dart';
import '../Repositary/Retrofit/node_api_client.dart';

class PpfScreen extends StatefulWidget {
  final String assetType;

  const PpfScreen({Key? key, required this.assetType}) : super(key: key);

  @override
  _PpfScreenState createState() => _PpfScreenState();
}

class _PpfScreenState extends State<PpfScreen> {
  final TextEditingController _ppfAccountNumberController = TextEditingController();
  final TextEditingController _institutionNameController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('PPF Account', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextField(
              controller: _ppfAccountNumberController,
              labelText: 'PPF Account Number',
              mandatory: true,
            ),
            buildTextField(
              controller: _institutionNameController,
              labelText: 'Institution Name',
              mandatory: true,
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
              Text(
                ' *',
                style: const TextStyle(
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
            contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
        ),
      ],
    );
  }

  void _submitForm() async {
    const String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.'
        'eyJ1c2VySWQiOjIsInVzZXJFbWFpbCI6bnVsbCwidXNlck1vYmlsZSI6IjgzM'
        'jg1NjQ2ODMiLCJpYXQiOjE3MTIzMTkyMTUsImV4cCI6MTcxMjkyNDAxNX0.'
        'bh3HdNwm5-SYVIRwkqVl5z3giOUY9kTGSk7pV7aedwc'; // Replace with your actual token

    final dio = Dio();
    final client = NodeClient(dio);

    final request = PpfRequest(
      assetType: widget.assetType,
      ppfAccountNumber: _ppfAccountNumberController.text,
      institutionName: _institutionNameController.text,
      comments: _commentsController.text,
      attachment: _attachmentController.text,
    );

    try {
      final response = await client.CreatePpf(token, request);
      print(response); // Handle the response data
    } catch (e) {
      print('Failed to submit data: $e');
    }
  }
}
