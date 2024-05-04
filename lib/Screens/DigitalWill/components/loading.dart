import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingAssets extends StatelessWidget {
  const LoadingAssets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF00436A),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.02),
                child: Text(
                  "Asset Distribution",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.07,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(),
                  child: const Loading(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Align(
        alignment: Alignment.topCenter,
        child: Card(
          child: Container(
            color: Colors.white,
            width: screenWidth,
            height: screenHeight,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.02,
                  ),
                ),
                Expanded(
                  child: Lottie.asset('assets/animations/loading.json'),
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  child: Text(
                    "Stay tight till your assets are loading",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
