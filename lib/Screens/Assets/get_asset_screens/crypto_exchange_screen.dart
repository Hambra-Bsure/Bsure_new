import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import '../../Repositary/Models/get_asset_models/crypto_exchange.dart';
import '../../Utils/DisplayUtils.dart';
import '../Update_asset_screens/Crypto_Exchnage_Edit.dart';
import '../post_asset_addition/CryptoExchange.dart';

class CryptoExchangeScreen extends StatefulWidget {
  final String assetType;

  const CryptoExchangeScreen({Key? key, required this.assetType})
      : super(key: key);

  @override
  _CryptoExchangeScreenState createState() => _CryptoExchangeScreenState();
}

class _CryptoExchangeScreenState extends State<CryptoExchangeScreen> {
  List<CryptoExchange> cryptoExchanges = [];
  bool isLoading = false;
  final String category = 'CryptoExchange';

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    setState(() {
      isLoading = true;
    });

    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    if (token == null) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Token is missing. Please login again.'),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    final url =
        Uri.parse('http://43.205.12.154:8080/v2/asset/category/CryptoExchange');
    final response = await http.get(url, headers: {
      "Authorization": token,
      "ngrok-skip-browser-warning": "69420",
    });

    if (response.statusCode == 200) {
      final data = CryptoExchangeResponse.fromJson(jsonDecode(response.body));
      if (data.success) {
        setState(() {
          cryptoExchanges = data.assets;
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
          content: Text('Failed to fetch data'),
          duration: Duration(seconds: 3),
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> deleteAssetStatus(int index) async {
    final cryptoExchange = cryptoExchanges[index];
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
        'http://43.205.12.154:8080/v2/asset/${cryptoExchange.assetId}',
      );

      if (response.statusCode == 200) {
        DisplayUtils.showToast("CryptoExchange successfully deleted.");

        setState(() {
          cryptoExchanges.removeAt(index);
        });
      } else {
        DisplayUtils.showToast("Failed to delete CryptoExchange.");
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text('Crypto exchange', style: TextStyle(color: Colors.white)),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : cryptoExchanges.isEmpty
              ? const Center(
                  child:
                      Text("No assets found", style: TextStyle(fontSize: 20.0)))
              : ListView.builder(
                  itemCount: cryptoExchanges.length,
                  itemBuilder: (context, index) {
                    final cryptoExchange = cryptoExchanges[index];
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
                                  icon: const Icon(Icons.edit,
                                      color: Color(0xff429bb8)),
                                  onPressed: () async {
                                    final updatedCryptoExchange =
                                        await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CryptoExchangeEdit(
                                          cryptoexchange: cryptoExchange,
                                          assetType: category,
                                        ),
                                      ),
                                    );
                                    if (updatedCryptoExchange != null) {
                                      setState(() {
                                        cryptoExchanges[index] =
                                            updatedCryptoExchange;
                                      });
                                    }
                                  },
                                ),
                              ],
                            ),
                            buildInfoRow(
                                'Exchange name: ', cryptoExchange.exchangeName),
                            const SizedBox(height: 8.0),
                            buildInfoRow('Account number: ',
                                cryptoExchange.accountNumber),
                            const SizedBox(height: 8.0),
                            buildInfoRow('Wallet address: ',
                                cryptoExchange.walletAddress),
                            const SizedBox(height: 8.0),
                            buildInfoRow('Comments: ', cryptoExchange.comments),
                            const SizedBox(height: 8.0),
                            buildInfoRow(
                                'Attachment: ', cryptoExchange.attachment),
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
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          onPressed: () async {
                                            Navigator.of(context).pop();
                                            deleteAssetStatus(index);
                                            List<CryptoExchange>
                                                newCryptoExchanges =
                                                <CryptoExchange>[];
                                            newCryptoExchanges
                                                .addAll(cryptoExchanges);
                                            newCryptoExchanges.removeAt(index);
                                            setState(() {
                                              cryptoExchanges =
                                                  newCryptoExchanges;
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CryptoExchangeAdd(assetType: category),
            ),
          );
        },
        label: const Text(
          'Add New',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        icon: const Icon(Icons.add, size: 24, color: Colors.white),
        backgroundColor: const Color(0xff429bb8),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
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
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            flex: 7,
            child: Text(
              value ?? '',
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
