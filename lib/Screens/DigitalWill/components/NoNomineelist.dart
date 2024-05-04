import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class NoNomineelist extends StatelessWidget {
  const NoNomineelist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Card(
      child: Container(
        color: Colors.white,
        width: screenWidth,
        height: screenHeight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Text(
                  "You've not added any nominees yet?",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Lottie.asset('assets/animations/NoNominee.json'),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "No Nominees found",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
