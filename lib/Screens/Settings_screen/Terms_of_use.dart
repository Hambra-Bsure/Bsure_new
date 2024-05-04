// ignore_for_file: file_names

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TermsOfUse extends StatefulWidget {
  const TermsOfUse({super.key});

  @override
  State<TermsOfUse> createState() => _TermsOfUseState();
}

class _TermsOfUseState extends State<TermsOfUse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 10),
            const Divider(
              color: Color(0xff429bb8),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildExpansionTile(
                    "Welcome to Bsure.live!",
                    'At Bsure.live we are aiming to secure all'
                        ' your financial information and data and transfer it to your family members'
                        ' on time. Our aim is to ensure our users family members dont have to run'
                        ' from pillar to post to get the financial information of the user when they'
                        ' desperately need them.',
                  ),
                  const SizedBox(height: 10),
                  _buildExpansionTile(
                      "Eligibility",
                      'By registering with Bsure.live and accessing the BSure.live'
                          ' Services, you are representing the following:'
                          '1. You are 18 years of age or older '
                          '2. You are capable of entering into a legally binding agreement.'
                          '3. You are not barred or otherwise legally prohibited from'
                          'accessing or using the Bsure.live app and Bsure.live Services.'
                          'If you allow anyone to use your account, including individuals'
                          '  under 18 years of age,You will still be responsible for ensuring that'
                          'such individuals comply with these these terms of Use. You will be'
                          ' responsible for all actions these individuals take in and/or'
                          '  through your account. You also acknowledge that Bsure.live does not'
                          'have the responsibility of ensuring that You meet the a fore said'
                          'eligibility requirements'
                          'Please read the terms and conditions carefully before registering,'
                          'accessing or using the BSure.live services (defined below)'
                          'offered through the Bsure.live website,Bsure.live App (defined below)'
                          'offered through the Bsure.live website,Bsure.live App(defined below)'
                          ' or through applications or website of Bsure.live Group Entities'
                          '(defined below). These terms and conditions are legal contract'
                          '(Terms of Use between You and Bsure.live("Bsure.live"). You agree and '
                          'acknowledge that you have read the terms and conditions set forth below.'
                          'If you dont agree to these terms of Use , you may not Use the BSure.live'
                          'Services and/or immediately terminate the Services and /or uninstall'
                          'the Bsure.live App.'),
                  const SizedBox(height: 10),
                  _buildExpansionTile(
                      "1. Definitions",
                      '“Bsure.live”, “Bsure.live” “We”, “Us”, “Our” means Bsure.live and Bsure.live Group Entities.'
                          '“You”, “Yours”, “Yourself”, “User” means any prospective user, or registered user of Bsure.live and Bsure.'
                          'live Group Entities, including but not limited to customers and Commercial Partners.'
                          '“Bsure.live App” means mobile application(s), hosted by Bsure.live and Bsure.live Group Entities for providing services to the Users, '
                          'and Commercial Partners.'
                          '“Bsure.live Group Entities” means subsidiaries and affiliates of Bsure.live.'
                          '"Bsure.live Platform” means any platform owned/subscribed/used by Bsure.'
                          'live or Bsure.live Group Entities including but not limited to the Bsure.live Website, the Bsure.live App, '
                          'other mobile applications, devices, URLs/links, notifications, chat bots, '
                          'Bsure.live’s social media channels or any other communication medium or mechanism used by Bsure.'
                          'live or Bsure.live Group Entities to provide services to the Users.'
                          '“Bsure.live Website” means  https://Bsure.live or any other website hosted or registered by Bsure.live or Bsure.live Group Entities.'
                          '“Bsure.live Services” means and include all services offered / to be offered by Bsure.live, and Bsure.'
                          'live Group Entities either directly or through its Commercial Partners.'
                          '“Commercial Partner” means any individual or entity with whom Bsure.live or Bsure.'
                          'live Group Entities have a contractual relationship and includes but is not limited to entities offering rewards on Bsure.live App, '
                          'lawyers and other service providers who work on behalf of Bsure.live.'
                          '“Terms of use” / “Terms and Conditions” are interchangeably used and mean these Terms of Service including the Supplemental Terms.'),
                  const SizedBox(height: 10),
                  _buildExpansionTile(
                      "2. Your Use of Bsure.live",
                      'You agree that:'
                          '1. Unless otherwise permitted by Bsure.live in writing, You may only possess one account.'
                          '2. Your use of the App shall not violate any applicable law or regulation.'
                          '3. Your use of the Bsure.live App, and Bsure.live Platforms shall be only for personal purposes.'
                          '4. All registration information you submit is truthful, complete and accurate and you agree to maintain accurate, '
                          'complete and up-to-date account information in your account.'
                          '5. You are responsible for all activity that occurs under your account.'
                          '6. You are responsible for maintaining the confidentiality of the access Bsure.'
                          'live credentials of your account and are fully responsible for all activities that occur under your account.'
                          ' You agree to immediately notify Bsure.live of any unauthorized use of your passcode or account or any other breach of security.'
                          '7. You agree that You are aware and responsible for all transactions taking place through your Account.'
                          ' You shall continue to be responsible for the transactions in your account, '
                          'if you knowingly or negligently (i) grant any other person access to your Bsure.live App,'
                          ' (ii) permit them to transact on Your account, or '
                          '(iii) transact on any other person’s behalf or directions; whether by sharing one-time passwords or in any other manner.'
                          '8. You shall not indulge in decompiling, reverse engineering, disassembling content, '
                          'removing any intellectual property right associated with the Bsure.live App,'
                          ' including our copyright, trademarks, trade secrets, designs, and patents, or other proprietary notices.'
                          '9. You shall not access or use the Bsure.live App in any manner that (i) may be harmful to the operation of the Bsure.live App or its content; '
                          '(ii) may be unlawful; (iii) maybe harmful to Bsure.live or to any other User; '
                          '(iv) may hinder the other User’s enjoyment of the Bsure.live App; or (v) to defraud other Users, Bsure.live or any Commercial Partner.'
                          '10. You shall not post, distribute, or otherwise transmit or make available any software or other computer files that contain a virus,'
                          ' other harmful component or malicious content, or otherwise impair or damage the Bsure.live App or any connected network, '
                          'or otherwise interfere with any person or entity"s" use or enjoyment of the Bsure.live App.'
                          '11. Your use of the Bsure.live App shall indicate that you have provided consent to automatically receive updates such as bug fixes,'
                          ' patches, enhanced functions, missing plug-ins and new versions (collectively, ‘Updates’), '
                          'for the purpose of effective delivery of the Bsure.live Services.'
                          ' Please note that your continued use of the Bsure.live App following such Updates would mean deemed acceptance by you of the same.'
                          '12. You understand and accept that not all products, services and rewards offered on the Bsure.'
                          'live App are available in all geographic areas and you may not be eligible for all the products, '
                          'services and rewards offered by Bsure.live on the Bsure.live App or other Bsure.live Platforms. '
                          'Bsure.live reserves the right to determine the availability and eligibility for any product, '
                          'services and rewards offered on the Bsure.live App or any Bsure.live Platform.'
                          '13. You shall request Bsure.live, to block the Account and change the passcode immediately for the account, '
                          'if your device has been lost or stolen.'),
                  const SizedBox(height: 10),
                  _buildExpansionTile(
                      "3. Supplemental Terms and delivery of services through Bsure.live Group Entities ",
                      'You agree and acknowledge that several features are subject to certain supplemental Terms of Use set out below.'
                          ' Your usage of any features that have a set of Supplemental '
                          'Terms of Use is deemed to be acceptance of the said Supplemental Terms of Use. '
                          ' You further agree that any Bsure.live Services may be provided to You '
                          'either directly by Bsure.live or by any Bsure.live Group Entity and in particular, '
                          'any payment to you or made by you may be routed through Bsure.live PayTech Services Private Limited'
                          ' (“Payment Aggregator”).'),
                  const SizedBox(height: 10),
                  _buildExpansionTile(
                      "4. Violation of Terms of Use / Suspicious Activity",
                      'If We believe that you have violated any of the conditions as mentioned under these Terms of Use, '
                          'our Privacy Policy, Supplemental Terms applicable to certain services or'
                          ' any agreements consented to via the Bsure.live App, we reserve the right to suspend your access to the Bsure.live App and/or'
                          ' delete your account without prior notice to You. '
                          'If We have reason to believe that there is suspicious or unusual activity being carried out through your account, '
                          'we may temporarily or permanently suspend your access to the Bsure.live Services. If we suspect that any feature, '
                          'offer or reward promotion is being availed by You in a manner (i) that is disingenuous; (ii) that it is not intended to be availed;'
                          ' (iii) that is designed to deliberately side step fair use restrictions; (iv) that may result in you gaining an undue, '
                          'unfair or unethical advantage over other Users or Commercial Partners; (v) that is intended to cause losses or other harm to Commercial Partners,'
                          ' Bsure.live reserves the right to reverse the relevant transaction, '
                          'suspend the account or restrict you from using the App in its entirety or any specific feature(s) thereof. You may reach out to the Bsure.live'
                          ' support team to assist you with any query or question arising as a result of the aforementioned suspension/ deletion.'),
                  const SizedBox(height: 10),
                  _buildExpansionTile(
                      "5. Termination / Deletion of Your Account",
                      'You may end your legal agreement with Bsure.live at'
                          ' any time by deactivating your account and discontinuing the use of the Bsure.live Services.'
                          'Following a request for deletion, or termination of account by Bsure.live, '
                          'We consider the agreement to be terminated and take appropriate steps. '
                          'Provided however, Bsure.live may continue to maintain some records for record keeping purposes'
                          ' and/or regulatory reasons. Deletion of the account or Termination also does not terminate '
                          'Your obligations undertaken prior to deletion or termination of the account including but not '
                          'limited to the obligation to repay any loan or Bsure.live it line availed by You. Bsure.live'
                          ' may continue to retain a list of documents you have stored on the Bsure.live App'
                          ' for regulatory and archival purposes.'),
                  const SizedBox(height: 10),
                  _buildExpansionTile(
                      "6. Fees",
                      'You are responsible for any fees that may be applicable to certain transactions or use of the Bsure.live App;'
                          ' where you will be notified of such applicable fees, '
                          'prior to the completion of any transaction. By clicking ‘Proceed’ / ‘Submit’ / ‘Continue’ or any other '
                          'similar button on the Bsure.live App, You shall be deemed to have consented to the fees displayed on the said page.'),
                  const SizedBox(height: 10),
                  _buildExpansionTile(
                      "7. Privacy",
                      'We collect, hold, use and transfer your personal data in accordance with our Privacy Policy. '
                          'By agreeing to the Terms of Use, you hereby agree to our Privacy Policy, '
                          'which may be updated and/or modified by us from time to time. You understand and agree that, '
                          'to the extent permitted by applicable law, any data provided by you in connection with the Bsure.live Services '
                          'may be shared with our subsidiaries, afﬁliates or partners, '
                          'and/ or used by us for enhancing the Bsure.live Services, including but not limited to creating new products. '
                          'Please refer to the Privacy Policy for further clarity on the subject.'),
                  const SizedBox(height: 10),
                  _buildExpansionTile(
                      "8.Refund Policy",
                      'The amount paid is non-refundable. Only if the customer has made a double payment inadvertently '
                          'and seeks refund for one of the payments, '
                          'Bsure will refund this amount to the customer within 7 working days.'),
                  const SizedBox(height: 10),
                  _buildExpansionTile(
                      "9. Disclaimer",
                      'The Bsure.live Services, including all content, software, functions, material, and information made available'
                          ' or accessible through the Bsure.live Platform are provided “as is”. Bsure.live, '
                          'Bsure.live Group Entities and their respective agents, co-branders or partners, '
                          'make no representation and warranty of any kind for the content, '
                          'software, functions, material, and information available/accessible through the Services.'
                          'Bsure.live does not warrant that the functions contained in content, '
                          'information and materials on the Bsure.live App, including,'
                          ' without limitation any third-party sites or services linked to the Bsure.live App '
                          'or any Bsure.live Platform will be uninterrupted, timely or error-free, '
                          'that the defects will be rectified, or that the Bsure.live App or the servers that make such content,'
                          ' information, and materials available are free of viruses or other harmful components.'
                          'Bsure.live cannot assure that Commercial Partners or '
                          'other Users are or will be complying with the foregoing Terms of Use '
                          'or any other provisions mentioned here. '
                          'You assume all risk of harm or injury resulting from any such '
                          'lack of compliance by any other User or Commercial Partner. '
                          'You should ensure that you have undertaken adequate due diligence prior '
                          'to transferring payments using the Bsure.live App.'),
                  const SizedBox(height: 10),
                  _buildExpansionTile(
                      "10. Limitation of Liability",
                      'In no event shall Bsure.live, Bsure.live Group Entities, their officers, shareholders, subsidiaries, associate companies, directors, employees and agents, partners, co-branders, licensors, licensees, consultants, or contractors be liable to you or any third party for any special, incidental, indirect, '
                          'consequential or punitive damages or losses whatsoever, '
                          'or damages for loss of data or profits, goodwill, '
                          'and/ or other intangible loss, whether or not foreseeable and regardless of whether Bsure.live '
                          'has been advised of the possibility of such damages, or based on any theory of liability, '
                          'including breach of contract or warranty, negligence or other tortious action, '
                          'or any other claim arising out of or in connection with your use of, or access to, '
                          'the Bsure.live Platforms, Bsure.live App or Bsure.live Services.'
                          'In no event shall Bsure.live and Bsure.live Group Entities’ '
                          'total cumulative liability to You in connection with the Bsure.live Services for all damages, '
                          'losses and causes of action (whether arising under contract or otherwise), '
                          'arising from or relating to Your use of the Bsure.live App and Bsure.live Platforms'
                          ' or arising from these Terms of Use exceed INR 10,000 (Indian Rupees ten thousand only).'),
                  const SizedBox(height: 10),
                  _buildExpansionTile(
                      "11. Indemnity",
                      'You agree to defend, indemnify and hold harmless Bsure.live, Bsure.live Group Entities, '
                          'its officers, owners, directors, employees and agents, partners, '
                          'co-branders, licensors, licensees, consultants, contractors and other applicable third parties'
                          ' (collectively ‘Indemnified Parties’) from and against any and all claims, demands, damages,'
                          ' obligations, losses, liabilities, cause of action, costs or debt, and expenses'
                          ' (including any legal fees) arising from:'
                          '1. your use of and access to the Bsure.live App and the Bsure.live Platforms;'
                          '2. your violation / breach of any of these Terms of Use;'
                          '3. your violation of any third party right, including any intellectual property right or privacy right;'
                          '4. the committing of any of the prohibited activities as stated herein;'
                          '5. your failure to be in compliance with applicable law, including tax laws and cyber security laws; or'
                          '6. any claim that your use of the Bsure.live App caused damage to a third party.'),
                  const SizedBox(height: 10),
                  _buildExpansionTile(
                      "12. Disputes & Arbitration",
                      'In consideration for Bsure.live granting you access to and use of the Bsure.live App,'
                          ' Bsure.live Platforms and Bsure.live Services, '
                          'you agree that in case of any dispute between You and any Commercial Partner,'
                          ' Bsure.live shall not be a party to the same. While Bsure.live is not obligated to mediate '
                          'or resolve disputes, Bsure.live will assist Users in communicating with each other regarding a dispute. '
                          'Bsure.live may at its own discretion however, without having any obligation to do so, '
                          'assist in resolving the disputes between the Users and the Commercial Partners.'
                          'Except as otherwise set forth in these Terms of Use,'
                          'these Terms of Use shall be exclusively governed by and construed in accordance with the laws of India.'
                          'Any dispute, conflict, claim or controversy arising out of or broadly in'
                          'connection with or relating to the Bsure.live Services or these Terms,'
                          'including those relating to its validity, its construction or its enforceability,'
                          'but excluding those provisions where it has been specified that Bsure.live’s decision shall be final,'
                          '  (any “Dispute”) shall be, if initiated by the User, '
                          'first raised by the user to grievanceofficer@Bsure.live. '
                          'If such Dispute has not been settled within sixty (60) days after the User reaches out to '
                          'the aforementioned email IDs, such Dispute can be referred to and shall be exclusively'
                          ' and finally resolved by arbitration under the Arbitration and Conciliation Act, 1996 (“Act”).'
                          ' Provided however when Bsure.live raises any dispute, '
                          'Bsure.live may directly initiate arbitration in accordance with this clause.'
                          ' The Dispute shall be resolved by one (1) arbitrator to be appointed by Bsure.live. '
                          'The place the arbitration shall be Bangalore, India. The language of the arbitration shall be English.'
                          ' The existence and content of the arbitration proceedings, '
                          'including documents and briefs submitted by the parties, and correspondence, '
                          'orders and awards issued by the sole arbitrator, '
                          'shall remain strictly confidential and shall not be disclosed to any third party without '
                          'the express written consent from the other party unless: '
                          '(i) the disclosure to the third party is reasonably required in the context of conducting '
                          'arbitration proceedings; and (ii) the'
                          'third party agrees unconditionally in writing to be bound by the confidentiality '
                          'obligation stipulated here in.'),
                  const SizedBox(height: 10),
                  _buildExpansionTile(
                      "13. Use and Protection of Intellectual Property Rights",
                      'Bsure.live App, Bsure.live Website, Bsure.live logos and the Bsure.live Services are protected by copyright, '
                          'trademarks, patents, trade secret and/or other intellectual property laws. No information, '
                          'content or material from the Bsure.live App including, without limitation, '
                          'all of the page headers, images, illustrations, graphics, audio clips, video clips or text, '
                          'reports generated, trademarks, trade names may be copied, reproduced, republished, uploaded, posted, '
                          'transmitted or distributed in any way without Our express written permission. You are hereby given a '
                          'limited licence to use the Bsure.live App and the Bsure.live Platforms, '
                          'subject to your agreement of these Terms of Use.'
                          'Bsure.live, Bsure.live Group Entities, and its licensors, if any, '
                          'are the sole owners of the underlying software and source code associated with the Bsure.live App '
                          'and Bsure.live Platforms as well as any other intellectual property rights of any other nature '
                          'associated with the Bsure.live App, Bsure.live Platforms and their content.'
                          'When you upload, submit, store, send or receive content that may include feedback to or '
                          'through the Bsure.live App, you give Bsure.live and Bsure.live Group Entities a worldwide, '
                          'perpetual licence to use, host, store, reproduce, modify, create derivative works, '
                          'communicate, publish, publicly perform, publicly display and distribute such content. '
                          'This licence shall not expire even if it is not used by Bsure.live or Bsure.live Group Entities. '
                          'The rights you grant in this licence are for the limited purpose of operating, promoting, '
                          'and improving the Bsure.live Services, and to develop new ones. '
                          'This licence continues even if you stop using the Bsure.live Services.'),
                  const SizedBox(height: 10),
                  _buildExpansionTile(
                      "14. Tax Liability",
                      'You hereby agree to comply with any and all applicable tax laws in connection with your use of the Bsure.live Services, '
                          'including without limitation, the reporting and payment of any taxes arising in connection with payments made through the Bsure.live App, '
                          'or funds/income received through the Bsure.live Services.  '
                          'You hereby agree and acknowledge that if and when required by applicable law, Bsure.live, '
                          'may deduct tax deducted at source from your winnings/ '
                          'cashback and/or may require You to submit PAN details before providing you cashback or other winnings.'),
                  const SizedBox(height: 10),
                  _buildExpansionTile(
                      "15. Governing Law and Jurisdiction",
                      'The Bsure.live App, the Bsure.live Services, all your transactions with the Bsure.live App, '
                          'and our relationship shall be governed by the laws of India, without regard to conflict of law principles.'
                          ' You agree that subject to the Disputes & Arbitration Clause above, all claims, '
                          'differences and disputes which we may have shall be subject to the exclusive jurisdiction of the competent courts located in Bengaluru, Karnataka, India.'),
                  const SizedBox(height: 10),
                  _buildExpansionTile(
                      "16. Assignment",
                      'You shall not transfer or assign any of Your rights and obligations arising from these Terms of Use.'
                          'You agree and acknowledge that Bsure.live may assign or transfer its rights and obligations under these Terms of Use in whole or in part,'
                          ' to (i) any other Bsure.live Group Entity; (ii) an acquirer of Bsure.live or any Bsure.live Group Entity or their respective equity interest,'
                          'business or assets; or (iii) a successor entity resulting from any corporate action including mergers or demergers.'),
                  const SizedBox(height: 10),
                  _buildExpansionTile(
                      "17. General",
                      'No joint venture, partnership, employment or agency relationship exists between you, '
                          'Bsure.live, Bsure.live Group Entities or any Third Party as a result of the contract contained in these Terms of Use. '
                          'If any provision of these Terms of Use is held to be illegal, invalid or unenforceable, in whole or in part, '
                          'under any law, such provision or part thereof shall to that extent be deemed not to form part of these Terms of Use but the legality,'
                          ' validity and enforceability of the other provisions in these Terms of Use shall not be affected. In that event, '
                          'Bsure.live shall replace the illegal, invalid or unenforceable provision or part thereof with a provision or part thereof that is legal,'
                          ' valid and enforceable and that has, to the greatest extent possible, a similar effect as the illegal, '
                          'invalid or unenforceable provision or part thereof, given the contents and purpose of these Terms of Use. '
                          'These Terms of Use (together with any additional terms displayed in specific sections of the Bsure.live App or Bsure.live Website)'
                          ' constitute the entire agreement and understanding of the parties with respect to its subject '
                          'matter and replaces and supersedes all prior or contemporaneous agreements or undertakings regarding such subject matter.'),
                  const SizedBox(height: 10),
                  _buildExpansionTile(
                      "18. Updation",
                      'We may amend these Terms of Use at any time by posting an updated version on the Bsure.live Website. '
                          'The updated version of these Terms of Use shall supersede the previous version of the Terms of Use and take effect immediately upon posting. '
                          'You have the right to opt-out of agreeing to these Terms of Use or any future updated version of the Terms of Use,'
                          ' by ceasing to use the Bsure.live App. However, please be aware that your continued use of the Bsure.live Services '
                          'from the launch of any updated Terms of Use would mean deemed acceptance of such updated Terms of Use including any modification thereof.'
                          ' We recommend you to keep checking the Terms of Use often to be familiar with any updates and changes.\n'
                          'COPYRIGHT © 2022 BSURE.LIVE-All RIGHTS RESERVED'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpansionTile(String title, String content) {
    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ExpandableText(
            content,
            expandText: 'read more',
            collapseText: 'read less',
            style: const TextStyle(fontSize: 15, color: Colors.black),
            linkColor: const Color(0xff429bb8),
            maxLines: 1,
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}

  _buildHeader() {
    return Center(
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              width: 180,
              margin: const EdgeInsets.only(top: 50, left: 50),
              child: const Text(
                "Terms and Conditions",
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
                'assets/animations/tnc_animation.json',
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

