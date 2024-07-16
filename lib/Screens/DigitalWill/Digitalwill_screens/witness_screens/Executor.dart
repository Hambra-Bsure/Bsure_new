import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'willpdf_download.dart';
import '../../../Repositary/Models/Digital_will/Subscriptions/Will_executor_req.dart';
import '../../../Repositary/Models/Digital_will/Subscriptions/Will_ececutor_res.dart';

class WillExecutorScreen extends StatefulWidget {
  const WillExecutorScreen({Key? key}) : super(key: key);

  @override
  _WillExecutorScreenState createState() => _WillExecutorScreenState();
}

class _WillExecutorScreenState extends State<WillExecutorScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _religionController = TextEditingController();
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _checkExecutorExists();
  }

  Future<void> _checkExecutorExists() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    const url = 'https://dev.bsure.live/v2/will/executor';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final executorData = jsonDecode(response.body);
        if (executorData != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => PdfDownloadScreen()),
          );
        }
      } else {
        setState(() {
          _errorMessage =
          'Failed to check executor data. Status code: ${response.statusCode}';
        });
        _showErrorMessage(
            'Failed to check executor data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error checking executor data: $e';
      });
      _showErrorMessage('Error checking executor data: $e');
    }
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    const url = 'https://dev.bsure.live/v2/will/executor';

    final willExecutor = WillExecutorReq(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      mobile: _mobileController.text,
      fatherName: _fatherNameController.text,
      age: int.tryParse(_ageController.text),
      religion: _religionController.text,
    );

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(willExecutor.toJson()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PdfDownloadScreen()),
        );
      } else {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final errorResponse = WillExecutorRes.fromJson(responseData);
        _showErrorMessage(errorResponse.message ?? 'Failed to save data');
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error saving data: $e';
      });
      _showErrorMessage('Error saving data: $e');
    }
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  String? _validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter first name';
    }
    return null;
  }

  String? _validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter last name';
    }
    return null;
  }

  String? _validateMobileNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter mobile number';
    }
    if (value.length != 10) {
      return 'Mobile number must be 10 digits';
    }
    return null;
  }

  String? _validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter address';
    }
    return null;
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    bool mandatory = false,
    bool isNumeric = false,
    String? Function(String?)? validator,
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
          validator: validator,
          inputFormatters: isNumeric
              ? [
            FilteringTextInputFormatter.digitsOnly,
            NoLeadingSpaceFormatter(),
          ]
              : [NoLeadingSpaceFormatter()],
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding:
            EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
          keyboardType:
          isNumeric ? TextInputType.number : TextInputType.text,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title:
        const Text('Will Executor', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              _buildTextField(
                controller: _firstNameController,
                labelText: 'First name',
                validator: _validateFirstName,
                mandatory: true,
              ),
              const SizedBox(height: 15),
              _buildTextField(
                controller: _lastNameController,
                labelText: 'Last name',
                validator: _validateLastName,
                mandatory: true,
              ),
              const SizedBox(height: 15),
              _buildTextField(
                controller: _ageController,
                labelText: 'Age',
                isNumeric: true,
              ),
              const SizedBox(height: 15),
              _buildTextField(
                controller: _mobileController,
                labelText: 'Mobile no',
                validator: _validateMobileNumber,
                mandatory: true,
                isNumeric: true,
              ),
              const SizedBox(height: 15),
              _buildTextField(
                controller: _religionController,
                labelText: 'Religion',
              ),
              const SizedBox(height: 15),
              _buildTextField(
                  controller: _fatherNameController,
                  labelText: 'Father name',
              ),
              const SizedBox(height: 15),
              _buildTextField(
                controller: _religionController,
                labelText: 'Address',
                validator: _validateAddress,
                mandatory: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _saveData();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff429bb8),
                ),
                child:
                const Text('Save', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NoLeadingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.startsWith(' ')) {
      return oldValue;
    }
    return newValue;
  }
}
