import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../Assets/get_asset_screens/category.dart';



class NoAsset extends StatelessWidget {
  const NoAsset({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Center( // Wrap with Center
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Align children in the center
          crossAxisAlignment: CrossAxisAlignment.center,
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
              height: screenHeight * 0.1,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const CategoriesScreen()),
                      (route) => true, // Removes all existing routes
                );
              },
              child: const Text("Add assets"),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
