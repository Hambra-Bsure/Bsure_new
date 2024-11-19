import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../LoginScreen.dart';
import '../../Repositary/Models/get_asset_models/bank_account.dart';
import '../../Utils/DisplayUtils.dart';
import '../Update_asset_screens/Bank_Account_Edit.dart';
import '../post_asset_addition/BankAccount.dart';

class BankAccountsScreen extends StatefulWidget {
  final String assetType;
  final BankAccount? updatedAccount;

  const BankAccountsScreen(
      {super.key, required this.assetType, this.updatedAccount});

  @override
  _BankAccountsScreenState createState() => _BankAccountsScreenState();
}

class _BankAccountsScreenState extends State<BankAccountsScreen> {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  List<BankAccount> bankAccounts = <BankAccount>[];
  bool isLoading = false;

  final String category = 'BankAccount';

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
    var token = prefs.getString("token");

    if (token == null || token.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Token'),
          content: const Text('Please log in again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    final url =
        Uri.parse('https://dev.bsure.live/v2/asset/category/BankAccount');
    final response = await http.get(url, headers: {
      "Authorization": token,
      "ngrok-skip-browser-warning": "69420",
    });

    if (response.statusCode == 200) {
      final data = BankResponse.fromJson(jsonDecode(response.body));
      if (data.success) {
        if (mounted) {
          setState(() {
            bankAccounts = data.assets;
            isLoading = false;
          });
        }
      } else {
        if (mounted) {
          scaffoldMessengerKey.currentState?.showSnackBar(
            SnackBar(
              content: Text(data.message),
              duration: const Duration(seconds: 3),
            ),
          );
        }
        setState(() {
          isLoading = false;
        });
      }
    } else {
      if (mounted) {
        scaffoldMessengerKey.currentState?.showSnackBar(
          const SnackBar(
            content: Text('Failed to fetch bank accounts'),
            duration: Duration(seconds: 3),
          ),
        );
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff429bb8),
          title:
              const Text('Bank account', style: TextStyle(color: Colors.white)),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : bankAccounts.isEmpty
                ? const Center(
                    child: Text(
                      "No assets found",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  )
                : ListView.builder(
                    itemCount: bankAccounts.length,
                    itemBuilder: (context, index) {
                      final account = bankAccounts[index];
                      return Card(
                        elevation: 2.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit,
                                        color: Color(0xff429bb8)),
                                    onPressed: () async {
                                      final updatedAccount =
                                          await Navigator.push(
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
                              buildInfoRow('Bank name:', account.bankName),
                              buildInfoRow('Account number:',
                                  account.accountNumber ?? ""),
                              buildInfoRow(
                                  'IFSC code:', account.ifscCode ?? ""),
                              buildInfoRow('Branch name:', account.branchName),
                              buildInfoRow(
                                  'Account type:', account.accountType),
                              buildInfoRow('Comments:', account.comments),
                              buildInfoRow('Attachment:', account.attachment),
                              const SizedBox(height: 8.0),
                              ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Delete asset?"),
                                        content: const Text(
                                            "Are you sure you want to delete this Asset?"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  color: Color(0xff429bb8)),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: const Text(
                                              "Confirm",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                            onPressed: () async {
                                              Navigator.of(context).pop();
                                              await deleteAssetStatus(index);
                                              List<BankAccount>
                                                  newBankAccounts =
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
                            ],
                          ),
                        ),
                      );
                    },
                  ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            final newAccount = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BankAccountAdd(assetType: category),
              ),
            );
            if (newAccount != null) {
              setState(() {
                bankAccounts.add(newAccount);
              });
            }
            getData();
          },
          label: const Text(
            'Add New',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          icon: const Icon(Icons.add, size: 24, color: Colors.white),
          backgroundColor: const Color(0xff429bb8),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }

  Widget buildInfoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              //overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            flex: 7,
            child: Text(
              value ?? '',
              // overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> deleteAssetStatus(int index) async {
    final bankAccount = bankAccounts[index];
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (token == null || token.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Token'),
          content: const Text('Please log in again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    final dio = Dio();
    dio.options.headers["Authorization"] = token;

    try {
      final response = await dio.delete(
        'https://dev.bsure.live/v2/asset/${bankAccount.assetId}',
      );

      if (response.statusCode == 200) {
        if (mounted) {
          DisplayUtils.showToast("Asset successfully deleted.");
          setState(() {
            bankAccounts.removeAt(index);
          });
        }
      } else {
        if (mounted) {
          scaffoldMessengerKey.currentState?.showSnackBar(
            const SnackBar(
              content: Text('Failed to delete the asset.'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        scaffoldMessengerKey.currentState?.showSnackBar(
          const SnackBar(
            content: Text('Error occurred while deleting the asset.'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }
}
