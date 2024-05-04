import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../Utils/DisplayUtils.dart';

class ContactUsScreen extends StatelessWidget {
  final TextEditingController textdata = TextEditingController();
  final TextEditingController textdata1 = TextEditingController();
  final TextEditingController textdata2 = TextEditingController();

  ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double screenWidth = constraints.maxWidth;

          return SingleChildScrollView(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    "Get In Touch",
                    style: TextStyle(
                      color: Color(0xff429bb8),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    "We are here for you! How can we help",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: textdata,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Your Full Name',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: textdata1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Registered Email ID',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: textdata2,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Suggestions',
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (textdata.value.text.isEmpty) {
                        DisplayUtils.showToast("Please enter full name");
                      } else if (textdata1.value.text.isEmpty) {
                        DisplayUtils.showToast("Please enter email id");
                      } else if (textdata2.value.text.isEmpty) {
                        DisplayUtils.showToast("Please enter suggestions");
                      } else {
                        await Share.share(textdata.text);
                        await Share.share(textdata1.text);
                        await Share.share(textdata2.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color(0xff429bb8),
                      minimumSize: screenWidth > 600
                          ? const Size(500, 50)
                          : const Size(300, 50),
                      elevation: 5,
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    child: const Text(
                      'Send',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    "Reach out to us at",
                    style: TextStyle(
                      color: Color(0xff429bb8),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    "VRR Nest, Electronic City, Bangalore-560100",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    "+91 8861565525",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    "care@com.bsure, suggestions@com.bsure",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
