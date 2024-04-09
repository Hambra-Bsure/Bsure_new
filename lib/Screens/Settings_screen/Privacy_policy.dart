// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:lottie/lottie.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              const Divider(color: Color(0xff429bb8)),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildExpansionTile(
                      'Bsure',
                      // Provide a title for the Expansion Tile
                      'We at Bsure.live are committed to protecting the privacy and security of your personal information. '
                          'Your privacy is important to us and maintaining your trust is paramount.  '
                          'This Privacy Policy explains how we collect, use, process and disclose information about you. '
                          'By using our website/app and affiliated services, '
                          'you consent to the terms of our privacy policy (“Privacy Policy”) in addition to our Terms of Use. '
                          'We encourage you to read this Privacy Policy regarding the collection, '
                          'use, and disclosure of your information from time to time to keep yourself '
                          'updated with the changes &amp; updated that we make to this Policy. '
                          'This Privacy Policy describes our privacy practices for all websites,'
                          ' products and services that are linked to it...',
                    ),
                    const SizedBox(height: 10),
                    _buildExpansionTile(
                      '1. Information We Collect:',
                      'The following information is collected by or on behalf of Bsure.live.'
                          '1.1 Information You provide us When you start using the Bsure.live App, we ask you to provide certain information as part of the registration process,'
                          ' and in the course of your interface with the Bsure.live App.'
                          ' We will collect this information through various means and in various places through the Bsure.live App, '
                          'including account registration forms, contact us forms, or when you otherwise interact with Bsure.live including at customer support. '
                          ' At the time of registration, we ask for the following personal information. '
                          'Name (First Name, Last Name); Mobile Number; Email ID; Date of Birth; ID proof. '
                          ' Pursuant to the services consumed by You from time to time, '
                          'we may explicitly seek additional information including address, '
                          'Asset details (including but not limited to bank account details, '
                          'Insurance details, Mutual fund details, stock details, property details and any other governmental identification numbers or documents. '
                          'You may choose to provide such information if you wish to use the services provided by the App.  We will also maintain a record of the information you provide to us when using customer support services.  From time to time, during your use of the Bsure App, Bsure.live may require access to certain additional information such as SMS and contact details. Prior to accessing any such additional information, explicit consent shall be sought from you. Please note that even after consent has been provided by you, we only read transactional or promotional SMS and do not open, access or read any personalSMS.'
                          ' 1.2 Certain Information created when You use the Bsure.live App: '
                          'We collect information relating to your use of our website/app through the use of various technologies. '
                          'This includes transaction details related to your use of our services including the type of services you requested, '
                          'the payment method, amount and other related transactional and financial information. '
                          'Further, when you visit our website/app, we may log certain information such as your IP address, '
                          'browser type, mobile operating system, manufacturer and model of your mobile device, '
                          'geolocation, preferred language, access time, and time spent.'
                          ' We will also collect information about the pages you view within our sites and other actions you take while visiting our website/app. '
                          ' We also maintain some records of users who contact us for support, '
                          'for the purpose of responding to such queries and other related activities.'
                          ' However, we do not provide this information to any third party without your permission,'
                          ' or utilize the same for any purposes not set out hereunder.'
                          'We may use, store and process the information provided by you to '
                          '(1) improve the services offered through the Bsure.live App, '
                          '(2) create and maintain a trusted and safe environment on Bsure.'
                          'live (such as complying with our legal obligations and compliance with our policies) and '
                          '(3) provide, personalise, measure and improve our products and services. '
                          ' The information collected through different channels, '
                          'allows us to collect statistics about our website/app usage and effectiveness, '
                          'personalise your experience whilst you are on our website/app,as well as customize our interactions '
                          'with you and to enhance the scope of the App Services. '
                          'The following paragraphs describe in more detail how we use your personal information.'
                          ' 2.1 Providing, understanding and improving service offered through the Bsure.live App:'
                          ' Any information provided by you will be used for creating and updating your account and processing your transaction(s)'
                          ' or for any other purposes for which you have granted access to such information to us, '
                          'based on your interaction with the Bsure.live App.  To complete a financial transaction, '
                          'we may share financial information (such as credit card details or other payment mode details) provided by you with authorised third-parties, '
                          'for instance, our business partners, financial teams/institutions, '
                          'or postal/ government authorities involved in fulfilment of the said transactions,'
                          ' if any. This does not include any information collected from e-mails. In connection with a financial transaction, '
                          'we may also contact you as part of our customer satisfaction surveys or for market research purposes. '
                          ' We may use the information collected to perform internal operations necessary to provide our services, '
                          'including to troubleshoot software bugs and operational problems, '
                          'to conduct data analysis, testing and research and to monitor and analyse usage and activity trends.'
                          ' We process this personal information for these purposes given our legitimate interest in improving the App Services. '
                          ' In order to expand the scope of our services, we may from time to time, seek additional information from you. '
                          'Any such collection of additional information and documents shall be subject to an explicit &amp; purpose specific consent sought from all Users.'
                          '2.2 Safety, security and resolution of issues:'
                          ' We may use your personal information, created as part of payment services availed by you, '
                          'to ensure that your access and use of payment services is in compliance with our legal obligations '
                          '(such as anti-money laundering regulations). We may share such information, with our advisors,'
                          ' third party service partners and providers for a seamless experience for you. '
                          ' We may use the information to create and maintain a safe environment and use the same to detect and prevent '
                          'fraud, span, abuse, security incidents and other harmful activity. '
                          ' We use the information we collect (including recordings of customer support calls) '
                          'to assist you when you contact our customer support services to investigate and resolve your queries,'
                          ' monitor and improve our customer support responses. Certain online transactions may involve us calling you.'
                          ' This may also involve online chats. '
                          'Please be aware that it is our general practice to monitor and in some cases record such '
                          'interactions for staff training or quality assurance purposes or to retain evidence of a '
                          'particular transaction or interaction.  We intend to protect your personal information and to maintain its '
                          'accuracy as confirmed by you. We implement reasonable physical, '
                          'administrative, and technical safeguards to help us protect your personal information from unauthorised access, '
                          'use, and disclosure. For example, we encrypt all sensitive personal information '
                          'such as account details, folio number, insurance ID etc when we transmit such information over the internet. '
                          'We also require that our commercial partners and vendors protect such information from unauthorised access,'
                          ' use, and disclosure.  We blend security at multiple steps within our products with state of the art technology'
                          ' to ensure our systems maintain strong security measures.'
                          ' The overall data and privacy security design allows us defend our systems ranging from low hanging issue up to sophisticated attacks. '
                          'You can read more about it here.  We are committed to protecting your data as if it were our own. '
                          'You can find more details here. If you are a security enthusiast or a '
                          'researcher and you have found a possible security vulnerability on Bsure products,'
                          ' we encourage you to report the issue to us responsibly. '
                          'You could submit a bug report to us at suggestions@com.bsure with detailed steps required to reproduce the vulnerability. '
                          'We shall put best of our efforts to investigate and fix the legitimate issues in a reasonable time frame,'
                          ' meanwhile, requesting you not to publicly disclose it.'
                          '2.3 Sharing and Disclosure of data with Third Parties As required by law, '
                          'at times we might be required to disclose your personal information including personal, '
                          'transactional and financial information to relevant regulatory, '
                          'and governmental authorities and also to our advisors such as law firms and audit firms'
                          ' while responding to request from the regulatory authorities. In some cases,'
                          ' when we believe that such disclosure is necessary to protect our rights, or the rights of others, '
                          'or to comply with a judicial proceeding, court order, '
                          'or legal process served on our website/app we would share such information pursuant to a lawful request from law enforcement agencies.',
                    ),
                    const SizedBox(height: 10),
                    _buildExpansionTile(
                      '2. How do we use the information we collect:',
                      ' We may use, store and process the information provided by you to'
                          ' (1) improve the services offered through the Bsure.live App,'
                          ' (2) create and maintain a trusted and safe environment on Bsure.live (such as complying with our legal obligations and'
                          ' compliance with our policies) and'
                          ' (3) provide, personalise, measure and improve our products and services. The information collected through different channels,'
                          ' allows us to collect statistics about our website/App, usage and effectiveness, personalise your experience with you are on'
                          ' our website/App, as well as customize our interactions with you and to enhance the scope of the App Services. The following'
                          ' paragraphs describe in more detail how we use your personnel information.'
                          '   2.1 : Providing, understanding and improving service offered through the Bsure.live App: Any information provided by you'
                          ' will bw used for creating and updating your account and processing your transaction(s) or for any other purposes for which you have granted'
                          ' access to such information to us, base on your interaction with the Bsure.live App. To complete a financial transaction,'
                          ' we may share financial information (such as credit card details or other payment mode details) provided by you with authorised third-parties,'
                          ' for instance, our business partners, financial teams/institutions, or postal/government authorities involved in fulfilment of the said transactions,'
                          ' if any. this does not include any information collected from e-mails. in connection with a financial transaction, we may also contact you as'
                          ' part of our customer satisfaction surveys or for market research purposes. We may use the information collected to perform internal operations'
                          ' necessary to provide our services, including to troubleshoot software bugs ang operational problems, to conduct data analysis,'
                          ' testing and research and to monitor and analyse usage and activity trends. We process this personal information for these purposes given our'
                          ' legitimate interest in improving the App Services, we may from time to time, seek additional information from you. Any such collection of'
                          ' additional information and documents shall be subject to an explicit & purpose specific consent sought from all Users.'
                          '   2.2 : Safety,security and resolution of issues: we may use your personnel information , created as part of payment services availed by you'
                          ' to ensure that your access and use of payment services is in compliance with our legal obligations (such as anti-money laundering regulations).'
                          ' We may share such information ,with our advisors,third party service partners and providers for a seamless experience for you. We may use the'
                          ' information to create and maintain a safe environment and use the same to detect and prevent fraud, span, abuse,security incidents and other harmful'
                          ' activity. we use the information we collect ( including recordings of customer support calls) to assist you when you contact our customer support services'
                          ' to investigate and resolve your queries, monitor and improve our customer support responses. Certain online transactions may involve us calling you.'
                          ' this may also involve online chats. please be aware that it is our general practice to monitor and in some cases record such interactions for staff'
                          ' training or quality assurance purposes or to retain evidence of a particular transaction or interaction. We intend to protect your personal information'
                          ' and to maintain its accuracy as confirmed by you. We implement reasonable physical , administrative, and technical safeguards to help us protect your'
                          ' personal information from unauthorised access, use, and disclosure. For example, we encrypt all sensitive personal information such as account details,'
                          ' folio number, insurance ID etc. when we transmit such information over the internet . We also require that our commercial partners and vendors protect'
                          ' such information from unauthorised access, use, and disclosure. We blend security at multiple steps within our products with state of the art technology'
                          ' to ensure our systems maintain strong security measures. the overall data and privacy security design allows us defend our systems ranging from low hanging'
                          ' issue up to sophisticated attacks. you can read more about it here. we are committed to protecting your data as if it were our own. you can find more details'
                          ' here. if you are a security enthusiast or are a researcher and you have found a possible security vulnerability on Bsure products, We encourage you to report'
                          ' the issue to us responsibly. You could submit a report to us at suggestions@com.bsure with detailed steps required  to reproduce the vulnerability'
                          ' We shall put best of our efforts to investigate and fix the legitimate issues in a reasonable time frame, meanwhile,requesting you not to publicly disclose it.'
                          '  2.3:   Sharing and Disclosure of data with Third parties as required by law, at times we might be required to disclose your personal information'
                          ' including personal, transactional and financial information to relevant regulatory, and governmental authorities and also to our advisors such as law firms'
                          ' and audit firms while responding to request from the regulatory authorities. in some cases, when we believe that such disclosure is necessary to protect our'
                          ' rights, or the rights of others, or to comply with a judicial proceeding, court order, or legal process served on our website/App we would share such '
                          ' information pursuant to a lawful request from law enforcement agencies.'
                          ' You agree that:'
                          ' 1. Unless otherwise permitted by Bsure.live in writing, You may only possess one account.'
                          ' 2. Your use of the App shall not violate any applicable law or regulation.'
                          ' 3. Your use of the Bsure,live App, and Bsure.live Platforms shall be only for personal purposes.'
                          ' 4. All registration information you submit is truthful, complete and accurate and you agree to maintain accurate,complete and up-to-date account'
                          ' information in your account.'
                          ' 5. You are responsible for all activity that occurs under your account'
                          ' 6. You are responsible for maintaining the confidentiality of the access Bsure live credentials of your account and are fully responsible for all'
                          ' activities that occur under your account. you agree to immediately notify Bsure.live of any unauthorised use of your passcode or account or '
                          ' any other breach of security'
                          ' 7.  You agree that You are aware and responsible for all transactions taking place place through your account . you shall continue to be responsible'
                          ' for the transactions in your account , if you knowingly or negligently (i) grant any other person access to your BSure.live App,'
                          ' (ii) permit them to transact on your account, or (iii) transact on any other persons behalf or directions; whether by sharing one-time passwords'
                          ' or in any other manner'
                          ' 8. You shall not indulge in decompiling,reverse engineering,disassembling content, removing any intellectual property right associated with the Bsure.lib App'
                          ' including our copyright, trademarks, trades secrets,designs,and patents, or other property notices.'
                          ' 9. You shall not access or use the Bsure.live App in any manner that (i) may be harmful to the operation of the Bsure.live App,or its content;'
                          ' (ii) may be unlawful; (iii) may be harmful to Bsure.live or to any other user; (iv) may hinder the other Users enjoyment of the BSure.live App; or'
                          ' (v) to defraud other users, BSure.live or any Commercial partner,'
                          ' 10. You shall not post,distribute,or otherwise transmit or make available any software or other computer files that contain a virus,other harmful component'
                          ' or malicious component,or otherwise impair or damage the Bsure.live App or any connected network,or otherwise interfere with any person or entity'
                          ' enjoyment of the  Bsure.live App.'
                          ' 11. Your use of the Bsure.live App shall indicate that you have provided consent to automatically receive updates such as bug fixes, patches,enhanced functions'
                          ', missing plug-ins and new versions(collectively, Updates), for the purpose of effective delivery of the Bsure.live Services.please note that your continued use'
                          ' use of the BSure.live App following such updates would mean deemed acceptance by you of the same'
                          ' 12. You understand and accept that not all products.services and rewards offers on Bsure.live App Are available in all geographic areas and you may not be'
                          ' eligible for all the products,services and rewards offered by BSure.live on the BSure.live App or others Bsure.live Platforms.'
                          ' Bsure.live reserves the right to'
                          ' determine the availability and eligibility for any product, services and rewards offered on the BSure.live App or any Bsure.live platform'
                          ' 13, You shall request BSure.live,to block the account and change the passcode immediately for the account,if you device has been lost or stolen.\n'
                          'COPYRIGHT © 2022 BSURE.LIVE-All RIGHTS RESERVED',
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
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
                "Privacy Policy",
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
                'assets/animations/privacy_animation.json',
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
