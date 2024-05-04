import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class Waiting extends StatelessWidget {
  const Waiting({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Card(
      child: Container(
        color: Colors.white,
        width: screenWidth * screenWidth,
        height: screenHeight * screenHeight,
        child: SingleChildScrollView(  // Wrap with SingleChildScrollView
          child: Column(
            children: [
              Lottie.asset('assets/animations/waiting.json'),
              const SizedBox(
                height: 20,
              ),
              const Text("Waiting")
            ],
          ),
        ),
      ),
    );
  }
}
