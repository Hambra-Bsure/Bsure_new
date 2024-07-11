import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Repositary/Models/Nominee_models/Edit_nominee_res.dart';
import '../Repositary/Models/Nominee_models/Get_Nominee_response.dart';
import '../Utils/DisplayUtils.dart';
import '../Repositary/Models/Nominee_models/Edit_nominee_req.dart';
import 'Get_all_nominees.dart';

// Define the Relation enum
enum Relation {
  Father,
  Mother,
  Son,
  Spouse,
  Brother,
  Sister,
  Daughter,
  Other,
  Grandchild,
}

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

  bool isGuardianVisible = false;
  late int age;
  Relation? _selectedRelation;

  final _formKey = GlobalKey<FormState>();

  final List<DropdownMenuItem<Relation>> _relationDropdownItems = [
    const DropdownMenuItem(
      value: Relation.Father,
      child: Text('Father'),
    ),
    const DropdownMenuItem(
      value: Relation.Mother,
      child: Text('Mother'),
    ),
    const DropdownMenuItem(
      value: Relation.Son,
      child: Text('Son'),
    ),
    const DropdownMenuItem(
      value: Relation.Spouse,
      child: Text('Spouse'),
    ),
    const DropdownMenuItem(
      value: Relation.Brother,
      child: Text('Brother'),
    ),
    const DropdownMenuItem(
      value: Relation.Sister,
      child: Text('Sister'),
    ),
    const DropdownMenuItem(
      value: Relation.Daughter,
      child: Text('Daughter'),
    ),
    const DropdownMenuItem(
      value: Relation.Other,
      child: Text('Other'),
    ),
    const DropdownMenuItem(
      value: Relation.Grandchild,
      child: Text('Grandchild'),
    ),
  ];

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

    age = int.tryParse(widget.nominee.age?.toString() ?? '0') ?? 0;
    updateGuardianVisibility();

    _selectedRelation = _getRelationFromString(widget.nominee.relation);
  }

  Relation? _getRelationFromString(String? relation) {
    switch (relation?.toLowerCase()) {
      case 'father':
        return Relation.Father;
      case 'mother':
        return Relation.Mother;
      case 'son':
        return Relation.Son;
      case 'spouse':
        return Relation.Spouse;
      case 'brother':
        return Relation.Brother;
      case 'sister':
        return Relation.Sister;
      case 'daughter':
        return Relation.Daughter;
      case 'other':
        return Relation.Other;
      case 'grandchild':
        return Relation.Grandchild;
      default:
        return null;
    }
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Edit nominee', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTextFormField(_firstNameController, 'First name', false, true),
                const SizedBox(height: 16.0),
                buildTextFormField(_lastNameController, 'Last name', false, true),
                const SizedBox(height: 16.0),
                buildTextFormField(_mobileNumberController, 'Mobile number', true, true, keyboardType: TextInputType.phone),
                const SizedBox(height: 16.0),
                DropdownButtonFormField<Relation>(
                  value: _selectedRelation,
                  onChanged: (value) {
                    setState(() {
                      _selectedRelation = value;
                    });
                  },
                  items: _relationDropdownItems,
                  decoration: InputDecoration(
                    label: RichText(
                      text: const TextSpan(
                        text: 'Relation',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        children: [
                          TextSpan(
                            text: ' *',
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a relation';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                buildTextFormField(_emailController, 'Email id', false, false, keyboardType: TextInputType.emailAddress),
                const SizedBox(height: 16.0),
                buildTextFormField(
                  _ageController,
                  'Enter Nominee Age',
                  true,
                  true,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      age = int.tryParse(value) ?? 0;
                      updateGuardianVisibility();
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                if (isGuardianVisible)
                  Column(
                    children: [
                      buildTextFormField(_guardianNameController, 'Enter Guardian Name', false, true),
                      const SizedBox(height: 10),
                      buildTextFormField(
                        _guardianMobileNumberController,
                        'Enter Guardian Mobile No',
                        true,
                        true,
                        keyboardType: TextInputType.phone,
                      ),
                    ],
                  ),
                const SizedBox(height: 16.0),
                buildTextFormField(_addressController, 'Address', false, true),
                const SizedBox(height: 16.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final updatedNomineeReq = EditNomineeReq(
                          nomineeId: widget.nominee.id,
                          firstName: _firstNameController.text,
                          lastName: _lastNameController.text,
                          mobileNumber: _mobileNumberController.text,
                          relation: _selectedRelation?.name.toLowerCase(),
                          age: int.parse(_ageController.text),
                          email: _emailController.text,
                          guardianName: isGuardianVisible
                              ? _guardianNameController.text
                              : null,
                          guardianMobileNumber: isGuardianVisible
                              ? _guardianMobileNumberController.text
                              : null,
                          address: _addressController.text,
                        );

                        final response = await updateNominee(updatedNomineeReq);
                        if (response != null) {
                          DisplayUtils.showToast('Nominee Updated Successfully');
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const GetNomineeScreen(),
                            ),
                          );
                        } else {
                          DisplayUtils.showToast("Failed to update nominee");
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff429bb8),
                    ),
                    child: const Text('Update', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField(
      TextEditingController controller,
      String label,
      bool isNumeric,
      bool isRequired, {
        TextInputType keyboardType = TextInputType.text,
        List<TextInputFormatter>? inputFormatters,
        ValueChanged<String>? onChanged,
      }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: RichText(
          text: TextSpan(
            text: label,
            style: const TextStyle(color: Colors.black, fontSize: 16),
            children: [
              if (isRequired)
                const TextSpan(
                  text: ' *',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
            ],
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Color(0xff429bb8)),
        ),
        contentPadding:
        const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      ),
      keyboardType: keyboardType,
      inputFormatters: isNumeric
          ? <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ]
          : <TextInputFormatter>[
        NoLeadingSpaceFormatter(),
      ],
      onChanged: onChanged,
      validator: (value) {
        if (isRequired && (value == null || value.isEmpty)) {
          return 'This field is required';
        }
        return null;
      },
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
    dio.options.headers["Authorization"] = token; // Add "Bearer" to the token

    try {
      final response = await dio.put(
        'http://43.205.12.154:8080/v2/nominee',
        data: nominee.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        DisplayUtils.showToast("Nominee updated successfully");
        return EditNomineeRes.fromJson(response.data);
      } else {
        print("Failed with status code: ${response.statusCode}");
        return null; // Return null if update fails
      }
    } catch (e) {
      print("Error: $e");
      return null; // Return null if an error occurs
    }
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
