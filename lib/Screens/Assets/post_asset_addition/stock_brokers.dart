import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/stock_broker_screen.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/StockBrokerRequest.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:Bsure_devapp/Screens/Repositary/Retrofit/node_api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StockBrokerAdd extends StatefulWidget {
  final String assetType;

  const StockBrokerAdd({super.key, required this.assetType});

  @override
  _StockBrokerAddState createState() => _StockBrokerAddState();
}

class _StockBrokerAddState extends State<StockBrokerAdd> {
  final TextEditingController _brokerNameController = TextEditingController();
  final TextEditingController _dematAccountNumberController =
      TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title:
            const Text('Stock Broker', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextField(
              controller: _brokerNameController,
              labelText: 'Broker Name',
              mandatory: true,
            ),
            const SizedBox(height: 16),
            buildTextField(
              controller: _dematAccountNumberController,
              labelText: 'Demat Account Number',
              mandatory: true,
            ),
            const SizedBox(height: 16),
            buildTextField(
              controller: _commentsController,
              labelText: 'Comments (Optional)',
            ),
            const SizedBox(height: 16),
            buildTextField(
              controller: _attachmentController,
              labelText: 'Attachment (Optional)',
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _submitForm();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor : const Color(0xff429bb8), // Set background color here
                ),
                child: const Text('Submit', style: TextStyle(color: Colors.white)),
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
                  color: Colors.red, // Set red color for asterisk
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

    final request = StockBrokerRequest(
      assetType: widget.assetType,
      brokerName: _brokerNameController.text,
      dematAccountNumber: _dematAccountNumberController.text,
      comments: _commentsController.text,
      attachment: _attachmentController.text,
    );

    try {
      final response = await client.CreateStockBroker(token, request);

      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => StockBrokerScreen(assetType: widget.assetType),
        ),
      );
    } catch (e) {
      // Handle errors
    }

    // Clear text fields
    _brokerNameController.clear();
    _dematAccountNumberController.clear();
    _commentsController.clear();
    _attachmentController.clear();
  }

  bool _validateForm() {
    if (_brokerNameController.value.text.isEmpty ||
        _dematAccountNumberController.value.text.isEmpty) {
      if (_brokerNameController.value.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Broker Name is required')),
        );
      } else if (_dematAccountNumberController.value.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Demat Account Number is required')),
        );
      }
      return false;
    }
    return true;
  }
}
