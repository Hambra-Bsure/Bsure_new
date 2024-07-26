import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../Repositary/Models/Digital_will/Subscriptions/GetExecutorResponse.dart';

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
    if (!_formKey.currentState!.validate()) return;

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';


    if (token.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Token not found')),
      );
      return;
    }

    setState(() {
      _loading = true;
    });

    try {
      final dio = Dio();
      final response = await dio.put(
        'http://43.205.12.154:8080/v2/will/executor',
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
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter first name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter last name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _fatherNameController,
                decoration: InputDecoration(labelText: 'Father Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter father name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _mobileController,
                decoration: InputDecoration(labelText: 'Mobile'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter mobile number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter age';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _religionController,
                decoration: InputDecoration(labelText: 'Religion'),
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
                child: const Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
