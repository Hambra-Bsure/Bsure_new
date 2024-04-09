import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Repositary/Models/AssetModels/CryptoExchangeRequest.dart';
import '../Repositary/Retrofit/node_api_client.dart';

class CryptoExchangeScreen extends StatefulWidget {
  final String assetType;

  const CryptoExchangeScreen({Key? key, required this.assetType}) : super(key: key);

  @override
  _CryptoExchangeScreenState createState() => _CryptoExchangeScreenState();
}

class _CryptoExchangeScreenState extends State<CryptoExchangeScreen> {
  final TextEditingController _exchangeNameController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();
  final TextEditingController _walletAddressController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Crypto Exchange Account', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextField(
              controller: _exchangeNameController,
              labelText: 'Exchange Name',
              mandatory: true,
            ),
            buildTextField(
              controller: _accountNumberController,
              labelText: 'Account Number',
              mandatory: true,
            ),
            buildTextField(
              controller: _walletAddressController,
              labelText: 'Wallet Address (Optional)',
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

    final request = CryptoExchangeRequest(
      assetType: widget.assetType,
      exchangeName: _exchangeNameController.text,
      accountNumber: _accountNumberController.text,
      walletAddress: _walletAddressController.text,
      comments: _commentsController.text,
      attachment: _attachmentController.text,
    );

    try {
      final response = await client.CreateCryptoExchange(token, request);
      print(response); // Handle the response data
    } catch (e) {
      print('Failed to submit data: $e');
    }
  }
}
