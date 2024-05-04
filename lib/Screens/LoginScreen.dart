import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'Otp_screen.dart';
import 'Repositary/Models/LoginRequest.dart';
import 'Repositary/Models/LoginResponse.dart';
import 'Repositary/Retrofit/node_api_client.dart';
import 'Settings_screen/Privacy_policy.dart';
import 'Settings_screen/Terms_of_use.dart';
import 'Utils/SharedPrefHelper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController mobileController = TextEditingController();
  bool _isTermsAccepted = false;
  FocusNode mobileFocusNode = FocusNode(); // Add this line

  @override
  void initState() {
    super.initState();
    // Add listener to mobileController
    mobileController.addListener(() {
      if (mobileController.text.length == 10) {
        mobileFocusNode.unfocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 150,
                ),
              ),
              const SizedBox(height: 20),
              _buildInputField(
                label: "Mobile Number",
                controller: mobileController,
                hintText: "Enter your mobile number",
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),
              _buildTermsAndConditionsRow(),
              const SizedBox(height: 20),
              _buildLoginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTermsAndConditionsRow() {
    return Row(
      children: [
        Checkbox(
          value: _isTermsAccepted,
          checkColor: Colors.white,
          activeColor: const Color(0xff429bb8),
          onChanged: (value) {
            setState(() {
              _isTermsAccepted = value ?? false;
            });
          },
        ),
        const SizedBox(width: 10),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children: [
                const TextSpan(text: "Agree to "),
                _buildClickableText(
                  text: 'Terms and Conditions',
                  onTap: () {
                    // Navigate to the Terms and Conditions screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TermsOfUse(),
                      ),
                    );
                  },
                ),
                const TextSpan(text: " and "),
                _buildClickableText(
                  text: 'Privacy Policy',
                  onTap: () {
                    // Navigate to the Privacy Policy screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PrivacyPolicyScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  TextSpan _buildClickableText(
      {required String text, required VoidCallback onTap}) {
    return TextSpan(
      text: text,
      style: const TextStyle(
        color: Color(0xff429bb8),
        decoration: TextDecoration.underline,
      ),
      recognizer: TapGestureRecognizer()..onTap = onTap,
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    required TextInputType keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: [LengthLimitingTextInputFormatter(10)],
          // Limit input to 10 characters
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
          onChanged: (value) {
            // Add listener for text changes
            if (value.length == 10) {
              // Unfocus the text field when the length reaches 10
              FocusScope.of(context).requestFocus(FocusNode());
            }
          },
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed:
            _isTermsAccepted && _isMobileNumberValid() ? handleLogin : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff429bb8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          elevation: 0,
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            "Login",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  bool _isMobileNumberValid() {
    final String mobileNumber = mobileController.text;
    return mobileNumber.length == 10 && int.tryParse(mobileNumber) != null;
  }

  void handleLogin() async {
    final String mobileNumber = mobileController.text;

    if (mobileNumber.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill in all fields");
      return;
    }
    mobileFocusNode.unfocus();

    final dio = Dio();
    final client = NodeClient(dio);

    try {
      final loginRequest = LoginRequest2(username: mobileNumber);
      final LoginResponse2 response = await client.login(loginRequest);

      // Print the response for debugging

      if (response.success != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String userId = response.userId.toString();
        prefs.setString(SharedPrefHelper().USER_ID, userId);

        // Save the newUser flag to SharedPreferences
        prefs.setBool("isNewUser", response.newUser ?? false);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpScreen(
              mobilenumber: mobileNumber,
              email: null,
            ),
          ),
        );
      } else {
        Fluttertoast.showToast(msg: "Login failed");
      }
    } catch (e) {
      // Print the error for debugging
      Fluttertoast.showToast(msg: 'Network error: $e');
    }
  }
}
