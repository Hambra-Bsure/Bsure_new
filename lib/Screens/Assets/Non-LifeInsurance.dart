import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:Bsure_devapp/Screens/Repositary/Retrofit/node_api_client.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/NonLifeInsuranceRequest.dart';

class NonLifeInsuranceScreen extends StatefulWidget {
  final String assetType;

  const NonLifeInsuranceScreen({Key? key, required this.assetType}) : super(key: key);

  @override
  _NonLifeInsuranceScreenState createState() => _NonLifeInsuranceScreenState();
}

class _NonLifeInsuranceScreenState extends State<NonLifeInsuranceScreen> {
  final TextEditingController _insuranceCompanyNameController = TextEditingController();
  final TextEditingController _policyNameController = TextEditingController();
  final TextEditingController _policyNumberController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  final List<String> _insuranceTypes = ['Health Insurance', 'Property Insurance', 'Motor Insurance', 'Other'];

  String? _selectedDropdownValue; // Track selected dropdown value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Non-Life Insurance', style: TextStyle(color: Colors.white)),
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
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Type of Insurance ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: '*',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: _selectedDropdownValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedDropdownValue = value;
                      });
                    },
                    items: _insuranceTypes.map((type) {
                      return DropdownMenuItem<String>(
                        value: type,
                        child: Text(type),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              buildTextField(
                controller: _policyNameController,
                labelText: 'Policy Name (Optional)',
              ),
              const SizedBox(height: 16),
              buildTextField(
                controller: _policyNumberController,
                labelText: 'Policy Number (Optional)',
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
                  onPressed: _selectedDropdownValue != null ? _submitForm : null,
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
    bool mandatory = false,
  }) {
    return Column(
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
                const TextSpan(
                  text: ' *',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
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

    try {
      final response = await client.CreateNonLifeInsurance(
        token,
        NonLifeInsuranceRequest(
          assetType: widget.assetType,
          insuranceCompanyName: _insuranceCompanyNameController.text,
          typeOfInsurance: _selectedDropdownValue,
          policyName: _policyNameController.text,
          policyNumber: _policyNumberController.text,
          comments: _commentsController.text,
          attachment: _attachmentController.text,
        ),
      );

      // Handle response
      print(response.toJson());

      // Clear text fields
      _insuranceCompanyNameController.clear();
      _policyNameController.clear();
      _policyNumberController.clear();
      _commentsController.clear();
      _attachmentController.clear();

      // Reset dropdown value
      setState(() {
        _selectedDropdownValue = null;
      });
    } catch (e) {
      // Handle error
      print(e.toString());
    }
  }
}
