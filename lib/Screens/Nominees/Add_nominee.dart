import 'dart:convert';
import 'package:Bsure_devapp/Screens/Utils/DisplayUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_picker/file_picker.dart';

import '../LoginScreen.dart';
import 'Get_all_nominees.dart';

enum Relation {
  Spouse,
  Daughter,
  Father,
  Mother,
  Son,
  Brother,
  Sister,
  Grandchild,
  Other,
}

class AddNominee extends StatefulWidget {
  const AddNominee({Key? key}) : super(key: key);

  @override
  _AddNomineeState createState() => _AddNomineeState();
}

class _AddNomineeState extends State<AddNominee> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController guardianNameController = TextEditingController();
  TextEditingController guardianMobileNumberController =
      TextEditingController();
  TextEditingController attachmentController = TextEditingController();
  TextEditingController photoController = TextEditingController();

  late int age;
  bool isGuardianVisible = false;
  var proof;
  var photo;
  var name;

  List<Contact> _contacts = [];
  bool _isLoading = false;
  final List<Contact> _selectedContacts = [];

  Relation? _selectedRelation;

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title:
            const Text('Create nominee', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildTextField(firstNameController, 'First name',
                    mandatory: true, isNumeric: false
                    //textCapitalization: TextCapitalization.characters,
                    ),
                const SizedBox(height: 10),
                _buildTextField(lastNameController, 'Last name',
                    mandatory: true, isNumeric: false),
                const SizedBox(height: 10),
                _buildTextField(
                  emailController,
                  'Email id',
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          _buildTextField(
                            mobileNumberController,
                            'Mobile number',
                            isNumeric: true,
                            onTap: () {
                              if (_selectedContacts.isNotEmpty) {
                                _showSelectedContactsDialog();
                              }
                            },
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.contacts),
                              onPressed: () {
                                _getContacts();
                              },
                            ),
                          ),
                          Container(
                            height: 2,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                _isLoading
                    ? const CircularProgressIndicator()
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _contacts.length,
                        itemBuilder: (context, index) {
                          final contact = _contacts[index];
                          return ListTile(
                            title: Text(contact.displayName ?? ''),
                            onTap: () => _selectContact(contact),
                            trailing: Checkbox(
                              value: _selectedContacts.contains(contact),
                              onChanged: (bool? value) {
                                _selectContact(contact);
                              },
                            ),
                          );
                        },
                      ),
                const SizedBox(height: 10),
                _buildTextField(addressController, 'Address', mandatory: false),
                const SizedBox(height: 10),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Row(
                    children: [
                      Text(
                        'Account type',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' *',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField<Relation>(
                    value: _selectedRelation,
                    onChanged: (value) {
                      setState(() {
                        _selectedRelation = value;
                      });
                    },
                    items: _relationDropdownItems,
                    decoration: InputDecoration(
                      labelText: 'Relation',
                      // Updated to indicate mandatory field
                      labelStyle: const TextStyle(
                        color: Colors.black, // Set label text color to black
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a relation'; // Validation message if no relation is selected
                      }
                      return null;
                    },
                  ),
                ]),
                const SizedBox(height: 10),
                _buildTextField(
                  ageController,
                  'Age',
                  mandatory: true,
                  isNumeric: true,
                  maxLength: 3,
                  // Restrict the input to a maximum of 3 characters
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      age = int.parse(value);
                      isGuardianVisible = age < 18;
                    });
                  },
                ),
                const SizedBox(height: 10),
                Visibility(
                  visible: isGuardianVisible,
                  child: Column(
                    children: [
                      _buildTextField(
                        guardianNameController,
                        'Guardian Name',
                        mandatory: isGuardianVisible,
                      ),
                      const SizedBox(height: 10),
                      _buildTextField(
                        guardianMobileNumberController,
                        'Guardian Mobile No',
                        mandatory: isGuardianVisible,
                        isNumeric: true,
                        maxLength: 10, // Ensure maximum length is 10 digits
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff429bb8)),
                          ),
                          hintText: "Attachemnt you want to upload(optional)",
                          hintStyle: TextStyle(fontSize: 16),
                        ),
                        readOnly: true,
                        onTap: uploadFile,
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: uploadFile,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff429bb8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.01,
                          horizontal: MediaQuery.of(context).size.width * 0.03,
                        ),
                      ),
                      child: const Text(
                        'Choose file',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: photoController,
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff429bb8)),
                          ),
                          hintText: "Attachemnt you want to upload(optional)",
                          hintStyle: TextStyle(fontSize: 16),
                        ),
                        readOnly: true,
                        onTap: uploadphoto,
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: uploadphoto,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff429bb8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.01,
                          horizontal: MediaQuery.of(context).size.width * 0.03,
                        ),
                      ),
                      child: const Text(
                        'Choose photo',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _submitForm();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff429bb8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * 0.04,
                      horizontal: MediaQuery.of(context).size.width * 0.07,
                    ),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String labelText, {
    bool mandatory = false,
    bool isNumeric = false,
    TextInputType keyboardType = TextInputType.text,
    Function()? onTap,
    Widget? suffixIcon,
    int? maxLength,
    void Function(String)? onChanged,
    bool capitalizeFirstLetter = false,
    TextCapitalization textCapitalization =
        TextCapitalization.none, // New parameter
  }) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                fontSize: 16, // Adjust size for better visibility
              ),
            ),
        ],
      ),
      const SizedBox(height: 8),
      TextFormField(
        controller: controller,
        keyboardType: isNumeric ? TextInputType.number : keyboardType,
        textCapitalization: textCapitalization,
        // Apply text capitalization
        onTap: onTap,
        onChanged: onChanged,
        maxLength: maxLength,
        inputFormatters: isNumeric
            ? <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                NoLeadingSpaceFormatter(),
              ]
            : <TextInputFormatter>[
                NoLeadingSpaceFormatter(),
              ],
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.black, // Set label text color to black
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      )
    ]);
  }

  Future<void> _submitForm() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

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
      return; // Exit the function if the token is invalid
    }

    // Prepare the request
    final uri = Uri.parse('https://dev.bsure.live/v2/nominee/add');
    final request = http.MultipartRequest('POST', uri)
      ..headers['Authorization'] = token.toString();

    // Add form fields
    request.fields['firstName'] = firstNameController.text;
    request.fields['lastName'] = lastNameController.text;
    //request.fields['address'] = addressController.text;
    request.fields['relation'] = _selectedRelation?.name.toLowerCase() ?? '';
    request.fields['age'] = age.toString();

    if (addressController.text.isNotEmpty) {
      request.fields['address'] = addressController.text;
    }
    if (emailController.text.isNotEmpty) {
      request.fields['email'] = emailController.text;
    }
    if (mobileNumberController.text.isNotEmpty) {
      request.fields['mobileNumber'] = mobileNumberController.text;
    }

    if (isGuardianVisible) {
      if (guardianNameController.text.isNotEmpty) {
        request.fields['guardianName'] = guardianNameController.text;
      }
      if (guardianMobileNumberController.text.isNotEmpty) {
        request.fields['guardianMobileNumber'] =
            guardianMobileNumberController.text;
      }
    }

    // Add files
    if (proof != null) {
      request.files.add(http.MultipartFile.fromBytes(
        'proof',
        proof.bytes!,
        filename: proof.name,
      ));
      request.files.add(http.MultipartFile.fromBytes(
        'photo',
        proof.bytes!,
        filename: proof.name,
      ));
    }

    try {
      final response = await request.send();

      // Read the response
      final responseData = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        // Handle success case
        DisplayUtils.showToast("Nominee added successfully");
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const GetNomineeScreen(),
          ),
        );
      } else {
        // Handle error case
        final responseJson = json.decode(responseData);
        final errorMessage = responseJson['message'] ?? 'An error occurred';
        print('Error: $errorMessage'); // Print the error message for debugging
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text('Error'),
                  content: Text(errorMessage),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ));
      }
    } catch (e) {
      // Handle exception case
      print('Exception: $e'); // Print the exception for debugging
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Failed to add nominee. Please try again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void _selectContact(Contact contact) {
    setState(() {
      if (_selectedContacts.contains(contact)) {
        _selectedContacts.remove(contact);
      } else {
        _selectedContacts.add(contact);
      }
    });

    if (_selectedContacts.isNotEmpty) {
      final selectedContact = _selectedContacts.first;
      mobileNumberController.text = selectedContact.phones?.first.value ?? '';
    }
  }

  Future<void> _getContacts() async {
    if (await Permission.contacts.request().isGranted) {
      final contacts = await ContactsService.getContacts();
      setState(() {
        _contacts = contacts.toList();
      });
    } else {
      // Handle permission denial
    }
  }

  void _showSelectedContactsDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Selected contacts'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: _selectedContacts
                .map((contact) => ListTile(
                      title: Text(contact.displayName ?? ''),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            _selectedContacts.remove(contact);
                          });
                          Navigator.of(context).pop();
                        },
                      ),
                    ))
                .toList(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> uploadFile() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.any, allowMultiple: false);

    if (result != null) {
      setState(() {
        proof = result.files.single;
        attachmentController.text = proof.name;
      });
    } else {
      // Handle error when no file is selected.
    }
  }

  Future<void> uploadphoto() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: false);

    if (result != null) {
      setState(() {
        proof = result.files.single;
        photoController.text = proof.name;
      });
    } else {
      // Handle error when no file is selected.
    }
  }
}

class CapitalizeFirstLetterTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      String capitalized =
          newValue.text[0].toUpperCase() + newValue.text.substring(1);
      return newValue.copyWith(
        text: capitalized,
        selection: TextSelection.collapsed(offset: capitalized.length),
      );
    }
    return newValue;
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
