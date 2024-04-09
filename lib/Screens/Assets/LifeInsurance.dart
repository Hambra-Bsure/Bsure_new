import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/LifeInsuranceRequest.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:Bsure_devapp/Screens/Repositary/Retrofit/node_api_client.dart';

class LifeInsuranceScreen extends StatefulWidget {
  final String assetType;

  const LifeInsuranceScreen({Key? key, required this.assetType}) : super(key: key);

  @override
  _LifeInsuranceScreenState createState() => _LifeInsuranceScreenState();
}

class _LifeInsuranceScreenState extends State<LifeInsuranceScreen> {
  final TextEditingController _insuranceCompanyNameController = TextEditingController();
  final TextEditingController _policyNameController = TextEditingController();
  final TextEditingController _policyNumberController = TextEditingController();
  final TextEditingController _coverageAmountController = TextEditingController();
  final TextEditingController _maturityDateController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Life Insurance', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextField(
                controller: _insuranceCompanyNameController,
                labelText: 'Insurance Company Name',
                mandatory: true,
              ),
              buildTextField(
                controller: _policyNameController,
                labelText: 'Policy Name (Optional)',
              ),
              buildTextField(
                controller: _policyNumberController,
                labelText: 'Policy Number (Optional)',
              ),
              buildTextField(
                controller: _coverageAmountController,
                labelText: 'Coverage Amount (Optional)',
              ),
              buildTextField(
                controller: _maturityDateController,
                labelText: 'Maturity Date (Optional)',
                readOnly: true,
                onTap: () {
                  _selectMaturityDate(context);
                },
              ),
              buildTextField(
                controller: _commentsController,
                labelText: 'Comments (Optional)',
              ),
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
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    bool readOnly = false,
    bool mandatory = false,
    GestureTapCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: labelText,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (mandatory)
                  TextSpan(
                    text: ' *',
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            readOnly: readOnly,
            onTap: onTap,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectMaturityDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _maturityDateController.text = pickedDate.toString().substring(0, 10);
      });
    }
  }

  void _submitForm() async {
    const String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.'
        'eyJ1c2VySWQiOjIsInVzZXJFbWFpbCI6bnVsbCwidXNlck1vYmlsZSI6IjgzM'
        'jg1NjQ2ODMiLCJpYXQiOjE3MTIzMTkyMTUsImV4cCI6MTcxMjkyNDAxNX0.'
        'bh3HdNwm5-SYVIRwkqVl5z3giOUY9kTGSk7pV7aedwc'; // Replace with your actual token

    final dio = Dio();
    final client = NodeClient(dio);

    final request = LifeInsuranceRequest(
      assetType: widget.assetType,
      insuranceCompanyName: _insuranceCompanyNameController.text,
      policyName: _policyNameController.text,
      policyNumber: _policyNumberController.text,
      coverageAmount: int.tryParse(_coverageAmountController.text),
      maturityDate: _maturityDateController.text,
      comments: _commentsController.text,
      attachment: _attachmentController.text,
    );

    try {
      final response = await client.CreateLifeInsurance(token, request);
      // Handle the response here
      print(response.toJson());
    } catch (e) {
      // Handle errors
      print(e.toString());
    }

    // Clear text fields
    _insuranceCompanyNameController.clear();
    _policyNameController.clear();
    _policyNumberController.clear();
    _coverageAmountController.clear();
    _maturityDateController.clear();
    _commentsController.clear();
    _attachmentController.clear();
  }
}
