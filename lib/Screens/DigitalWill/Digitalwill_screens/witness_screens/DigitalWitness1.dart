import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../LoginScreen.dart';
import '../../../Repositary/Models/Digital_will/Witness1Res.dart';
import '../../../Repositary/Models/Digital_will/witness1_req.dart';
import 'Witness_verifyotp.dart';

class DigitalWitnessScreen extends StatefulWidget {
  const DigitalWitnessScreen({Key? key}) : super(key: key);

  @override
  _DigitalWitnessScreenState createState() => _DigitalWitnessScreenState();
}

class _DigitalWitnessScreenState extends State<DigitalWitnessScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller1 = TextEditingController(); // First Name
  final TextEditingController _controller2 = TextEditingController(); // Last Name
  final TextEditingController _controller3 = TextEditingController(); // Age
  final TextEditingController _controller4 = TextEditingController(); // Mobile Number
  final TextEditingController _controller5 = TextEditingController(); // Email (optional)
  final TextEditingController _controller6 = TextEditingController(); // Address (optional)
  final TextEditingController _controller7 = TextEditingController(); // Father Name

  String? _witnessId;

  void _saveDataLocally() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('firstName', _controller1.text);
    await prefs.setString('lastName', _controller2.text);
    await prefs.setString('age', _controller3.text);
    await prefs.setString('mobile', _controller4.text);
    await prefs.setString('email', _controller5.text);
    await prefs.setString('address', _controller6.text);
    await prefs.setString('fatherName', _controller7.text);
  }

  Future<void> _submit() async {
    if (_controller1.text.isEmpty) {
      _showSnackbar('First name is required');
      return;
    } else if (_controller2.text.isEmpty) {
      _showSnackbar('Last name is required');
      return;
    } else if (_controller3.text.isEmpty) {
      _showSnackbar('age  is required');
      return;
    } else if (_controller4.text.isEmpty) {
      _showSnackbar('Mobile number is required');
      return;
    } else if (_controller7.text.isEmpty) {
      _showSnackbar('Father name is required');
      return;
    }

    _saveDataLocally();

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

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
      return;
    }

    Witness1Req witness1Req = Witness1Req(
      firstName: _controller1.text,
      lastName: _controller2.text,
      mobile: _controller4.text,
      age: int.tryParse(_controller3.text),
      emailId: _controller5.text.isNotEmpty ? _controller5.text : null, // Only set if not empty
      address: _controller6.text.isNotEmpty ? _controller6.text : null, // Only set if not empty
      fatherName: _controller7.text,
    );


    Map<String, dynamic> body = witness1Req.toJson();

    Uri apiUrl = Uri.parse('https://dev.bsure.live/v2/will/witness');

    try {
      final response = await http.post(
        apiUrl,
        body: jsonEncode(body),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token,
        },
      );

      if (response.statusCode == 201) {
        Witness1Res witness1Res =
        Witness1Res.fromJson(jsonDecode(response.body));
        if (witness1Res.witness != null && witness1Res.witness!.isNotEmpty) {
          setState(() {
            _witnessId = witness1Res.witness!.first.id.toString();
          });
          await _sendOtp(_witnessId!);
        } else {
          _showSnackbar('Witness data is empty or null');
        }
      } else {
        _showSnackbar('Failed to submit witness data');
      }
    } catch (e) {
      _showSnackbar('Error submitting witness data: $e');
    }
  }

  Future<void> _sendOtp(String witnessId) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (token == null || token.isEmpty) {
      print(token);
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
      return;
    }

    try {
      final response = await Dio().post(
        'https://dev.bsure.live/v2/will/witness/otp',
        data: {"witnessId": int.parse(witnessId)},
        options: Options(
          headers: {'Authorization': token},
        ),
      );

      if (response.statusCode == 200) {
        _showSnackbar('Successfully sent otp');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerifyOtpScreen(witnessId: witnessId),
          ),
        );
      } else {
        _showSnackbar('Failed to send OTP');
      }
    } catch (e) {
      _showSnackbar('Error sending OTP: $e');
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text("Witness", style: TextStyle(color: Colors.white)),
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
                  mandatory: true,
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _controller2,
                  labelText: 'Last Name',
                  mandatory: true,
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _controller3,
                  labelText: 'Age',
                  mandatory: true,
                  isNumeric: true,
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _controller4,
                  labelText: 'Mobile Number',
                  mandatory: true,
                  isNumeric: true,
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _controller7,
                  labelText: 'Father Name',
                  mandatory: true,
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _controller5,
                  labelText: 'Email Address',
                  mandatory: false,
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _controller6,
                  labelText: 'Address',
                  mandatory: false,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff429bb8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    elevation: 0,
                  ),
                  child: const Text("Submit",
                      style: TextStyle(color: Colors.white)),
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
    bool mandatory = false,
    bool isNumeric = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          inputFormatters:
          isNumeric ? [FilteringTextInputFormatter.digitsOnly] : [],
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding:
            EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
          keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
        ),
      ],
    );
  }
}
