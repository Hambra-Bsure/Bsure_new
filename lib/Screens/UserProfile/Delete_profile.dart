import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';
import '../Repositary/Retrofit/node_api_client.dart';
import '../Utils/SharedPrefHelper.dart';

class AccountDeletionScreen extends StatelessWidget {
  const AccountDeletionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text(
          'Account Deletion',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        primary: false, // Set primary to false to avoid unnecessary padding
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Are you sure you want to delete your account?',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  // Show confirmation dialog
                  _showConfirmationDialog(context);
                },
                icon: const Icon(Icons.delete),
                label: const Text('Delete Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showConfirmationDialog(BuildContext context) async {
    String deletionReason = '';

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Confirm Account Deletion !',
            style: TextStyle(fontSize: 20),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 5),
                TextField(
                  decoration:
                      const InputDecoration(labelText: 'Reason for deletion'),
                  onChanged: (value) {
                    deletionReason = value;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff429bb8),
              ),
              child: const Text('Yes', style: TextStyle(color: Colors.white)),
              onPressed: () {
                if (deletionReason.isNotEmpty) {
                  // Perform the account deletion logic
                  _deleteAccount(context, deletionReason);
                } else {
                  // Show error or request a reason
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('Please provide a reason for Account deletion.'),
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteAccount(
      BuildContext context, String deletionReason) async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.get("token");
    Dio dio = Dio(); // Create a Dio instance
    dio.options.headers['Authorization'] = token;
    final client = NodeClient(dio);
    try {
     // var response = await client.deleteAccount(token.toString());
     // print(response);
      _showDeletionSuccessDialog(context);
    } catch (e) {
      // Handle API failure
      // DisplayUtils.showToast("API failure");
    }
  }

  void _showDeletionSuccessDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Account Deleted'),
          content: const Text('Your account has been successfully deleted.'),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Change button color to blue
              ),
              child: const Text('OK'),
              onPressed: () {
                SharedPrefHelper.logout();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SplashScreen(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
