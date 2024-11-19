import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../LoginScreen.dart';
import 'Digitalwill_mainscreen.dart';
import 'Digitalwill_screens/witness_screens/willpdf_download.dart';
import 'Willbenefits.dart';

class WillScreen extends StatefulWidget {
  const WillScreen({super.key});

  @override
  State<WillScreen> createState() => _WillScreenState();
}

class _WillScreenState extends State<WillScreen> {
  bool hasWill = false;
  String errorMessage = '';
  bool paymentSuccess = false;
  String willPdfUrl = '';

  @override
  void initState() {
    super.initState();
    checkWillExists();
    checkPaymentStatus();
  }

  Future<void> checkPaymentStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token") ?? '';

      if (token.isEmpty) return;

      final url = Uri.parse('https://dev.bsure.live/v2/will/isPaidWillUser');
      final response = await http.get(
        url,
        headers: {
          'Authorization': ' $token',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          paymentSuccess = data['paid'] ?? false;
          willPdfUrl = data['pdfUrl'] ?? ''; // Store PDF URL if available
        });
      } else {
        throw Exception('Failed to check payment status');
      }
    } catch (e) {
      setState(() {
        errorMessage = 'An unexpected error occurred. Please try again later.';
      });
    }
  }

  Future<void> checkWillExists() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token") ?? '';

      if (token == null || token.isEmpty) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Invalid Token'),
            content: const Text('Please log in again.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }

      final url = Uri.parse('https://dev.bsure.live/v2/will/check-exists');
      final response = await http.get(
        url,
        headers: {
          'Authorization': ' $token',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          hasWill = data['success'] ?? false;
        });
      } else {
        throw Exception('Failed to check will status');
      }
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
                hasWill ? 'Update My Will' : 'Create a Will',
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
                  downloadPdf();
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
                  'Download Will PDF',
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
                        text: "Benefit of Will Creation",
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

  Future<void> downloadPdf() async {
    if (!paymentSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete the payment to download the PDF.')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PdfDownloadScreen(pdfUrl: willPdfUrl)),
    );
  }
}
