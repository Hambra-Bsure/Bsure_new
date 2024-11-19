import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../LoginScreen.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String witnessId;

  const OtpVerificationScreen({required this.witnessId, Key? key}) : super(key: key);

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();

  void _verifyOtp() async {
    String otp = _otpController.text.trim();
    if (otp.length == 5) {
      try {
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

        final dio = Dio();
        dio.options.headers["Authorization"] = token;

        final int? witnessId = int.tryParse(widget.witnessId);
        final int? otpValue = int.tryParse(otp);

        if (witnessId == null || otpValue == null) {
          throw Exception("Invalid witnessId or OTP");
        }

        final response = await dio.post(
          "https://dev.bsure.live/v2/will/witness/verify",
          data: {"witnessId": witnessId, "otp": otpValue},
        );

        if (response.statusCode == 200) {
          Navigator.pop(context, true); // Success
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("OTP verified successfully")),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to verify OTP: ${response.data}")),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Exception occurred: $e")),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid OTP.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify OTP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _otpController,
              decoration: const InputDecoration(
                labelText: 'Enter OTP',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _verifyOtp,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff429bb8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                elevation: 0,
              ),
              child: const Text("Verify OTP", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
