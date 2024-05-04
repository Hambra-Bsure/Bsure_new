import 'package:flutter/material.dart';

class Willbenefits extends StatelessWidget {
  const Willbenefits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF429BB8),
        title: const Text(
          'Will Share Benefits',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader('Bsure Digital Will:'),
            _buildDescription(
              'Why?',
              'Generally, people don’t have a will. Most people also don’t change their nominee in their lifetime. In these cases, in case of an unfortunate event, families struggle a lot to claim the assets which are rightfully theirs. With Bsure digital will, one should be able to create a will in 5 minutes, download a PDF copy of the will, take a print out and also subscribe to the nudge plan.',
            ),
            _buildHeader('Salient Features of Digital Will:'),
            _buildFeature(
                'Assets can be equally distributed to all the nominees.'),
            _buildFeature(
                'All the assets can be distributed to the nominees like one asset.'),
            _buildFeature(
                'The user can confirm their identity either through a video or through SMS OTP.'),
            _buildFeature(
                'The user can edit the digital will and replace the current will with a new will.'),
            _buildFeature(
                'The user can nominate a will executor who can execute the will on the user’s behalf.'),
            _buildFeature(
                'The user can select 2 witnesses who can confirm the user’s identity by sharing the SMS.'),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildDescription(String subTitle, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            subTitle,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          content,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildFeature(String feature) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        feature,
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
