import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ReferralPolicy extends StatelessWidget {
  const ReferralPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  _buildHeader(),
                ],
              ),
            ),

            const Divider(
              color: Color(0xff429bb8),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildText("Refer an insurance Agent: Name, Phone No, IRDA Number"),
                  _buildText("₹100/Successful referral. Referral to be paid only after 5 successful conventions of agent"),
                  _buildText("Refer a customer: ₹25/successful referral for yearly plan; ₹100/successful referral for a lifetime plan"),
                  _buildText("Referral policy for insurance agents:"),
                  _buildText("Yearly Plan: ₹40 for the first year/successful referral; ₹20/year for the next 4 years"),
                  _buildText("Life time Plan: 10% of the paid amount (₹270/successful referral)"),
                ],
              ),
            ),
          ],
        ),
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
                "Referral Policy",
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
                'assets/animations/referral_policy.json',
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

  Widget _buildText(String text) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          // Additional styling properties can be added here
        ),
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
