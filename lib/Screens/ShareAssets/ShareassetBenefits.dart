import 'package:flutter/material.dart';

class Shareassetbenefits extends StatelessWidget {
  const Shareassetbenefits({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF429BB8),
        title: const Text(
          'Share Benefits',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBenefitItem(
            'If any friends & family have shared their assets with you, you can view it here.',
          ),
          _buildBenefitItem(
            'If you share your assets with friends & family, they can view your assets anytime on this page of the App.',
          ),
          _buildBenefitItem(
            'You can decide who can see which assets. Everything is in your control.',
          ),
          _buildBenefitItem(
            'If you share the assets with someone, they can only view your asset. It\'s neither a "will" nor a "nomination"',
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
