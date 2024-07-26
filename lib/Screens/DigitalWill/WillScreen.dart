import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Digitalwill_screens/Digitalwillpreview.dart';
import 'Digitalwill_mainscreen.dart';
import 'Willbenefits.dart';

class WillScreen extends StatefulWidget {
  const WillScreen({super.key});

  @override
  State<WillScreen> createState() => _WillScreenState();
}

class _WillScreenState extends State<WillScreen> {
  bool hasWill = false;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _checkWillStatus();
  }

  Future<void> _checkWillStatus() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        hasWill = prefs.getBool('hasWill') ?? false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'An unexpected error occurred. Please try again later.';
      });
    }
  }

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
            Text(
              'Manage Your Will',
              style: TextStyle(
                fontSize: 20 * scaleFactor,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
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
                hasWill ? 'Update My Will' : 'Create a New Will/Edit Will',
                style: TextStyle(
                  fontSize: 18 * scaleFactor,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (hasWill) ...[
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DigitalWillScreen(),
                    ),
                  ).catchError((error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'An unexpected error occurred. Please try again later.',
                        ),
                      ),
                    );
                  });
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
                  'View My Will',
                  style: TextStyle(
                    fontSize: 18 * scaleFactor,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
            const SizedBox(height: 100),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Willbenefits(),
                  ),
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
                        text: "to know the Benefits of Will Sharing",
                        style: TextStyle(
                          fontSize: 16 * scaleFactor,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
