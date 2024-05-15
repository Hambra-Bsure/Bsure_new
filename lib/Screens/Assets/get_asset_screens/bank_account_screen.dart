import 'dart:convert';
import 'package:Bsure_devapp/Screens/Assets/post_asset_addition/BankAccount.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/get_asset_models/bank_account.dart';
import '../../Utils/DisplayUtils.dart';
import '../Update_asset_screens/Bank_Account_Edit.dart';

class BankAccountsScreen extends StatefulWidget {
  // static const routeName = '/bankAccounts'; // Define the route name

  final String assetType;
  final BankAccount? updatedAccount;

  const BankAccountsScreen(
      {super.key, required this.assetType, this.updatedAccount});

  @override
  _BankAccountsScreenState createState() => _BankAccountsScreenState();
}

class _BankAccountsScreenState extends State<BankAccountsScreen> {
  List<BankAccount> bankAccounts = <BankAccount>[];
  bool isLoading = false;

  // Define a variable to hold the category name
  final String category =
      'BankAccount'; // Assuming the category is 'BankAccount'

  @override
  void initState() {
    super.initState();
    if (widget.updatedAccount != null) {
      setState(() {
        bankAccounts.add(widget.updatedAccount!);
      });
    }
    getData();
  }

  Future<void> getData() async {
    setState(() {
      isLoading = true;
    });

    final prefs = await SharedPreferences.getInstance();
    var token = prefs.get("token");

    final url =
        Uri.parse('http://43.205.12.154:8080/v2/asset/category/BankAccount');
    final response = await http.get(url, headers: {
      "Authorization": token.toString(),
      "ngrok-skip-browser-warning": "69420",
    });

    if (response.statusCode == 200) {
      final data = BankResponse.fromJson(jsonDecode(response.body));
      if (data.success) {
        setState(() {
          bankAccounts = data.assets;
          isLoading = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(data.message),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to fetch bank accounts'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title:
            const Text('Bank Account', style: TextStyle(color: Colors.white)),
      ),
      body: isLoading
          ? const Center(child: Text("No Assets found"))
          : bankAccounts.isNotEmpty
              ? ListView.builder(
                  itemCount: bankAccounts.length,
                  itemBuilder: (context, index) {
                    final account = bankAccounts[index];
                    return Card(
                        color: Colors.white,
                        child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () async {
                                    final updatedAccount = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BankAccountEdit(
                                          account: account,
                                          assetType: category,
                                        ),
                                      ),
                                    );
                                    if (updatedAccount != null) {
                                      setState(() {
                                        bankAccounts[index] = updatedAccount;
                                      });
                                    }
                                  },
                                ),
                              ],
                            ),
                            Text(
                              'Bank Name: ${account.bankName}',
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                                'Account Number: ${account.accountNumber ?? ""}'),
                            const SizedBox(height: 8.0),
                            Text('IFSC Code: ${account.ifscCode ?? ""}'),
                            const SizedBox(height: 8.0),
                            Text('Branch Name: ${account.branchName}'),
                            const SizedBox(height: 8.0),
                            Text('Account Type: ${account.accountType}'),
                            const SizedBox(height: 8.0),
                            Text('Comments: ${account.comments}'),
                            const SizedBox(height: 8.0),
                            Text('Attachment: ${account.attachment}'),
                            const SizedBox(height: 8.0),
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Delete Asset?"),
                                      content: const Text(
                                          "Are you sure you want to delete this Asset?"),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text(
                                            "Cancel",
                                            style: TextStyle(
                                              color: Color(0xff429bb8),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: const Text(
                                            "Confirm",
                                            style: TextStyle(
                                              color: Colors.red,
                                            ),
                                          ),
                                          onPressed: () async {
                                            Navigator.of(context).pop();
                                            deleteAssetStatus(index);
                                            List<BankAccount> newBankAccounts =
                                                <BankAccount>[];
                                            newBankAccounts
                                                .addAll(bankAccounts);
                                            newBankAccounts.removeAt(index);
                                            setState(() {
                                              bankAccounts = newBankAccounts;
                                            });
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                backgroundColor: const Color(0xff429bb8),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.delete, color: Colors.white),
                                  SizedBox(width: 5),
                                  Text("Delete",
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
                          ]),
                    ));
                  },
                )
              : const Center(
                  child: Text(
                    'No bank accounts found',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BankAccountAdd(
                assetType: category,
              ),
            ),
          );
          getData();
        },
        label: const Text(
          'Add New',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        icon: const Icon(
          Icons.add,
          size: 24,
          color: Colors.white,
        ),
        backgroundColor: const Color(0xff429bb8),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  Future<void> deleteAssetStatus(int index) async {
    final bankAccount = bankAccounts[index];
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (token == null) {
      // Handle token absence or expiration here
      return;
    }

    final dio = Dio();
    dio.options.headers["Authorization"] = token;

    try {
      final response = await dio.delete(
        'http://43.205.12.154:8080/v2/asset/${bankAccount.assetId}',
      );

      if (response.statusCode == 200) {
        DisplayUtils.showToast("Asset successfully deleted.");
      }
    } catch (e) {
      //DisplayUtils.showToast("API failure");
    }
  }
}
