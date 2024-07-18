import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Repositary/Models/Digital_will/Digitalwill_verifyotp_req.dart';
import '../../../Repositary/Retrofit/node_api_client.dart';
import '../../../Utils/DisplayUtils.dart';
import '../Digitalwill_success_message.dart';

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
      final token = prefs.get("token");

      final dio = Dio();
      final client = NodeClient(dio);

      final response = await client.confirmOtp(token.toString());

      if (response.isValid == true) {
        // OTP confirmation successful
      } else {
        // OTP confirmation failed
      }
    } catch (e) {
      // Handle exceptions
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title:
            const Text('Digital will', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: const Color(0xFF00436A),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50.0),
              _buildText(
                "Nominee for all your assets",
                FontWeight.bold,
                Colors.white,
                minFontSize: 24,
                maxLines: 1,
              ),
              const SizedBox(height: 10),
              _buildOtpContainer(),
              const SizedBox(height: 5),
              _buildPinCodeTextField(),
              _buildTermsAndConditionsText(),
              const SizedBox(height: 5),
              _buildSubmitButton(),
              const SizedBox(height: 10),
              _buildText(
                "Thanks for saving nominees for all your assets",
                FontWeight.bold,
                Colors.white,
                minFontSize: 12,
              ),
              const SizedBox(height: 10),
              _buildSubscriptionText(
                "Subscribe to Bsure Nudge Plan for ₹499/Year",
                FontWeight.bold,
                Colors.white,
                minFontSize: 12,
              ),
              const SizedBox(height: 10),
              _buildSubscriptionText(
                "Subscribe to Bsure Yearly Nudge Plan + Download All nomination documents @ ₹499",
                FontWeight.bold,
                Colors.white,
                minFontSize: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildText(
    String text,
    FontWeight fontWeight,
    Color color, {
    double minFontSize = 12,
    int maxLines = 4,
  }) {
    double fontSize = calculateTextFontSize(minFontSize);
    return Text(
      text,
      maxLines: maxLines,
      textAlign: TextAlign.start, // Align text to the center
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }

  double calculateTextFontSize(double minFontSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth > 600 ? 24.0 : 20.0;
    fontSize = fontSize < minFontSize ? minFontSize : fontSize;
    return fontSize;
  }

  Widget _buildOtpContainer() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xffd9d9d9),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: _buildText("Enter the OTP received in your mobile",
              FontWeight.normal, Colors.black,
              minFontSize: 10),
        ),
      ),
    );
  }

  Widget _buildPinCodeTextField() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: PinCodeTextField(
        appContext: context,
        length: 5,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          inactiveColor: const Color(0xff429bb8),
          selectedColor: const Color(0xff00a79d),
          activeColor: Colors.white,
          activeFillColor: const Color(0xff154854),
          inactiveFillColor: const Color(0xff154854),
        ),
        keyboardType: TextInputType.number,
        onCompleted: (v) {
          setState(() {
            otpText = v;
          });
        },
        textStyle: const TextStyle(color: Colors.white),
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
        //errorAnimationController: errorController, // Add error controller
        animationType: AnimationType.fade,
        validator: (v) {
          if (v!.length < 5) {
            return "Please enter valid OTP";
          } else {
            return null;
          }
        },
      ),
    );
  }


  Widget _buildTermsAndConditionsText() {
    return _buildText(
      "By entering the OTP you are agree to the terms and conditions of Bsure App",
      FontWeight.bold,
      Colors.white,
      minFontSize: 10,
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        digitalWillVerifyOtp();
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.white,
        minimumSize: Size(MediaQuery.of(context).size.width * 0.4, 50),
      ),
      child: Text(
        'Submit',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: calculateButtonFontSize("Submit"),
        ),
      ),
    );
  }

  double calculateButtonFontSize(String buttonText) {
    if (buttonText.length <= 10) {
      return 16;
    } else if (buttonText.length <= 20) {
      return 14;
    } else {
      return 10;
    }
  }

  Widget _buildSubscriptionText(String text, FontWeight fontWeight, Color color,
      {double minFontSize = 12}) {
    return Center(
      child: _buildText(text, fontWeight, color, minFontSize: minFontSize),
    );
  }

  Future<void> digitalWillVerifyOtp() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");

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
            builder: (context) => const Nomineeforallassets4(), // Replace with your success message screen
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
        errorMessage = 'An error occurred. Please try again.';
      });
    }
  }
}
