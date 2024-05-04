import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoAssetlist extends StatelessWidget {
  const NoAssetlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Text(
              "You've not added any assets yet?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Lottie.asset('assets/animations/not_found.json'),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "No Assets found",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: screenHeight * 0.2,
          ),
        ],
      ),
    );
  }
}
