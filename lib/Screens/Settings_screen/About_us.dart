import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    const titleTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30,
      color: Color(0xff429bb8),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const Divider(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "What we do?",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildFeatureItem(
                    context,
                    "Stores Asset Information.",
                    "Stores asset details in encrypted format",
                    "assets/images/store_asset.png",
                  ),
                  const SizedBox(height: 10),
                  _buildFeatureItem(
                    context,
                    "Shares information.",
                    "Shares asset information with nominees in exigency",
                    "assets/images/share_info.png",
                    reverse: true,
                  ),
                  const SizedBox(height: 10),
                  _buildFeatureItem(
                    context,
                    "Tracks well-being.",
                    "Tracks your well-being time to time",
                    "assets/images/track_wellbeing.png",
                  ),
                  const SizedBox(height: 10),
                  _buildFeatureItem(
                    context,
                    "Helps in claim",
                    "Helps family in transferring the assets to their name",
                    "assets/images/help_claim.png",
                    reverse: true,
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0xff429bb8),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Contact us",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: Text(
                      "COPYRIGHT 2022 BSURE.LIVE-ALL RIGHTS RESERVED",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(
    BuildContext context,
    String title,
    String description,
    String imageAsset, {
    bool reverse = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (reverse)
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Column(
                  children: [
                    Image.asset(imageAsset),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14),
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ],
            ),
          ),
          if (!reverse)
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Image.asset(imageAsset),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Center(
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              width: 180,
              margin: const EdgeInsets.only(top: 50, left: 50),
              child: const Text(
                "About Us",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xff429bb8),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 200, top: 20, right: 20, bottom: 20),
              child: Lottie.asset(
                'assets/animations/familysafety_animation.json',
                repeat: true,
                fit: BoxFit.fitWidth,
                errorBuilder: (_, __, ___) {
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
