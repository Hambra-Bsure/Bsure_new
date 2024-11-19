import 'dart:convert';
import 'package:Bsure_devapp/Screens/Utils/DisplayUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../LoginScreen.dart';
import '../../../../Repositary/Models/Digital_will/Subscriptions/Will_ececutor_res.dart';
import '../../../../Repositary/Models/Digital_will/Subscriptions/Will_executor_req.dart';
import 'GetExecutor.dart';

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
  final TextEditingController _addressController = TextEditingController();
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (token == null || token.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Token'),
          content: const Text('Please log in again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    const url = 'https://dev.bsure.live/v2/will/executor';

    final willExecutor = WillExecutorReq(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      mobile: _mobileController.text,
      fatherName: _fatherNameController.text,
      age: int.tryParse(_ageController.text),
      religion: _religionController.text,
      address: _addressController.text,
    );

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(willExecutor.toJson()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token,
        },
      );

      if (response.statusCode == 200) {
        DisplayUtils.showToast("Executor successfully created");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => GetExecutor()),
        );
      } else {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final errorResponse = WillExecutorRes.fromJson(responseData);
        setState(() {
          _errorMessage = errorResponse.message ?? 'Failed to save data';
        });
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

  String? _validateFatherName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter father name';
    }
    if (value.length < 2) {
      return 'Father name must be at least 2 characters';
    }
    return null;
  }

  String? _validateReligion(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter religion';
    }
    if (value.length < 2) {
      return 'Religion must be at least 2 characters';
    }
    return null;
  }

  String? _validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter age';
    }
    final int? age = int.tryParse(value);
    if (age == null) {
      return 'Age must be a number';
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
          keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text(
          'Will Executor',
          style: TextStyle(color: Colors.white),
        ),
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
                mandatory: true,
                validator: _validateFirstName,
              ),
              const SizedBox(height: 15),
              _buildTextField(
                controller: _lastNameController,
                labelText: 'Last name',
                mandatory: true,
                validator: _validateLastName,
              ),
              const SizedBox(height: 15),
              _buildTextField(
                controller: _ageController,
                labelText: 'Age',
                isNumeric: true,
                mandatory: true,
                validator: _validateAge,
              ),
              const SizedBox(height: 15),
              _buildTextField(
                controller: _mobileController,
                labelText: 'Mobile no',
                isNumeric: true,
                mandatory: true,
                validator: _validateMobileNumber,
              ),
              const SizedBox(height: 15),
              _buildTextField(
                controller: _religionController,
                labelText: 'Religion',
                mandatory: true,
                validator: _validateReligion,
              ),
              const SizedBox(height: 15),
              _buildTextField(
                controller: _fatherNameController,
                labelText: 'Father name',
                mandatory: true,
                validator: _validateFatherName,
              ),
              const SizedBox(height: 15),
              _buildTextField(
                controller: _addressController,
                labelText: 'Address',
                mandatory: true,
                validator: _validateAddress,
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  if (_firstNameController.text.isEmpty) {
                    DisplayUtils.showToast('firstname  is required');
                    return; // Exit the method if the mobile number is empty
                  } else if (_lastNameController.text.isEmpty) {
                    DisplayUtils.showToast('lastname  is required');
                    return; // Exit the method if the mobile number is empty
                  } else  if (_mobileController.text.isEmpty) {
                    DisplayUtils.showToast('Mobilenumber is required');
                    return; // Exit the method if the mobile number is empty
                  } else if (_fatherNameController.text.isEmpty) {
                    DisplayUtils.showToast('fathername  is required');
                    return; // Exit the method if the mobile number is empty
                  } else if (_ageController.text.isEmpty) {
                    DisplayUtils.showToast('age  is required');
                    return; // Exit the method if the mobile number is empty
                  } else  if (_religionController.text.isEmpty) {
                    DisplayUtils.showToast('Religion  is required');
                    return; // Exit the method if the mobile number is empty
                  } else if (_addressController.text.isEmpty) {
                    DisplayUtils.showToast('address is required');
                    return; // Exit the method if the mobile number is empty
                  }
                  _saveData();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff429bb8),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
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
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    if (newValue.text.startsWith(' ')) {
      return oldValue;
    }
    return newValue;
  }
}
