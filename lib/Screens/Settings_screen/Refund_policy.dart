import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:lottie/lottie.dart';
import 'Contact_Us_screen.dart';

class RefundPolicy extends StatelessWidget {
  const RefundPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        automaticallyImplyLeading: false,
        title: const Text(
          'Bsure',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.account_circle,
              size: 30,
              color: Color(0xff429bb8),
            ),
            tooltip: 'account circle Icon',
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const HeaderWidget(),
            const Divider(
              color: Color(0xff429bb8),
            ),
            const PolicySectionWidget(
              title:
                  'My amount got deducted, but the subscription is not shown. What should I do?',
              content:
                  'Generally, if the amount was stuck with the Payment gateway and your bank, '
                  'it will be automatically sent to your account in 7 days. If the amount is received by Bsure, '
                  'we will mark it as a subscription fees payment. If you have made more than one payment, '
                  'we will refund the excess amount to your source within 7-14 days.',
            ),
            const Divider(
              color: Color(0xff429bb8),
            ),
            const PolicySectionWidget(
              title:
                  'I have already taken a lifetime subscription but changed my mind. Can I get a refund?',
              content:
                  'Bsure has a no-questions-asked refund policy. If you are not happy with Bsure\'s services, '
                  'we will refund the amount deducting the charges already incurred. We will refund your money, no questions asked.',
            ),
            const Divider(
              color: Color(0xff429bb8),
            ),
            const PolicySectionWidget(
              title:
                  'I have taken a yearly plan, but I don\'t want it now, can I get a refund?',
              content:
                  'Yes, we have a no-questions-asked refund policy. If you want to cancel the plan, '
                  'we will deduct the amount for the number of days you have used the plan and refund the remaining amount.\n'
                  'COPYRIGHT © 2022 BSURE.LIVE - ALL RIGHTS RESERVED.',
            ),
            const Divider(color: Color(0xff429bb8)),
            const SizedBox(height: 5),
            const Text(
              "Still stuck? Help is just a mail away",
              style: TextStyle(
                color: Color(0xff429bb8),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ContactUsScreen(),
                ));
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: const Color(0xff429bb8),
                minimumSize: const Size(200, 50),
                elevation: 20,
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text(
                'Send message',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            children: [
              Container(
                width: constraints.maxWidth,
                margin: const EdgeInsets.only(top: 70, left: 10),
                child: const Text(
                  "Refund Policy",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xff429bb8),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 220, top: 20),
                child: Lottie.asset(
                  'assets/animations/refund_animation.json',
                  repeat: true,
                  fit: BoxFit.fitWidth,
                  errorBuilder: (_, __, ___) {
                    return const SizedBox();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class PolicySectionWidget extends StatelessWidget {
  final String title;
  final String content;

  const PolicySectionWidget({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: ExpandableText(
            content,
            expandText: 'read more',
            collapseText: 'read less',
            maxLines: 3,
            linkColor: const Color(0xff429bb8),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
