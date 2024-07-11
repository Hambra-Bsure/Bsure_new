import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../Repositary/Models/User_models/Get_user_res.dart';
import 'Get_profile.dart';

class EditUser extends StatefulWidget {
  final GetUserResponse? userProfile;

  const EditUser({Key? key, required this.userProfile}) : super(key: key);

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
    _firstNameController = TextEditingController(
        text: widget.userProfile?.user?.firstName?.trim() ?? '');
    _lastNameController = TextEditingController(
        text: widget.userProfile?.user?.lastName?.trim() ?? '');
    _emailController = TextEditingController(
        text: widget.userProfile?.user?.email?.trim() ?? '');
    _whatsappController = TextEditingController(
        text: widget.userProfile?.user?.whatsappNumber?.trim() ?? '');
    _secondaryController = TextEditingController(
        text: widget.userProfile?.user?.secondaryNumber?.trim() ?? '');
    _addressController = TextEditingController(
        text: widget.userProfile?.user?.address?.trim() ?? '');
    _panNumberController = TextEditingController(
        text: widget.userProfile?.user?.panNumber?.trim() ?? '');
    _ageController = TextEditingController(
        text: widget.userProfile?.user?.age?.toString().trim() ?? '');
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
            const Text('Edit profile', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildFirstNameField(),
            const SizedBox(height: 10),
            _buildLastNameField(),
            const SizedBox(height: 10),
            _buildEmailField(),
            const SizedBox(height: 10),
            _buildAgeField(),
            const SizedBox(height: 10),
            _buildGenderDropdown(),
            const SizedBox(height: 10),
            _buildWhatsAppField(),
            const SizedBox(height: 10),
            _buildSecondaryNoField(),
            const SizedBox(height: 10),
            _buildAddressField(),
            const SizedBox(height: 10),
            _buildPanNumberField(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: submitForm,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                backgroundColor: const Color(0xff429bb8),
              ),
              child: const Text(
                'Update',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    bool isMandatory = false,
    bool isNumeric = false,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: isMandatory ? '$labelText' : labelText,
        labelStyle: const TextStyle(color: Colors.black), // Label text color
        suffixIcon: isMandatory
            ? const Text(
                ' *',
                style: TextStyle(color: Colors.red), // Asterisk color
              )
            : null,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (isMandatory && value!.isEmpty) {
          return 'Please enter $labelText.';
        }
        return null;
      },
      inputFormatters: isNumeric
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
            ]
          : <TextInputFormatter>[
              NoLeadingSpaceFormatter(),
            ],
    );
  }

  Widget _buildFirstNameField() {
    return _buildTextField(
      controller: _firstNameController,
      labelText: 'First name',
      isMandatory: true,
    );
  }

  Widget _buildLastNameField() {
    return _buildTextField(
      controller: _lastNameController,
      labelText: 'Last name',
      isMandatory: true,
    );
  }

  Widget _buildEmailField() {
    return _buildTextField(
      controller: _emailController,
      labelText: 'Email id',
    );
  }

  Widget _buildAgeField() {
    return _buildTextField(
      controller: _ageController,
      labelText: 'Age',
      isMandatory: true,
      isNumeric: true,
    );
  }

  Widget _buildGenderDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Gender',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          isExpanded: true,
          value: _gender.isNotEmpty ? _gender : null, // Ensure value is not empty or null
          items: const [
            DropdownMenuItem<String>(
              value: 'Male',
              child: Text('Male'),
            ),
            DropdownMenuItem<String>(
              value: 'Female',
              child: Text('Female'),
            ),
            DropdownMenuItem<String>(
              value: 'Other',
              child: Text('Other'),
            ),
          ],
          onChanged: (String? newValue) {
            setState(() {
              _gender = newValue ?? ''; // Handle null case gracefully
            });
          },
        ),
      ],
    );
  }


  Widget _buildWhatsAppField() {
    return _buildTextField(
      controller: _whatsappController,
      labelText: 'WhatsApp no',
      isMandatory: true,
    );
  }

  Widget _buildSecondaryNoField() {
    return _buildTextField(
      controller: _secondaryController,
      labelText: 'Secondary number',
    );
  }

  Widget _buildAddressField() {
    return _buildTextField(
      controller: _addressController,
      labelText: 'Address',
    );
  }

  Widget _buildPanNumberField() {
    return _buildTextField(
      controller: _panNumberController,
      labelText: 'PAN number',
    );
  }

  Future<void> submitForm() async {
    if (!_validateForm()) {
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      return;
    }

    final Map<String, dynamic> req = {};

    _firstNameController.text.isNotEmpty
        ? req['firstName'] = _firstNameController.text.trim()
        : null;
    _lastNameController.text.isNotEmpty
        ? req['lastName'] = _lastNameController.text.trim()
        : null;
    _emailController.text.isNotEmpty
        ? req['email'] = _emailController.text.trim()
        : null;
    _whatsappController.text.isNotEmpty
        ? req['whatsappNumber'] = _whatsappController.text.trim()
        : null;
    _secondaryController.text.isNotEmpty
        ? req['secondaryNumber'] = _secondaryController.text.trim()
        : null;
    _addressController.text.isNotEmpty
        ? req['address'] = _addressController.text.trim()
        : null;
    _panNumberController.text.isNotEmpty
        ? req['panNumber'] = _panNumberController.text.trim()
        : null;
    _ageController.text.isNotEmpty
        ? req['age'] = int.tryParse(_ageController.text.trim())
        : null;
    req['gender'] = _gender;

    try {
      final response = await http.patch(
        Uri.parse('http://43.205.12.154:8080/v2/users/update'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": token,
        },
        body: jsonEncode(req), // Encode req to JSON
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
      } else {
        // Handle error response
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to update profile')),
        );
      }
    } catch (e) {
      // Handle network or server errors
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Network or server error')),
      );
    }
  }

  bool _validateForm() {
    if (_firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _whatsappController.text.isEmpty ||
        _ageController.text.isEmpty ||
        _gender == null) {
      if (_firstNameController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('First name is required.'),
            backgroundColor: Colors.red,
          ),
        );
      }
      if (_lastNameController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Last name is required.'),
            backgroundColor: Colors.red,
          ),
        );
      }
      if (_whatsappController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('WhatsApp number is required.'),
            backgroundColor: Colors.red,
          ),
        );
      }
      if (_ageController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Age is required.'),
            backgroundColor: Colors.red,
          ),
        );
      }
      if (_gender.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select gender.'),
            backgroundColor: Colors.red,
          ),
        );
      }
      return false;
    }
    return true;
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
