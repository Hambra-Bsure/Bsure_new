import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../Repositary/Models/User_models/Get_user_res.dart';
import '../Repositary/Models/User_models/User_request.dart';
import 'Get_profile.dart';

class EditUser extends StatefulWidget {
  final GetUserResponse? userProfile;

  const EditUser({super.key, required this.userProfile});

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _whatsappController;
  late TextEditingController _secondaryController;
  late TextEditingController _addressController;
  late TextEditingController _panNumberController;
  late TextEditingController _ageController;

  late String _gender;

  @override
  void initState() {
    super.initState();
    _firstNameController =
        TextEditingController(text: widget.userProfile?.user?.firstName ?? '');
    _lastNameController =
        TextEditingController(text: widget.userProfile?.user?.lastName ?? '');
    _emailController =
        TextEditingController(text: widget.userProfile?.user?.email ?? '');
    _whatsappController = TextEditingController(
        text: widget.userProfile?.user?.whatsappNumber ?? '');
    _secondaryController = TextEditingController(
        text: widget.userProfile?.user?.secondaryNumber ?? '');
    _addressController =
        TextEditingController(text: widget.userProfile?.user?.address ?? '');
    _panNumberController =
        TextEditingController(text: widget.userProfile?.user?.panNumber ?? '');
    _ageController = TextEditingController(
        text: widget.userProfile?.user?.age?.toString() ?? '');
    _gender = widget.userProfile?.user?.gender ?? 'Male';
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _whatsappController.dispose();
    _secondaryController.dispose();
    _addressController.dispose();
    _panNumberController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title:
            const Text('Edit Profile', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _firstNameController,
              decoration: const InputDecoration(labelText: 'First Name'),
            ),
            TextFormField(
              controller: _lastNameController,
              decoration: const InputDecoration(labelText: 'Last Name'),
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: _whatsappController,
              decoration: const InputDecoration(labelText: 'WhatsApp Number'),
            ),
            TextFormField(
              controller: _secondaryController,
              decoration: const InputDecoration(labelText: 'Secondary Number'),
            ),
            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            TextFormField(
              controller: _panNumberController,
              decoration: const InputDecoration(labelText: 'PAN Number'),
            ),
            TextFormField(
              controller: _ageController,
              decoration: const InputDecoration(labelText: 'Age'),
            ),
            DropdownButtonFormField<String>(
              value: _gender,
              onChanged: (newValue) {
                setState(() {
                  _gender = newValue!;
                });
              },
              items: <String>['Male', 'Female', 'Other']
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
              decoration: const InputDecoration(labelText: 'Gender'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                submitForm();
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> submitForm() async {
    if (!validateForm(context)) {
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      print('Token is not available');
      return;
    }

    final req = UserRequest(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      email: _emailController.text.isEmpty ? null : _emailController.text,
      whatsappNumber: _whatsappController.text,
      secondaryNumber:
          _secondaryController.text.isEmpty ? null : _secondaryController.text,
      address: _addressController.text.isEmpty ? null : _addressController.text,
      panNumber:
          _panNumberController.text.isEmpty ? null : _panNumberController.text,
      age: int.tryParse(_ageController.text) ?? 0,
      gender: _gender,
    );

    try {
      final response = await http.patch(
        Uri.parse('http://43.205.12.154:8080/v2/users/update'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": token,
        },
        body: jsonEncode(req.toJson()), // Encode req to JSON
      );

      if (response.statusCode == 200) {
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfileScreen(),
          ),
        );
        final jsonResponse = json.decode(response.body);
        // Handle successful response
        print('User updated successfully: $jsonResponse');
      } else {
        // Handle error response
        print('Failed to update user');
      }
    } catch (e) {
      // Handle network or server errors
      print('Error: $e');
    }
  }

  bool validateForm(BuildContext context) {
    if (_firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _whatsappController.text.isEmpty ||
        _ageController.text.isEmpty) {
      if (_firstNameController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('First Name is required')),
        );
      } else if (_lastNameController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Last Name is required')),
        );
      } else if (_whatsappController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('WhatsApp number is required')),
        );
      } else if (_ageController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Age is required')),
        );
      } else if (_gender == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Gender is required')),
        );
      }
      return false;
    }
    return true;
  }
}
