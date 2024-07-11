// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'Screens/Homepage.dart';
import 'Screens/Tutorial.dart';
import 'Screens/Utils/SharedPrefHelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SmsAutoFill().listenForCode();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bsure',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      //   useMaterial3: true,
      // ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => navigateScreen());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff429bb8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Text(
                'Bsure',
                style: TextStyle(color: Colors.white, fontSize: 100),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          ],
        ),
      ),
    );
  }

  navigateScreen() async {
    final prefs = await SharedPreferences.getInstance();

    bool? status = prefs.getBool(SharedPrefHelper().USER_LOGIN_STATUS);
    if (status == true) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Homepage(),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Intro(),
        ),
      );
    }
  }
}
