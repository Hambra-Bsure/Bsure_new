import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/loan_given_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/AssetModels/LoanGivenRequest.dart';
import '../../Repositary/Retrofit/node_api_client.dart';

class LoanGivenAdd extends StatefulWidget {
  final String assetType;

  const LoanGivenAdd({Key? key, required this.assetType}) : super(key: key);

  @override
  _LoanGivenAddState createState() => _LoanGivenAddState();
}

class _LoanGivenAddState extends State<LoanGivenAdd> {
  final TextEditingController _assetTypeController = TextEditingController();
  final TextEditingController _borrowerNameController = TextEditingController();
  final TextEditingController _loanAmountController = TextEditingController();
  final TextEditingController _loanGivenDateController =
      TextEditingController();
  final TextEditingController _interestRateController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Loan Given', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextField(
              controller: _borrowerNameController,
              labelText: 'Borrower Name',
              mandatory: true,
            ),
            buildTextField(
              controller: _loanAmountController,
              labelText: 'Loan Amount',
              mandatory: true,
            ),
            buildDateField(
              controller: _loanGivenDateController,
              labelText: 'Loan Given Date (Optional)',
              mandatory: false,
            ),
            buildTextField(
              controller: _interestRateController,
              labelText: 'Interest Rate (Optional)',
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
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
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
        TextFormField(
          controller: controller,
          readOnly: true,
          onTap: () async {
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: _selectedDate ?? DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );
            if (pickedDate != null && pickedDate != _selectedDate) {
              setState(() {
                _selectedDate = pickedDate;
                controller.text = pickedDate.toString().split(' ')[0];
              });
            }
          },
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
    var token = prefs.getString("token");

    if (token == null || token.isEmpty) {
      print('Token is not available');
      return;
    }

    final dio = Dio();
    final client = NodeClient(dio);

    final request = LoanGivenRequest(
      assetType: widget.assetType,
      borrowerName: _borrowerNameController.text,
      loanAmount: int.tryParse(_loanAmountController.text),
      loanGivenDate: _loanGivenDateController.text,
      interestRate: int.tryParse(_interestRateController.text),
      comments: _commentsController.text,
      attachment: _attachmentController.text,
    );

    try {
      final response = await client.CreateLoanGiven(token, request);
      print(response);

      // Close the current screen
      Navigator.pop(context);

      // Navigate to the LoanGivenScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoanGivenScreen(assetType: widget.assetType),
        ),
      );
    } catch (e) {
      print('Failed to submit data: $e');
      // Handle errors
    }
  }
}
