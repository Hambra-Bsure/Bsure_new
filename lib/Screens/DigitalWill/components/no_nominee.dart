import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../Nominees/Get_all_nominees.dart';

class NoNominee extends StatelessWidget {
  const NoNominee({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.white,
      width: screenWidth,
      height: screenHeight * 0.9,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
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
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const GetNomineeScreen(),
                  ),
                );
              },
              child: const Text("Add nominees"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
