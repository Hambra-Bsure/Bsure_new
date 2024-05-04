import 'package:Bsure_devapp/Screens/DigitalWill/Digitalwill_screens/Digitalwillpreview.dart';
import 'package:flutter/material.dart';
import 'Digitalwill_mainscreen.dart';
import 'Willbenefits.dart';

class WillScreen extends StatelessWidget {
  const WillScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double scaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text(
          'Will Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AppWidget(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: 40 * scaleFactor,
                  vertical: 20 * scaleFactor,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: const Color(0xFF35Adc2),
              ),
              child: Text(
                'Edit my Will / Create a New Will',
                style: TextStyle(
                  fontSize: 18 * scaleFactor,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 20 * scaleFactor),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DigitalWillScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: 40 * scaleFactor,
                  vertical: 20 * scaleFactor,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: const Color(0xFF38B6ff),
              ),
              child: Text(
                'My Already Created Will',
                style: TextStyle(
                  fontSize: 18 * scaleFactor,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 100),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Willbenefits()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xff429bb8),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(10.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Click here ",
                        style: TextStyle(
                          fontSize: 18 * scaleFactor,
                          color: const Color(0xff429bb8),
                        ),
                      ),
                      TextSpan(
                        text: "to know the Benefits of Asset Sharing",
                        style: TextStyle(
                          fontSize: 16 * scaleFactor,
                          color: Colors.black, // Highlight color
                          fontWeight: FontWeight
                              .bold, // Optional: You can add other styles
                        ),
                      ),
                    ],
                  ),
                  //overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
