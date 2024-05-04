import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'Homepage.dart';
import 'Repositary/Models/OtpVerifyRequest.dart';
import 'Repositary/Retrofit/node_api_client.dart';
import 'UserProfile/Get_profile.dart';
import 'Utils/SharedPrefHelper.dart';

class OtpScreen extends StatefulWidget {
  final String? mobilenumber;
  final String? email;

  const OtpScreen({super.key, required this.mobilenumber, this.email});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> with WidgetsBindingObserver {
  String userId = '';
  TextEditingController pinCtl = TextEditingController();
  FocusNode pinFn = FocusNode();
  bool showAcceptIcon = false;
  String errorMessage = '';
  String? otpText;

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _listenOtp();
    _loadUserId();
    // Start listening for SMS code
    SmsAutoFill().listenForCode();
    // Fetch app signature for OTP autofill
    _fetchAppSignature();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      SmsAutoFill().listenForCode();
    } else if (state == AppLifecycleState.paused) {
      SmsAutoFill().unregisterListener();
    }
  }

  @override
  void dispose() {
    pinCtl.dispose();
    pinFn.dispose();
    SmsAutoFill().unregisterListener();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<String> _loadUserId() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(SharedPrefHelper().USER_ID) ?? '';
    return userId;
  }

  Future<void> _fetchAppSignature() async {
    try {
      final String appSignature = await SmsAutoFill().getAppSignature;
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('OTP Screen', style: TextStyle(color: Colors.white)),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            // Desktop view
            return _buildDesktopLayout();
          } else {
            // Mobile view
            return _buildMobileLayout();
          }
        },
      ),
    );
  }

  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 64.0),
            Image.asset(
              'assets/images/logo.png',
              height: 96.0,
            ),
            const SizedBox(height: 20),
            _buildVerifyMobileWidget(),
            const SizedBox(height: 20),
            _buildPinCodeTextField(),
            const SizedBox(height: 30),
            _buildVerifyButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    // Customize your desktop layout here
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: 600,
          margin: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 64.0),
              Image.asset(
                'assets/images/logo.png',
                height: 96.0,
              ),
              const SizedBox(height: 20),
              _buildVerifyMobileWidget(),
              const SizedBox(height: 20),
              _buildPinCodeTextField(),
              const SizedBox(height: 30),
              _buildVerifyButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVerifyMobileWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Verify your mobile number',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(height: 10),
          const Text(
            'A One-Time Password (OTP) has been sent to',
            style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(height: 5),
          _buildMobileNumberRow(),
        ],
      ),
    );
  }

  Widget _buildMobileNumberRow() {
    return Row(
      children: [
        if (widget.mobilenumber !=
            null) // Check if mobilenumber is not null (i.e., login with mobile)
          Text(
            '+91 ${widget.mobilenumber}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        if (widget.mobilenumber ==
            null) // Check if mobilenumber is null (i.e., login with email)
          Text(
            'Email: ${widget.email}',
            // Replace 'widget.email' with the actual variable storing the email
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        const SizedBox(width: 5),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Edit',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff429bb8),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPinCodeTextField() {
    return PinCodeTextField(
      appContext: context,
      autoFocus: true,
      length: 5,
      controller: pinCtl,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        inactiveColor: Colors.black12,
        selectedColor: const Color(0xff429bb8),
        activeColor: const Color(0xff429bb8),
      ),
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      onCompleted: (v) {
        setState(() {
          otpText = v;
          // otpValidation(context, v); // Call validation method here
        });
      },
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
        // otpValidation(context, value);
      },
    );
  }

  Widget _buildVerifyButton(BuildContext context) {
    return ElevatedButton(
      onPressed: showAcceptIcon
          ? () {
              if (otpText != null && otpText!.isNotEmpty) {
                if (int.tryParse(otpText!) == null) {
                  setState(() {
                    errorMessage = 'Please enter a valid 5-digit number';
                  });
                } else {
                  otpValidation(context, otpText!);
                  // Hide the keyboard after verification
                  FocusScope.of(context).unfocus();
                }
              } else {
                setState(() {
                  errorMessage = 'Please enter the OTP';
                });
              }
            }
          : null,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: const Color(0xff429bb8),
        minimumSize: const Size(500, 50),
        elevation: 20,
        textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: const Text(
        'VERIFY OTP',
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }

  Future<void> otpValidation(BuildContext context, String otp) async {
    try {
      final dio = Dio();
      final nodeClient = NodeClient(dio);
      String userId = await _loadUserId();

      // Validate userId
      if (userId.isNotEmpty && int.tryParse(userId) != null) {
        final verifyRequest =
            VerifyRequest(otp: int.parse(otp), userId: int.parse(userId));

        final response = await nodeClient.verifyotp(verifyRequest);
        final verifyResponse = response;

        if (verifyResponse.user != null && verifyResponse.token != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool(SharedPrefHelper().USER_LOGIN_STATUS, true);
          prefs.setString('token', verifyResponse.token!);

          // Retrieve isNewUser flag from SharedPreferences
          bool isNewUser = prefs.getBool("isNewUser") ?? false;

          if (verifyResponse.user!.userId != null) {
            if (isNewUser) {
              // New User
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            } else {
              // Existing User
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Homepage()),
              );
            }
          }
        } else {
          setState(() {
            errorMessage = 'Invalid OTP. Please try again.';
          });
        }
      } else {
        setState(() {
          errorMessage = 'Invalid user ID. Please try again.';
        });
      }
    } on DioError {
      setState(() {
        errorMessage =
            'An error occurred while verifying OTP. Please try again later.';
      });
    } on FormatException {
      setState(() {
        errorMessage = 'Invalid OTP format. Please enter a valid number.';
      });
    } catch (e) {
      setState(() {
        errorMessage =
            'An unexpected error occurred while verifying OTP. Please try again later.';
      });
    }
  }

  Future<void> _listenOtp() async {
    SmsAutoFill().listenForCode;

    SmsAutoFill().code.listen((String otp) {
      if (otp.isNotEmpty) {
        setState(() {
          pinCtl.text = otp;
          // Automatically trigger OTP validation when OTP is received
          otpValidation(context, otp);
        });
      }
    });
  }

// void _listenOtp() async {
//   try {
//     String otp = await SmsAutoFill().getAppSignature;
//     if (otp.isNotEmpty) {
//       pinCtl.text = otp;
//     }
//   } catch (e) {
//
//   }
//
//   await SmsAutoFill().listenForCode;
//
//   SmsAutoFill().code.listen((String otp) {
//     if (otp.isNotEmpty) {
//       pinCtl.text = otp;
//     }
//   });
// }
}
