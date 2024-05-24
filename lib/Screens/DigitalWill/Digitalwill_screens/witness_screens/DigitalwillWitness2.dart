import 'dart:convert';
import 'package:Bsure_devapp/Screens/Homepage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Repositary/Models/Digital_will/Witness1Res.dart';
import '../../../Repositary/Models/Digital_will/witness1_req.dart';

class DigitalWitness2 extends StatefulWidget {
  const DigitalWitness2({Key? key}) : super(key: key);

  @override
  _DigitalWitness2State createState() => _DigitalWitness2State();
}

class _DigitalWitness2State extends State<DigitalWitness2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  bool _isOtpFieldVisible = false;
  String? _witnessId;

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  void _loadSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _controller1.text = prefs.getString('firstName') ?? '';
      _controller2.text = prefs.getString('lastName') ?? '';
      _controller3.text = prefs.getString('age') ?? '';
      _controller4.text = prefs.getString('mobile') ?? '';
      _controller5.text = prefs.getString('email') ?? '';
      _controller6.text = prefs.getString('address') ?? '';
    });
  }

  void _saveDataLocally() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('firstName', _controller1.text);
    await prefs.setString('lastName', _controller2.text);
    await prefs.setString('age', _controller3.text);
    await prefs.setString('mobile', _controller4.text);
    await prefs.setString('email', _controller5.text);
    await prefs.setString('address', _controller6.text);
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _saveDataLocally();

      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");

      String firstName = _controller1.text;
      String lastName = _controller2.text;
      String age = _controller3.text;
      String mobileNumber = _controller4.text;
      String email = _controller5.text;
      String address = _controller6.text;

      Witness1Req witness1Req = Witness1Req(
        firstName: firstName,
        lastName: lastName,
        mobile: mobileNumber,
        age: int.tryParse(age),
        emailId: email,
        address: address,
      );

      Map<String, dynamic> body = witness1Req.toJson();

      Uri apiUrl = Uri.parse('http://43.205.12.154:8080/v2/will/witness');

      final response = await http.post(
        apiUrl,
        body: jsonEncode(body),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token.toString(),
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        Witness1Res witness1Res = Witness1Res.fromJson(jsonDecode(response.body));
        if (witness1Res.witness != null && witness1Res.witness!.isNotEmpty) {
          setState(() {
            _isOtpFieldVisible = true;
            _witnessId = witness1Res.witness!.first.id.toString();
          });
          print('OTP sent successfully');
        } else {
          print('Witness data is empty or null');
        }
      }
    }
  }

  void _verifyOtp() async {
    String otp = _otpController.text.trim();
    if (otp.length == 5) {
      try {
        final prefs = await SharedPreferences.getInstance();
        final token = prefs.getString("token");

        final dio = Dio();
        dio.options.headers["Authorization"] = token;

        final int? witnessId = int.tryParse(_witnessId!);
        final int? otpValue = int.tryParse(otp);

        if (witnessId == null || otpValue == null) {
          throw Exception("Invalid witnessId or OTP");
        }

        final response = await dio.post(
          "http://43.205.12.154:8080/v2/will/witness/verify",
          data: {"witnessId": witnessId, "otp": otpValue},
        );

        if (response.statusCode == 200) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Homepage(),
            ),
          );
          print("OTP verified successfully");
        } else {
          print("Failed to verify OTP: ${response.data}");
        }
      } catch (e) {
        print("Exception occurred: $e");
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid OTP.')),
      );
    }
  }

  String? _validateFirstName(String? value) {
    if (value!.isEmpty) {
      return 'Please enter first name';
    }
    return null;
  }

  String? _validateLastName(String? value) {
    if (value!.isEmpty) {
      return 'Please enter last name';
    }
    return null;
  }

  String? _validateAge(String? value) {
    if (value!.isEmpty) {
      return 'Age cannot be empty';
    }
    int age = int.tryParse(value) ?? 0;
    if (age < 21) {
      return 'Age should be at least 21 years';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Email cannot be empty';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validateMobileNumber(String? value) {
    if (value!.isEmpty) {
      return 'Please enter mobile number';
    }
    if (value.length != 10) {
      return 'Mobile number should be 10 digits';
    }
    return null;
  }

  String? _validateAddress(String? value) {
    if (value!.isEmpty) {
      return 'Please enter address';
    }
    return null;
  }

  InputDecoration _buildInputDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.black87),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blue,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text("Witness2", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                _buildTextField(
                  controller: _controller1,
                  labelText: 'First Name',
                  validator: _validateFirstName,
                ),
                const SizedBox(height: 15),
                _buildTextField(
                  controller: _controller2,
                  labelText: 'Last Name',
                  validator: _validateLastName,
                ),
                const SizedBox(height: 15),
                _buildTextField(
                  controller: _controller3,
                  labelText: 'Age',
                  //validator: _validateAge,
                ),
                const SizedBox(height: 15),
                _buildTextField(
                  controller: _controller4,
                  labelText: 'Mobile No',
                  validator: _validateMobileNumber,
                ),
                const SizedBox(height: 15),
                _buildTextField(
                  controller: _controller5,
                  labelText: 'Email id',
                  // validator: _validateEmail,
                ),
                const SizedBox(height: 15),
                _buildTextField(
                  controller: _controller6,
                  labelText: 'Address',
                  validator: _validateAddress,
                ),
                const SizedBox(height: 30),
                if (_isOtpFieldVisible)
                  Column(
                    children: [
                      _buildTextField(
                        controller: _otpController,
                        labelText: 'Enter OTP',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter OTP';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: _verifyOtp,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff429bb8),
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                          textStyle: const TextStyle(fontSize: 18),
                        ),
                        child: const Text('Verify OTP', style: TextStyle(color: Colors.white)),
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff429bb8),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text('Submit', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.black87),
      decoration: _buildInputDecoration(labelText),
      validator: validator,
    );
  }
}
