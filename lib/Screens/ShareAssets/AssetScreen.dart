import 'package:flutter/material.dart';
import 'MyShareAsssets.dart';
import 'SelectedAssetsScreen.dart';
import 'ShareAssetswithme.dart';
import 'ShareassetBenefits.dart';

class AssetScreen extends StatelessWidget {
  const AssetScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    double scaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: Text(
          'Share assets',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20 * scaleFactor, // Adjust the font size as needed
            fontWeight: FontWeight.bold, // Add bold font weight for emphasis
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white, // Set background color
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyAssetsScreen(),
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
                  backgroundColor: const Color(0xFF35Adc2), // Set button background color
                ),
                child: Text(
                  'Share my assets',
                  style: TextStyle(
                    fontSize: 18 * scaleFactor,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20 * scaleFactor), // Use height instead of width
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => const MyAssetsScreen(),
              //       ),
              //     );
              //   },
              //   style: ElevatedButton.styleFrom(
              //     padding: EdgeInsets.symmetric(
              //       horizontal: 40 * scaleFactor,
              //       vertical: 20 * scaleFactor,
              //     ),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     backgroundColor: const Color(0xFF429bb9),
              //   ),
              //   child: Text(
              //     'My Share Assets',
              //     style: TextStyle(
              //       fontSize: 18 * scaleFactor,
              //       color: Colors.white,
              //     ),
              //     overflow: TextOverflow.ellipsis,
              //   ),
              // ),
             // SizedBox(height: 20 * scaleFactor), // Use height instead of width
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Shareassetwithme(),
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
                  'Assets shared with me',
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
                    MaterialPageRoute(
                      builder: (context) => const Shareassetbenefits(),
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
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
