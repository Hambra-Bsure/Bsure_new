import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Repositary/Models/Nominee_models/Add_Nominee_req.dart';
import '../Repositary/Models/Nominee_models/Add_Nominee_res.dart';
import 'Get_all_nominees.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

enum Relation {
  Spouse,
  Daughter,
  Father,
  Mother,
  Son,
  Brother,
  Sister,
  Grandchild,
  Other
}

class AddNominee extends StatefulWidget {
  const AddNominee({super.key});

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
  TextEditingController photoController = TextEditingController();
  TextEditingController attachmentController = TextEditingController();

  //bool isMinor = false;
  late int age;
  String result = '';
  bool isGuardianVisible = false;
  var name;
  var proof;

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
      child: Text('grandchild'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Add Nominee', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: firstNameController,
                    decoration: const InputDecoration(labelText: 'First Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter first name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: lastNameController,
                    decoration: const InputDecoration(labelText: 'Last Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter last name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Please enter email';
                    //   }
                    //   return null;
                    // },
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    // Align items to the bottom
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            TextFormField(
                              controller: mobileNumberController,
                              enabled: true,
                              onTap: () {
                                if (_selectedContacts.isNotEmpty) {
                                  _showSelectedContactsDialog();
                                }
                              },
                              decoration: const InputDecoration(
                                hintText: 'Mobile number',
                                // Remove border to prevent duplicate underline
                                border: InputBorder.none,
                                // Add padding to avoid overlapping with the icon
                                // contentPadding: EdgeInsets.only(bottom: 8.0),
                              ),
                            ),
                            Container(
                              height: 2,
                              // Adjust the height of the underline here
                              color: Colors
                                  .grey, // Adjust the color of the underline here
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.contacts),
                        onPressed: () {
                          _getContacts();
                        },
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
                  TextFormField(
                    controller: addressController,
                    decoration: const InputDecoration(labelText: 'Address'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter address';
                      }
                      return null;
                    },
                  ),
                  DropdownButtonFormField<Relation>(
                    value: _selectedRelation,
                    onChanged: (value) {
                      setState(() {
                        _selectedRelation = value;
                      });
                    },
                    items: _relationDropdownItems,
                    decoration: const InputDecoration(labelText: 'Relation'),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a relation';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: ageController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Nominee Age',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        age = int.parse(value);
                        isGuardianVisible = age < 18;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter age';
                      }
                      return null;
                    },
                  ),
                  Text(result),
                  Visibility(
                    visible: isGuardianVisible,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: guardianNameController,
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
                          controller: guardianMobileNumberController,
                          decoration: const InputDecoration(
                            labelText: 'Enter Guardian Mobile No',
                          ),
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (isGuardianVisible && value!.isEmpty) {
                              return 'Please enter the guardian Mobile number';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff429bb8)),
                            ),
                            hintText: "Attach an ID Proof",
                            hintStyle: TextStyle(fontSize: 16),
                          ),
                          readOnly: true,
                          controller: attachmentController,
                          onTap: uploadFile,
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Add some spacing between the text field and the button
                      ElevatedButton(
                        onPressed: uploadFile,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff429bb8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.01,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.03,
                          ),
                        ),
                        child: const Text(
                          'Pick File',
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
                          decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff429bb8)),
                            ),
                            hintText: "Upload Photo",
                            hintStyle: TextStyle(fontSize: 16),
                          ),
                          readOnly: true,
                          controller: photoController,
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
                            horizontal:
                                MediaQuery.of(context).size.width * 0.03,
                          ),
                        ),
                        child: const Text(
                          'Upload',
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
                        // Form is valid, submit data
                        submitNominee();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff429bb8), // Set background color here
                    ),
                    child: const Text('Submit',style: TextStyle(color: Colors.white)),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  Future<void> _getContacts() async {
    setState(() {
      _isLoading = true;
    });

    if (await Permission.contacts.request().isGranted) {
      List<Contact> contacts = (await ContactsService.getContacts()).toList();
      setState(() {
        _contacts = contacts;
        _isLoading = false;
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Permission Denied'),
          content: const Text('Please grant access to contacts to proceed.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showSelectedContactsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Selected Contacts'),
          content: SingleChildScrollView(
            child: Column(
              children: _selectedContacts.map((contact) {
                return ListTile(
                  title: Text(contact.displayName ?? ''),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      //_removeContact(contact); // Remove the contact
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  void _selectContact(Contact contact) {
    setState(() {
      // Check if the selected contact is already in _selectedContacts
      bool isSelected = _selectedContacts.contains(contact);

      // If the contact is already selected, remove it
      if (isSelected) {
        _selectedContacts.remove(contact);
      } else {
        // Check if the selected contact's phone number already exists in _selectedContacts
        bool hasDuplicatePhoneNumber = _selectedContacts.any((selectedContact) {
          return selectedContact.phones?.any((phone) =>
                  contact.phones?.any(
                      (contactPhone) => contactPhone.value == phone.value) ??
                  false) ??
              false;
        });

        // If the contact's phone number is not a duplicate, add it to _selectedContacts
        if (!hasDuplicatePhoneNumber) {
          _selectedContacts.add(contact);
        }
      }
    });
  }

  Future<void> uploadFile() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.any, allowMultiple: false);

    if (result != null) {
      setState(() {
        proof = result.files.single;
        attachmentController.text = proof.name;
      });
    } else {}
  }

  Future<void> uploadphoto() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: false);

    if (result != null) {
      setState(() {
        proof = result.files.single;
        photoController.text = proof.name;
      });
    } else {}
  }

  void submitNominee() async {
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String email = emailController.text;
    String mobileNumber = mobileNumberController.text;
    String address = addressController.text;

    // Verify that guardian fields are not null before accessing their text properties
    String guardianName = guardianNameController.text;
    String guardianMobileNumber = guardianMobileNumberController.text;

    Map<Relation, String> relationMapping = {
      Relation.Father: 'father',
      Relation.Mother: 'mother',
      Relation.Daughter: 'daughter',
      Relation.Son: 'son',
      Relation.Spouse: 'spouse',
      Relation.Grandchild: 'grandchild',
      Relation.Brother: 'brother',
      Relation.Sister: 'sister',
      Relation.Other: 'other',
    };

    // Check if selected relation is not null before using it
    String selectedRelationValue =
        relationMapping[_selectedRelation] ?? "other";

    final req = AddNomineeRequest(
      firstName: firstName,
      lastName: lastName,
      address: address,
      relation: selectedRelationValue,
      age: age,
      email: email,
      mobileNumber: mobileNumber,
      guardianName: guardianName,
      guardianMobileNumber: guardianMobileNumber,
    );

    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");

      if (token == null) {
        return;
      }

      final response =
          await http.post(Uri.parse('http://43.205.12.154:8080/v2/nominee'),
              headers: {
                "Content-Type": "application/json",
                "Authorization": token,
              },
              body: jsonEncode(req.toJson()));

      // Handle response
      if (response.statusCode == 200) {
        AddNomineeResponse nomineeResponse =
            AddNomineeResponse.fromJson(jsonDecode(response.body));
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const GetNomineeScreen(),
          ),
        );
      } else {}
    } catch (e) {}
  }
}
