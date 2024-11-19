import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart'; // Import this for TextInputFormatter
import '../../../../LoginScreen.dart';
import '../../../../Repositary/Models/Digital_will/Subscriptions/GetExecutorResponse.dart';
import '../../../../Utils/DisplayUtils.dart';

class EditExecutor extends StatefulWidget {
  final Executor executor;

  EditExecutor({required this.executor});

  @override
  _EditExecutorState createState() => _EditExecutorState();
}

class _EditExecutorState extends State<EditExecutor> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _fatherNameController;
  late TextEditingController _mobileController;
  late TextEditingController _ageController;
  late TextEditingController _religionController;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: widget.executor.firstName);
    _lastNameController = TextEditingController(text: widget.executor.lastName);
    _fatherNameController = TextEditingController(text: widget.executor.fatherName);
    _mobileController = TextEditingController(text: widget.executor.mobile);
    _ageController = TextEditingController(text: widget.executor.age?.toString());
    _religionController = TextEditingController(text: widget.executor.religion);
  }

  Future<void> _updateExecutor() async {
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
    }

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

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

    setState(() {
      _loading = true;
    });

    try {
      final dio = Dio();
      final response = await dio.put(
        'https://dev.bsure.live/v2/will/executor',
        data: {
          "id": widget.executor.id,
          'firstName': _firstNameController.text,
          'lastName': _lastNameController.text,
          'fatherName': _fatherNameController.text,
          'mobile': _mobileController.text,
          'age': int.parse(_ageController.text),
          'religion': _religionController.text,
        },
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Executor updated successfully')),
        );
        Navigator.of(context).pop(true); // Indicate success
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update executor')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text(
          'Edit Executor',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              buildTextFormField(
                controller: _firstNameController,
                labelText: 'First Name',
                mandatory: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter first name';
                  }
                  return null;
                },
              ),
              buildTextFormField(
                controller: _lastNameController,
                labelText: 'Last Name',
                mandatory: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter last name';
                  }
                  return null;
                },
              ),
              buildTextFormField(
                controller: _fatherNameController,
                labelText: 'Father Name',
                mandatory: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter father name';
                  }
                  return null;
                },
              ),
              buildTextFormField(
                controller: _mobileController,
                labelText: 'Mobile',
                isNumeric: true,
                mandatory: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter mobile number';
                  }
                  return null;
                },
              ),
              buildTextFormField(
                controller: _ageController,
                labelText: 'Age',
                isNumeric: true,
                mandatory: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter age';
                  }
                  return null;
                },
              ),
              buildTextFormField(
                controller: _religionController,
                labelText: 'Religion',
                mandatory: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter religion';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _updateExecutor,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff429bb8),
                ),
                child: const Text('Update', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField({
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
            NoLeadingSpaceFormatter(), // Formatter applied here
          ]
              : [NoLeadingSpaceFormatter()],
          // Formatter applied here
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(
                vertical: 12.0, horizontal: 16.0),
          ),
          keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
        ),
      ],
    );
  }
}

class NoLeadingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.startsWith(' ')) {
      return oldValue;
    }
    return newValue;
  }
}
