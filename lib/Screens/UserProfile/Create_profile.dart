import 'dart:convert';
import 'package:Bsure_devapp/Screens/UserProfile/Get_profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Repositary/Models/User_models/Get_user_res.dart';
import '../Repositary/Models/User_models/User_request.dart';

class EditProfile extends StatefulWidget {
  final GetUserResponse? userProfile;

  const EditProfile({super.key, this.userProfile});

  @override
  State<EditProfile> createState() => EditProfileState(GetUserResponse);
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

  final GetUserResponse;

  EditProfileState(this.GetUserResponse);

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
      gender = user.gender ?? '';
    }
    _loadUserId();
  }

  Future<String> _loadUserId() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String userId = sharedPreferences.getString('USER_ID') ?? '';
    return userId;
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
        automaticallyImplyLeading: false,
        title: const Text(
          'Edit profile',
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
          color: Colors.white,
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
              _buildWhatsupField(),
              const SizedBox(height: 10),
              _buildSecondaryNoField(),
              const SizedBox(height: 10),
              _buildAddressField(),
              const SizedBox(height: 10),
              _buildPanNumberField(),
              //const SizedBox(height: 10),
              //_buildPhotoField(),
              const SizedBox(height: 50),
              _buildUpdateButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFirstNameField() {
    return TextFormField(
      controller: firstNameController,
      decoration: const InputDecoration(
        labelText: 'First Name',
      ),
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'First name is required';
        }
        return null;
      },
    );
  }

  Widget _buildLastNameField() {
    return TextFormField(
      controller: lastNameController,
      decoration: const InputDecoration(
        labelText: 'Last Name',
      ),
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Last name is required';
        }
        return null;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: emailController,
      decoration: const InputDecoration(
        labelText: 'Email',
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildWhatsupField() {
    return TextFormField(
      controller: whatsappController,
      decoration: const InputDecoration(
        labelText: 'WhatsApp No',
      ),
      maxLength: 10,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'WhatsApp number is required';
        }
        if (value.length != 10) {
          return 'WhatsApp number must be 10 digits';
        }
        return null;
      },
    );
  }

  Widget _buildSecondaryNoField() {
    return TextFormField(
      controller: secondaryController,
      decoration: const InputDecoration(
        labelText: 'Secondary Number',
      ),
      maxLength: 10,
      keyboardType: TextInputType.number,
    );
  }

  Widget _buildAddressField() {
    return TextFormField(
      controller: addressController,
      decoration: const InputDecoration(
        labelText: 'Address',
      ),
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Address is required';
        }
        return null;
      },
    );
  }

  Widget _buildPanNumberField() {
    return TextFormField(
      controller: panNumberController,
      decoration: const InputDecoration(
        labelText: 'PAN Number',
      ),
      keyboardType: TextInputType.text,
    );
  }

  Widget _buildAgeField() {
    return TextFormField(
      controller: ageController,
      decoration: const InputDecoration(
        labelText: 'Age',
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Age is required';
        }
        int? age = int.tryParse(value);
        if (age == null || age <= 0) {
          return 'Please enter a valid age';
        }
        return null;
      },
    );
  }

  Widget _buildGenderDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            "Gender",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 60,
          width: double.infinity,
          child: DropdownButton<String>(
            isExpanded: true,
            value: gender,
            items: <DropdownMenuItem<String>>[
              const DropdownMenuItem<String>(
                value: null,
                child: Text(
                  'Select gender',
                  style: TextStyle(color: Colors.grey),
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
              if (newValue != gender) {
                setState(() {
                  gender = newValue;
                });
              }
            },
          ),
        ),
      ],
    );
  }

  // Widget _buildPhotoField() {
  //   return TextFormField(
  //     controller: photoController,
  //     decoration: const InputDecoration(
  //       labelText: 'Photo (Optional)',
  //     ),
  //     keyboardType: TextInputType.url,
  //   );
  // }

  Widget _buildUpdateButton() {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.only(left: 5, right: 5),
        padding: const EdgeInsets.only(left: 5, right: 5),
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
      ),
    );
  }

  void submitForm() async {
    if (!validateForm(context)) {
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
      final response = await http.patch(
        Uri.parse('http://43.205.12.154:8080/v2/users/update'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": token,
        },
        body: jsonEncode(req.toJson()),
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
      }
    } catch (e) {
      // Handle network or server errors
    }
  }

  bool validateForm(BuildContext context) {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        whatsappController.text.isEmpty ||
        ageController.text.isEmpty ||
        gender == null) {
      if (firstNameController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('First Name is required')),
        );
      } else if (lastNameController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Last Name is required')),
        );
      } else if (whatsappController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('WhatsApp number is required')),
        );
      } else if (ageController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Age is required')),
        );
      } else if (gender == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Gender is required')),
        );
      }
      return false;
    }
    return true;
  }
}
