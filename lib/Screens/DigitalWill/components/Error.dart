import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Error extends StatelessWidget {
  const Error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Card(
      child: Container(
        color: Colors.white,
        width: screenWidth * screenWidth,
        height: screenHeight * screenHeight,
        child: SingleChildScrollView(
          // Wrap with SingleChildScrollView
          child: Column(
            children: [
              Center(child: Lottie.asset('assets/animations/Error.json')),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
