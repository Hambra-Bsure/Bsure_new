import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Bsure_devapp/Screens/Repositary/Retrofit/node_api_client.dart';
import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/life_insurance_screen.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/LifeInsuranceRequest.dart';

class LifeInsuranceAdd extends StatefulWidget {
  final String assetType;

  const LifeInsuranceAdd({Key? key, required this.assetType}) : super(key: key);

  @override
  _LifeInsuranceAddState createState() => _LifeInsuranceAddState();
}

class _LifeInsuranceAddState extends State<LifeInsuranceAdd> {
  final TextEditingController _insuranceCompanyNameController =
      TextEditingController();
  final TextEditingController _policyNameController = TextEditingController();
  final TextEditingController _policyNumberController = TextEditingController();
  final TextEditingController _coverageAmountController =
      TextEditingController();
  final TextEditingController _maturityDateController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  String? maturityDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title:
            const Text('LifeInsurance', style: TextStyle(color: Colors.white)),
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
              buildDateField(
                controller: _maturityDateController,
                labelText: 'Maturity Date (Optional)',
                //mandatory: false,
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
    if (picked != null) {
      setState(() {
        //_maturityDateController.text = "${picked.toLocal()}".split(' ')[0];
        _maturityDateController.text = picked.toIso8601String();
        maturityDate = _maturityDateController.text; // Update maturityDate
      });
    }
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
          TextField(
            controller: controller,
            readOnly: readOnly,
            onTap: onTap,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm() async {

    if (!_validateForm()) {
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token"); // Retrieve token from SharedPreferences

    // Check if token is null or empty
    if (token == null || token.isEmpty) {
      // Handle the case where token is not available
      print('Token is not available');
      return;
    }

    final dio = Dio();
    final client = NodeClient(dio);

    print("Maturity Date: $maturityDate");
    print("Maturity Date: ${maturityDate.runtimeType}");

    // _maturityDateController.text == ""
    //     ? null
    //     : _maturityDateController
    //     .text,

    final request = LifeInsuranceRequest(
      assetType: widget.assetType,
      insuranceCompanyName: _insuranceCompanyNameController.text,
      policyName: _policyNameController.text,
      policyNumber: _policyNumberController.text,
      coverageAmount: _coverageAmountController.text.isNotEmpty
          ? int.tryParse(_coverageAmountController.text)
          : null,
      maturityDate: _maturityDateController.text == ""
          ? null
          : _maturityDateController
          .text,
      comments: _commentsController.text,
      attachment: _attachmentController.text,
    );

    try {
      final response = await client.CreateLifeInsurance(token, request);
      print(response.toJson());

      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              LifeInsuranceScreen(assetType: widget.assetType),
        ),
      );
    } catch (e) {
      // Handle errors
      print(e.toString());
    }
  }

  bool _validateForm() {
    if (_insuranceCompanyNameController.value.text.isEmpty) { // Check if AMC name is empty

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('InsuranceCompanyName is required')),
      );
      return false;
    }
    return true;
  }
}
