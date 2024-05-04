import 'dart:convert';
import 'package:Bsure_devapp/Screens/Nominees/Get_all_nominees.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Repositary/Models/Nominee_models/Edit_nominee_res.dart';
import '../Utils/DisplayUtils.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/Nominee_models/Edit_nominee_req.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/Nominee_models/Get_Nominee_response.dart';

class NomineeEditScreen extends StatefulWidget {
  final Nominees nominee;

  const NomineeEditScreen({Key? key, required this.nominee}) : super(key: key);

  @override
  _NomineeEditScreenState createState() => _NomineeEditScreenState();
}

class _NomineeEditScreenState extends State<NomineeEditScreen> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _mobileNumberController;
  late TextEditingController _relationController;
  late TextEditingController _ageController;
  late TextEditingController _emailController;
  late TextEditingController _guardianNameController;
  late TextEditingController _guardianMobileNumberController;
  late TextEditingController _addressController;
  late TextEditingController _imageController;

  bool showGuardianFields = false;
  bool isGuardianVisible = false;
  late int age;
  String result = '';

  @override
  void initState() {
    super.initState();
    _firstNameController =
        TextEditingController(text: widget.nominee.firstName ?? '');
    _lastNameController =
        TextEditingController(text: widget.nominee.lastName ?? '');
    _mobileNumberController =
        TextEditingController(text: widget.nominee.mobileNumber ?? '');
    _relationController =
        TextEditingController(text: widget.nominee.relation ?? '');
    _emailController = TextEditingController(text: widget.nominee.email ?? '');
    _ageController =
        TextEditingController(text: widget.nominee.age?.toString() ?? '');
    _guardianNameController =
        TextEditingController(text: widget.nominee.guardianName ?? '');
    _guardianMobileNumberController =
        TextEditingController(text: widget.nominee.guardianMobileNumber ?? '');
    _addressController =
        TextEditingController(text: widget.nominee.address ?? '');
    _imageController = TextEditingController(text: widget.nominee.image ?? '');
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileNumberController.dispose();
    _relationController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _guardianNameController.dispose();
    _guardianMobileNumberController.dispose();
    _addressController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title:
            const Text('Edit Nominee', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(labelText: 'First Name'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(labelText: 'Last Name'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _mobileNumberController,
                decoration: const InputDecoration(labelText: 'Mobile Number'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _relationController,
                decoration: const InputDecoration(labelText: 'Relation'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(
                  labelText: 'Enter Nominee Age',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    age = int.tryParse(value) ?? 0; // Use 0 if parsing fails
                    updateGuardianVisibility(); // Call the function to update visibility
                  });
                },
              ),
              const SizedBox(height: 10),
              Text(result),
              Visibility(
                visible: isGuardianVisible,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _guardianNameController,
                      decoration: const InputDecoration(
                        labelText: 'Enter Guardian Name',
                      ),
                      validator: (value) {
                        if (isGuardianVisible && value!.isEmpty) {
                          return 'Please enter the guardian name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _guardianMobileNumberController,
                      decoration: const InputDecoration(
                        labelText: 'Enter Guardian Mobile No',
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        // Only allows numeric input
                        LengthLimitingTextInputFormatter(10),
                        // Limits the length to 10 characters
                      ],
                      validator: (value) {
                        if (isGuardianVisible &&
                            (value == null || value.length != 10)) {
                          return 'Please enter a valid 10-digit guardian mobile number';
                        }
                        return null;
                      },
                    )
                  ],
                ),
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Address'),
              ),
              const SizedBox(height: 16.0),
              // TextFormField(
              //   controller: _imageController,
              //   decoration: const InputDecoration(labelText: 'Image'),
              // ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    final updatedNomineeReq = EditNomineeReq(
                      nomineeId: widget.nominee.id,
                      firstName: _firstNameController.text,
                      lastName: _lastNameController.text,
                      mobileNumber: _mobileNumberController.text,
                      relation: _relationController.text,
                      age: int.parse(_ageController.text),
                      email: _emailController.text,
                      //guardianName: _guardianNameController.text,
                      // guardianMobileNumber: _guardianMobileNumberController.text,
                      address: _addressController.text,
                      // image: _imageController.text,
                    );

                    final response = await updateNominee(updatedNomineeReq);
                    print(response);
                    DisplayUtils.showToast('Nominee Updated Successfully');

                    // Navigator.pop(context, response); // Pass updated response back
                    Navigator.pop(context);
                    Navigator.pushReplacement<void, void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => GetNomineeScreen(),
                      ),
                    );
                  },
                  child: const Text('Update'),
                ),
              ),
          ]),
        ),
      ),
    );
  }

  void updateGuardianVisibility() {
    setState(() {
      isGuardianVisible = age < 18;
    });
  }

  Future<EditNomineeRes?> updateNominee(EditNomineeReq nominee) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    final dio = Dio();
    dio.options.headers["Authorization"] = token; // Add token to headers

    try {
      final response = await dio.put(
        'http://43.205.12.154:8080/v2/nominee',
        data: nominee.toJson(),
      );

      if (response.statusCode == 200) {
        // Parse and return updated nominee details
        return EditNomineeRes.fromJson(response.data);
      } else {
        return null; // Return null if update fails
      }
    } catch (e) {
      print(e);
      return null; // Return null if an error occurs
    }
  }
}
