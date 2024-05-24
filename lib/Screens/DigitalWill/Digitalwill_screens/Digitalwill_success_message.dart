import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'witness_screens/DigitalWitness1.dart';
import 'Digitalwillpreview.dart';

class Nomineeforallassets4 extends StatefulWidget {
  const Nomineeforallassets4({super.key});

  @override
  State<Nomineeforallassets4> createState() => _Nomineeforallassets3State();
}

class _Nomineeforallassets3State extends State<Nomineeforallassets4> {
  @override
  void initState() {
    super.initState();
    // Start a timer with a delay of 100 seconds
    startTimer();
  }

  void startTimer() {
    const delay = Duration(seconds: 100);
    Timer(delay, () {
      // After the delay, navigate to the DigitalWillScreen
      navigateToDigitalWillScreen();
    });
  }

  void navigateToDigitalWillScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DigitalWillScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00436A),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: _buildText(
                      "Confirm it's You", FontWeight.bold, Colors.white),
                ),
                const SizedBox(height: 50),
                _buildTextWithBackground(
                  "Confirm with OTP to your registered Phone No",
                  FontWeight.bold,
                  Colors.white,
                  const Color(0xFF8c52ff),
                  () {
                    // Handle OTP verification logic here
                    showToast("OTP verification message");
                  },
                ),
                const SizedBox(height: 20),
                _buildTextWithBackground(
                  "Confirm with Video Message (recommended)",
                  FontWeight.bold,
                  Colors.white,
                  const Color(0xff154854),
                  () {
                    // Handle video verification logic here
                    showToast("Video verification message");
                  },
                ),
                const SizedBox(height: 40),
                const Text(
                  "You are also confirming that you are in sound mind to create this will and are not under any duress from anyone",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
                const SizedBox(height: 100),
                FloatingActionButton(
                  onPressed: () {
                    // Handle the button press, navigate to another screen, for example
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const DigitalWitnessScreen()), // Replace NextScreen with your desired screen
                    );
                  },
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  child: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  Widget _buildTextWithBackground(String text, FontWeight fontWeight,
      Color textColor, Color backgroundColor, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: _buildRichText(text, fontWeight, textColor),
        ),
      ),
    );
  }

  Widget _buildRichText(String text, FontWeight fontWeight, Color color) {
    final List<String> parts = text.split(" (recommended)");

    if (parts.length == 2) {
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: parts[0],
              style: TextStyle(
                color: color,
                fontSize: 24.0,
                fontWeight: fontWeight,
              ),
            ),
            TextSpan(
              text: " (recommended)",
              style: TextStyle(
                color: color,
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      );
    } else {
      return _buildText(text, fontWeight, color);
    }
  }

  Widget _buildText(String text, FontWeight fontWeight, Color color) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 24.0,
        fontWeight: fontWeight,
        //overflow: TextOverflow.ellipsis
      ),
    );
  }
}
