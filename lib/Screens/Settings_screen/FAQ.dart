import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'Contact_Us_screen.dart';


class FAQ extends StatelessWidget {
  const FAQ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text(
          'Bsure',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const HeaderWidget(),
            const SizedBox(height: 20),
            const Divider(color: Color(0xff429bb8)),
            const FAQSectionWidget(
              question: 'What does Bsure.live do ?',
              answer: 'Here is the list of things Bsure do'
                  '(1). Store your asset details in secure platform'
                  '(2). Tracks your well being and nudge you time to time to know your status'
                  '(3). Shares the asset details to your family members at unfortunate events'
                  '(4). Helps your family to get the assets transferred to your name.',
            ),
            const Divider(color: Color(0xff429bb8)),
            const FAQSectionWidget(
              question: 'Why Bsure.live charges a subscription fee?',
              answer: 'There are 2 kinds of companies in this world.'
                  '(1). Companies who offer services for free:'
                  ' are the people who sell your personal information to'
                  ' other companies and get money out of you.'
                  '(2). Companies who charge a fee to give a service:'
                  ' They charge for a service they offer and don\'t want to play'
                  ' around with your personal data. Bsure understands the value'
                  ' of your personal data and will not share it with anyone'
                  ' for any monetary gain. Your data is safe and secure and is'
                  ' stored in encrypted format. No one will have access to your'
                  ' financial information.',
            ),
            const Divider(color: Color(0xff429bb8)),
            const FAQSectionWidget(
              question: 'Who can be a nominee ?',
              answer: 'You can decide any person as your nominee. Please note'
                  ' that the nominee you have selected may have rights '
                  'over your properties and asset details eventually.'
                  ' In normal cases, users nominate their spouse, kids'
                  ' and parents as nominees.',
            ),
            const Divider(color: Color(0xff429bb8)),
            const FAQSectionWidget(
              question: 'When can the information be shared with the nominee ?',
              answer: 'The asset information can be shared with the nominee in '
                  'the following conditions'
                  '(1). Loss of life of the user: Bsure will ask for the details'
                  ' on the loss of life (death certificate and validate the same from'
                  ' user mobile, email).'
                  '(2). Other Exigencies: User has encountered life threatening'
                  ' disease and a proof of the same is provided to Bsure.live,'
                  ' the validation from the user is successful.',
            ),
            const Divider(color: Color(0xff429bb8)),
            const FAQSectionWidget(
              question: 'Can a minor be a nominee ?',
              answer:
              'Yes. A minor can be a nominee. But make sure to appoint a guardian with'
                  ' high morals and is able to ensure that the money is passed on to the minor'
                  ' child once he/she is eligible.',
            ),
            const Divider(color: Color(0xff429bb8)),
            const FAQSectionWidget(
              question:
              'What details does the nominee need to provide to get access to information ?',
              answer:
              'In normal circumstances, the nominee needs to provide the following details:'
                  '(1). Death certificate of the user.'
                  '(2). Nominee\'s identity proof.',
            ),
            const Divider(color: Color(0xff429bb8)),
            const FAQSectionWidget(
              question: 'Things to be noted while filling the asset details ?',
              answer: 'Ensure to fill all the columns of asset details.'
                  '(1). It is highly recommended to put the folio number, '
                  'bank account number, policy number.'
                  '(2). We also recommend attaching a copy of the public/bank'
                  ' statement in Bsure.live.'
                  '(3). Ensure to fill the legal name of the nominees.'
                  '(4). We recommend attaching a copy of the identity proof of the nominees.',
            ),
            const Divider(color: Color(0xff429bb8)),
            const FAQSectionWidget(
              question:
              'Who has the right over the wealth? The nominees mentioned on bank/investments or the nominees mentioned on the will?',
              answer:
              'In most cases, the nominees mentioned on the will have a claim'
                  ' over the nominees mentioned on the investments/bank accounts.',
            ),
            const Divider(color: Color(0xff429bb8)),
            const FAQSectionWidget(
              question:
              'There are more than 1 wills registered for the user. Which "will" will have merit?',
              answer: 'In normal circumstances, the latest registered "will"'
                  ' precedes all the previous wills.',
            ),
            const Divider(color: Color(0xff429bb8)),
            const FAQSectionWidget(
              question:
              'Should a digital will be enough or do I need to register the will?',
              answer: 'Bsure encourages users to opt for a digital will as it'
                  ' has more legal validity. However, registering the will is'
                  ' costly and the user has to bear the charges of registration.'
                  ' If the family does not raise an objection in the court,'
                  ' even the digital will is enough.',
            ),
            const Divider(color: Color(0xff429bb8)),
            const FAQSectionWidget(
              question: 'What else is required to make a will?',
              answer: 'A will should normally have the following:'
                  '(1). 2 witnesses who understand that the "will"'
                  ' is made in sound mind and without any forcefulness.'
                  '(2). An executor of the will: The executor will ensure to'
                  ' execute the will after the demise of the will creator.\n'
                  'COPYRIGHT © 2022 BSURE.LIVE-All RIGHTS RESERVED',
            ),
            const Divider(color: Color(0xff429bb8)),
            const SizedBox(height: 5),
            const Center(
              child: Text(
                "Still stuck? Help is just a mail away",
                style: TextStyle(
                  color: Color(0xff429bb8),
                  fontWeight: FontWeight.bold,
                ),
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
                minimumSize: const Size(500, 50),
                elevation: 20,
                textStyle: const TextStyle(
                  fontSize: 15,
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
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        width: screenWidth * 0.8,
        color: Colors.grey[50],
        child: Stack(
          children: [
            Container(
              width: 220,
              margin: const EdgeInsets.only(top: 30, left: 20),
              child: const Text(
                "Frequently Asked Questions",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xff429bb8),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 180, top: 20),
              child: Lottie.asset(
                'assets/animations/faq_animation.json',
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

class FAQSectionWidget extends StatelessWidget {
  final String question;
  final String answer;

  const FAQSectionWidget({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Text(
              answer,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
