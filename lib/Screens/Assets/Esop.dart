import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../Repositary/Models/AssetModels/EsopRequest.dart';
import '../Repositary/Retrofit/node_api_client.dart';

class EsopScreen extends StatefulWidget {
  final String assetType;

  const EsopScreen({Key? key, required this.assetType}) : super(key: key);

  @override
  _EsopScreenState createState() => _EsopScreenState();
}

class _EsopScreenState extends State<EsopScreen> {
  final TextEditingController _assetTypeController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _numberOfStocksController =
      TextEditingController();
  final TextEditingController _optionPriceController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _totalSharesController = TextEditingController();
  final TextEditingController _issuePriceController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('ESOP', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextField(
              controller: _companyNameController,
              labelText: 'Company Name',
              mandatory: true,
            ),
            buildTextField(
              controller: _numberOfStocksController,
              labelText: 'Number of Stocks',
              mandatory: true,
            ),
            buildTextField(
              controller: _optionPriceController,
              labelText: 'Option Price (Optional)',
              mandatory: false,
            ),
            buildDateField(
              controller: _expiryDateController,
              labelText: 'Expiry Date (Optional)',
              mandatory: false,
            ),
            buildTextField(
              controller: _totalSharesController,
              labelText: 'Total Shares Available (Optional)',
              mandatory: false,
            ),
            buildTextField(
              controller: _issuePriceController,
              labelText: 'Issue Price Per Share (Optional)',
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

  Widget buildDateField({
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
        InkWell(
          onTap: () {
            _selectDate(context);
          },
          child: IgnorePointer(
            child: TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _expiryDateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  void _submitForm() async {
    const String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.'
        'eyJ1c2VySWQiOjIsInVzZXJFbWFpbCI6bnVsbCwidXNlck1vYmlsZSI6IjgzM'
        'jg1NjQ2ODMiLCJpYXQiOjE3MTIzMTkyMTUsImV4cCI6MTcxMjkyNDAxNX0.'
        'bh3HdNwm5-SYVIRwkqVl5z3giOUY9kTGSk7pV7aedwc'; // Replace with your actual token


      final dio = Dio();
      final client = NodeClient(dio);

      // Proceed with form submission logic here...
      final esopRequest = EsopRequest(
        assetType: widget.assetType,
        companyName: _companyNameController.text,
        numberOfStocks: int.tryParse(_numberOfStocksController.text),
        optionPrice: int.tryParse(_optionPriceController.text),
        expiryDate: _expiryDateController.text,
        totalSharesAvailableForIssue:
        int.tryParse(_totalSharesController.text),
        issuePricePerShare: int.tryParse(_issuePriceController.text),
        comments: _commentsController.text,
        attachment: _attachmentController.text,
      );

      try {
        final response = await client.CreateEsop(token, esopRequest);
        // Handle the response as needed
        if (response.success == true) {
          // Show success message or navigate to another screen
        } else {
          // Show error message or handle the error
        }
      } catch (e) {
        // Handle errors
      }

      // After submitting the form, you might want to clear the form fields
      _assetTypeController.clear();
      _companyNameController.clear();
      _numberOfStocksController.clear();
      _optionPriceController.clear();
      _expiryDateController.clear();
      _totalSharesController.clear();
      _issuePriceController.clear();
      _commentsController.clear();
      _attachmentController.clear();
    }

  }
