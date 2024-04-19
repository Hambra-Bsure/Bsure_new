// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../../main.dart';
import '../Utils/SharedPrefHelper.dart';
import 'About_us.dart';
import 'AccountDeleteScreen.dart';
import 'Contact_Us_screen.dart';
import 'FAQ.dart';
import 'Privacy_policy.dart';
import 'ReferralPolicy_screen.dart';
import 'Refund_policy.dart';
import 'Terms_of_use.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildProfileHeader(),
          _buildMenuItem(
              icon: Icons.share,
              title: 'Share',
              onTap: () => Share.share('https://com.bsure/')),
          // _buildMenuItem(
          //     icon: Icons.person,
          //     title: 'Edit Profile',
          //     onTap: () => _navigateTo(context,
          //         const ProfileScreen())),
          _buildMenuItem(
            icon: Icons.account_circle,
            title: 'About Us',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AboutUs()),
              );
            },
          ),
          _buildMenuItem(
            icon: Icons.contact_mail,
            title: 'Terms of Use',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const TermsOfUse()),
              );
            },
          ),
          _buildMenuItem(
            icon: Icons.privacy_tip_sharp,
            title: 'Privacy Policy',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const PrivacyPolicyScreen()),
              );
            },
          ),
          _buildMenuItem(
            icon: Icons.currency_exchange,
            title: 'Refund Policy',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const RefundPolicy()),
              );
            },
          ),
          _buildMenuItem(
            icon: Icons.forum,
            title: 'Referral Policy',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ReferralPolicy()),
              );
            },
          ),
          _buildMenuItem(
            icon: Icons.delete,
            title: 'Account Deletion',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const AccountDeletionScreen()),
              );
            },
          ),
          _buildMenuItem(
            icon: Icons.quiz_outlined,
            title: 'FAQ',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const FAQ()),
              );
            },
          ),
          _buildMenuItem(
            icon: Icons.contact_mail,
            title: 'Contact Us',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ContactUsScreen()),
              );
            },
          ),
          _buildMenuItem(
              icon: Icons.logout,
              title: 'Log Out',
              onTap: () => _showLogoutConfirmationDialog(context)),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: ClipOval(
        child: Container(
          color: const Color(0xff429bb8),
          padding: const EdgeInsets.all(8),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis),
      ),
      onTap: onTap,
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      color: const Color(0xff429bb8),
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: const Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 50,
          child: Icon(
            Icons.account_circle,
            size: 100,
            color: Color(0xff429bb8),
          ),
        ),
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget destination) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => destination));
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Logout!"),
        content: const Text("Confirm to Logout!"),
        actions: <Widget>[
          _buildDialogButton(
            onPressed: () {
              SharedPrefHelper.logout();
              _navigateTo(context, const SplashScreen());
            },
            label: "Yes",
          ),
          _buildDialogButton(
            onPressed: () => Navigator.pop(context),
            label: "No",
          ),
        ],
      ),
    );
  }

  Widget _buildDialogButton(
      {required VoidCallback onPressed, required String label}) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.all(14),
        child: Text(
          label,
          style: TextStyle(
            //color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
