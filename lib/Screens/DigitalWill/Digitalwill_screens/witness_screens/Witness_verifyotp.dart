import 'package:Bsure_devapp/Screens/Utils/DisplayUtils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../LoginScreen.dart';
import 'get_witness_list.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String witnessId;

  const VerifyOtpScreen({Key? key, required this.witnessId}) : super(key: key);

  @override
  _VerifyOtpScreenState createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
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

        final int? witnessId = int.tryParse(widget.witnessId!);
        final int? otpValue = int.tryParse(otp);

        if (witnessId == null || otpValue == null) {
          throw Exception("Invalid witnessId or OTP");
        }

        final response = await dio.post(
          "https://dev.bsure.live/v2/will/witness/verify",
          data: {"witnessId": witnessId, "otp": otpValue},
        );

        if (response.statusCode == 200) {
          DisplayUtils.showToast("OTP verified successfully");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DigitalWillGetWitness(),
            ),
          );
        } else {
          //_showSnackbar("Failed to verify OTP: ${response.data}");
        }
      } catch (e) {
       // _showSnackbar("Exception occurred: $e");
      }
    } else {
      //_showSnackbar('Please enter a valid OTP.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text("Verify OTP", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _otpController,
              decoration: const InputDecoration(
                labelText: 'Enter OTP',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
              child: const Text("Verify OTP",style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
