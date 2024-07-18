import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Repositary/Models/User_models/Get_user_res.dart';
import '../Repositary/Models/User_models/User_request.dart';
import '../Utils/DisplayUtils.dart';
import 'Get_profile.dart';

class EditProfile extends StatefulWidget {
  final GetUserResponse? userProfile;

  const EditProfile({Key? key, this.userProfile}) : super(key: key);

  @override
  State<EditProfile> createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  late double height;
  late double width;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();
  final TextEditingController secondaryController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController panNumberController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController photoController = TextEditingController();

  String? gender;

  @override
  void initState() {
    super.initState();
    if (widget.userProfile?.user != null) {
      final user = widget.userProfile!.user!;
      firstNameController.text = user.firstName ?? '';
      lastNameController.text = user.lastName ?? '';
      emailController.text = user.email ?? '';
      whatsappController.text = user.whatsappNumber ?? '';
      secondaryController.text = user.secondaryNumber ?? '';
      addressController.text = user.address ?? '';
      panNumberController.text = user.panNumber ?? '';
      ageController.text = user.age?.toString() ?? '';
      gender = user.gender;
    }
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final userId = sharedPreferences.getString('USER_ID');
    // Handle userId as needed
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    whatsappController.dispose();
    secondaryController.dispose();
    addressController.dispose();
    panNumberController.dispose();
    ageController.dispose();
    photoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: const Color(0xff429bb8),
        title: const Text(
          'Create profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Card(
        child: Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
          child: ListView(
            children: [
              const Center(
                child: Stack(
                  children: [
                    Icon(
                      Icons.account_circle,
                      color: Color(0xff429bb8),
                      size: 150,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
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
              const SizedBox(height: 50),
              _buildUpdateButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return _buildTextField(
      controller: emailController,
      labelText: 'Email id',
    );
  }

  Widget _buildSecondaryNoField() {
    return _buildTextField(
      controller: secondaryController,
      labelText: 'Secondary number',
    );
  }

  Widget _buildAddressField() {
    return _buildTextField(
      controller: addressController,
      labelText: 'Address',
    );
  }

  Widget _buildPanNumberField() {
    return _buildTextField(
      controller: panNumberController,
      labelText: 'PAN number',
    );
  }

  Widget _buildFirstNameField() {
    return _buildTextField(
      controller: firstNameController,
      labelText: 'First name',
      isMandatory: true,
    );
  }

  Widget _buildLastNameField() {
    return _buildTextField(
      controller: lastNameController,
      labelText: 'Last name',
      isMandatory: true,
    );
  }

  Widget _buildWhatsAppField() {
    return _buildTextField(
      controller: whatsappController,
      labelText: 'WhatsApp no',
      isMandatory: true,
    );
  }

  Widget _buildAgeField() {
    return _buildTextField(
      controller: ageController,
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
          value: gender,
          items: [
            const DropdownMenuItem<String>(
              value: null,
              child: Text(
                'Select gender',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ...['Male', 'Female', 'Other'].map<DropdownMenuItem<String>>(
              (String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ),
            ),
          ],
          onChanged: (String? newValue) {
            setState(() {
              gender = newValue;
            });
          },
        ),
      ],
    );
  }

  Widget _buildUpdateButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        onPressed: submitForm,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: const Color(0xff429bb8),
          minimumSize: const Size(500, 50),
          elevation: 20,
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: const Text(
          'UPDATE',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }

  void submitForm() async {
    if (!validateForm()) {
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      return;
    }

    final req = UserRequest(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text.isEmpty ? null : emailController.text,
      whatsappNumber: whatsappController.text,
      secondaryNumber:
          secondaryController.text.isEmpty ? null : secondaryController.text,
      address: addressController.text.isEmpty ? null : addressController.text,
      panNumber:
          panNumberController.text.isEmpty ? null : panNumberController.text,
      age: int.tryParse(ageController.text) ?? 0,
      gender: gender!,
      photo: photoController.text.isEmpty ? null : photoController.text,
    );

    try {
      final response = await http.post(
        Uri.parse('https://dev.bsure.live/v2/users'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": token,
        },
        body: jsonEncode(req.toJson()),
      );

      if (response.statusCode == 200) {
        DisplayUtils.showToast("Profile create successfully");
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfileScreen(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to update profile.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  bool validateForm() {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        whatsappController.text.isEmpty ||
        ageController.text.isEmpty ||
        gender == null) {
      if (firstNameController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('First name is required.'),
            backgroundColor: Colors.red,
          ),
        );
      }
      if (lastNameController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Last name is required.'),
            backgroundColor: Colors.red,
          ),
        );
      }
      if (whatsappController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('WhatsApp number is required.'),
            backgroundColor: Colors.red,
          ),
        );
      }
      if (ageController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Age is required.'),
            backgroundColor: Colors.red,
          ),
        );
      }
      if (gender == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Gender is required.'),
            backgroundColor: Colors.red,
          ),
        );
      }
      return false;
    }
    return true;
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
