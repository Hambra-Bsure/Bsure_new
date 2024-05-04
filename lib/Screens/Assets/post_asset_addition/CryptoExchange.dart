import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/crypto_exchange_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Repositary/Models/AssetModels/CryptoExchangeRequest.dart';
import '../../Repositary/Retrofit/node_api_client.dart';

class CryptoExchangeAdd extends StatefulWidget {
  final String assetType;

  const CryptoExchangeAdd({super.key, required this.assetType});

  @override
  _CryptoExchangeAddState createState() => _CryptoExchangeAddState();
}

class _CryptoExchangeAddState extends State<CryptoExchangeAdd> {
  final TextEditingController _exchangeNameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _walletAddressController =
      TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Crypto Exchange Account',
            style: TextStyle(color: Colors.white)),
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
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
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
      // Handle the response data

      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              CryptoExchangeScreen(assetType: widget.assetType),
        ),
      );
    } catch (e) {}
  }

  bool _validateForm() {
    if (_exchangeNameController.text.isEmpty ||
        _accountNumberController.text.isEmpty) {
      if (_exchangeNameController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Exchange Name is required')),
        );
      }
      if (_accountNumberController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Account Number is required')),
        );
      }
      return false;
    }
    return true;
  }
}
