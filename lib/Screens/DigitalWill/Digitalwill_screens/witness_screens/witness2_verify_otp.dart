import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTPVerificationwitness2 extends StatefulWidget {
  final String? witnessId;

  const OTPVerificationwitness2({Key? key, this.witnessId}) : super(key: key);

  @override
  _OTPVerificationwitness2State createState() => _OTPVerificationwitness2State();
}

class _OTPVerificationwitness2State extends State<OTPVerificationwitness2> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Print the witnessId
    print('Received witnessId: ${widget.witnessId}');
    getData();
  }

  Future<void> getData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      // final token = prefs.getString("token");
      const token =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsInVzZXJNb2JpbGUiOiI4MzI4NTY0Njgz"
          "IiwiaWF0IjoxNzE1OTU1MzE1LCJleHAiOjE3MTY1NjAxMTV9.zExYXFhKZ3b5ZJWdvgM_zqLCpdjUMZQ4IK2QzJZiEy0";

      final dio = Dio();
      dio.options.headers["Authorization"] = token;

      final witnessId = int.tryParse(widget.witnessId!);

      if (witnessId == null) {
        throw Exception("Invalid witnessId format");
      }

      final response = await dio.post(
        "http://43.205.12.154:8080/v2/will/witness/otp",
        data: {"witnessId": witnessId},
      );

      if (response.statusCode == 200) {
        // OTP confirmation successful
        print("OTP sent successfully");
      } else {
        // OTP confirmation failed
        print("Failed to confirm OTP: ${response.data}");
      }
    } catch (e) {
      // Handle exceptions
      print("Exception occurred: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('OTP Verify Witness2', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter OTP',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String? otp = _otpController.text.trim();
                if (validateOTP(otp)) {
                  _submit();
                } else {
                  // Show error message using a SnackBar or any other preferred method
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a valid OTP.')),
                  );
                }
              },
              child: Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }

  void _submit() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      // final token = prefs.getString("token");
      const token =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsInVzZXJNb2JpbGUiOiI4MzI4NTY0Njgz"
          "IiwiaWF0IjoxNzE1OTU1MzE1LCJleHAiOjE3MTY1NjAxMTV9.zExYXFhKZ3b5ZJWdvgM_zqLCpdjUMZQ4IK2QzJZiEy0";

      final dio = Dio();
      dio.options.headers["Authorization"] = token;

      final int? witnessId = int.tryParse(widget.witnessId!);
      final String otp = _otpController.text.trim();

      if (witnessId == null || otp.isEmpty) {
        throw Exception("Invalid witnessId or OTP");
      }

      final response = await dio.post(
        "http://43.205.12.154:8080/v2/will/witness/verify",
        data: {"witnessId": witnessId, "otp": otp},
      );

      if (response.statusCode == 200) {
        // OTP verification successful
        print("OTP verified successfully");
        // Navigate to next screen or perform actions accordingly
      } else {
        // OTP verification failed
        print("Failed to verify OTP: ${response.data}");
        // Show error message to the user or handle it accordingly
      }
    } catch (e) {
      // Handle exceptions
      print("Exception occurred: $e");
      // Show error message to the user or handle it accordingly
    }
  }

  bool validateOTP(String? otp) {
    return otp != null && otp.length == 6;
  }
}
