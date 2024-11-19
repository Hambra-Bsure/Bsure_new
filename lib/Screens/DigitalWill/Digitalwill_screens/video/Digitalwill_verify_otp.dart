import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../LoginScreen.dart';
import '../../../Repositary/Models/Digital_will/Digitalwill_verifyotp_req.dart';
import '../../../Repositary/Retrofit/node_api_client.dart';
import '../../../Utils/DisplayUtils.dart';
import '../Digitalwill_success_message.dart';
import '../witness_screens/Executor/Witness_verifyscreen.dart';
import '../witness_screens/get_witness_list.dart';

class NomineeForAllAssets extends StatefulWidget {
  const NomineeForAllAssets({super.key});

  @override
  State<NomineeForAllAssets> createState() => _NomineeForAllAssetsState();
}

class _NomineeForAllAssetsState extends State<NomineeForAllAssets> {
  String otpText = "";
  bool showAcceptIcon = false;
  String errorMessage = "";

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
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
      final client = NodeClient(dio);

      final response = await client.confirmOtp(token!);
    } catch (e) {
      // Handle exceptions
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = EdgeInsets.symmetric(horizontal: screenWidth * 0.05);
    final textSize = screenWidth > 600 ? 24.0 : 20.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title:
            const Text('Digital Will', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: padding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50.0),
                  _buildText(
                    "Nominee for all your assets",
                    FontWeight.bold,
                    Colors.black,
                    fontSize: textSize,
                  ),
                  const SizedBox(height: 20.0),
                  _buildOtpContainer(),
                  const SizedBox(height: 20.0),
                  _buildPinCodeTextField(),
                  const SizedBox(height: 20.0),
                  _buildTermsAndConditionsText(),
                  if (errorMessage.isNotEmpty) ...[
                    const SizedBox(height: 20.0),
                    Text(
                      errorMessage,
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ],
                ],
              ),
            ),
          ),
          _buildSubmitButton(),
        ],
      ),
    );
  }

  Widget _buildText(String text, FontWeight fontWeight, Color color,
      {double fontSize = 16.0}) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }

  Widget _buildOtpContainer() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xff429bb8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: _buildText(
          "Enter the OTP received on your mobile",
          FontWeight.normal,
          Colors.white,
          fontSize: 16.0,
        ),
      ),
    );
  }

  Widget _buildPinCodeTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: PinCodeTextField(
        appContext: context,
        length: 5,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(8),
          fieldHeight: 50,
          fieldWidth: 40,
          inactiveColor: Colors.black12,
          selectedColor: const Color(0xff429bb8),
          activeColor: const Color(0xff429bb8),
        ),
        keyboardType: TextInputType.number,
        onCompleted: (v) {
          setState(() {
            otpText = v;
          });
        },
        textStyle: const TextStyle(color: Colors.black, fontSize: 20),
        onChanged: (value) {
          setState(() {
            otpText = value;
            if (value.trim().length == 5) {
              showAcceptIcon = true;
              if (int.tryParse(value) == null) {
                errorMessage = 'Please enter a valid 5-digit number';
              } else {
                errorMessage = '';
              }
            } else {
              showAcceptIcon = false;
              errorMessage = '';
            }
          });
        },
      ),
    );
  }

  Widget _buildTermsAndConditionsText() {
    return _buildText(
      "By entering the OTP you agree to the terms and conditions of the Bsure App",
      FontWeight.normal,
      Colors.black,
      fontSize: 14.0,
    );
  }

  Widget _buildSubmitButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          digitalWillVerifyOtp();
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: const Color(0xff429bb8),
          minimumSize: Size(MediaQuery.of(context).size.width * 0.6, 50),
        ),
        child: const Text(
          'Submit',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Future<void> digitalWillVerifyOtp() async {
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
      final client = NodeClient(dio);

      final otpRequest = digitalverifyotprequest(otp: int.parse(otpText));
      final response = await client.digitalwillVerifyOtp(token!, otpRequest);

      if (response.isValid == true) {
        // Show OTP success message
        DisplayUtils.showToast('OTP Verified Successfully');

        // Navigate to success message or additional confirmation screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Witnessverifyscreen(),
          ),
        );
      } else {
        // Handle case where OTP verification fails
        setState(() {
          errorMessage = 'Incorrect OTP. Please try again.';
        });
      }
    } catch (e) {
      // Handle exceptions
      setState(() {
        errorMessage = 'An error occurred. Please try again later.';
      });
    }
  }
}
