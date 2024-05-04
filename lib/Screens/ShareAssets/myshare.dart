import 'package:flutter/material.dart';

// Define a class to represent bank information
class BankInfo {
  final String bankName;
  final String branchName;
  final String accountType;

  BankInfo(this.bankName, this.branchName, this.accountType);
}

// Define sample bank data
List<BankInfo> sampleBankInfo = [
  BankInfo('Bank 1', 'Branch A', 'Saving'),
  BankInfo('Bank 2', 'Branch B', 'Current'),
  BankInfo('Bank 3', 'Branch C', 'Saving'),
  BankInfo('Bank 4', 'Branch D', 'Current'),
];

// Define the ShareAssetsScreen widget
class ShareAssets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share Bank Information'),
      ),
      body: ListView.builder(
        itemCount: sampleBankInfo.length,
        itemBuilder: (context, index) {
          BankInfo bankInfo = sampleBankInfo[index];
          return Card(
            child: ListTile(
              title: Text(bankInfo.bankName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Branch: ${bankInfo.branchName}'),
                  Text('Account Type: ${bankInfo.accountType}'),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement functionality to share bank information
          _showShareDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Function to show a dialog for sharing bank information
  void _showShareDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Share Bank Information'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Bank Name'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Branch Name'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Account Type'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Implement functionality to share the bank information
                // Add the shared bank information to the sampleBankInfo list
                sampleBankInfo.add(BankInfo('New Bank', 'New Branch', 'New Account Type'));
                Navigator.of(context).pop();
              },
              child: Text('Share'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

// Call this screen from your main.dart or wherever appropriate
