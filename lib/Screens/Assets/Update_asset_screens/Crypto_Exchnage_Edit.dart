import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/get_asset_models/crypto_exchange.dart';
import '../../Utils/DisplayUtils.dart';
import '../get_asset_screens/crypto_exchange_screen.dart';

class CryptoExchangeEdit extends StatefulWidget {
  final CryptoExchange cryptoexchange;
  final String assetType;

  const CryptoExchangeEdit({Key? key, required this.cryptoexchange, required this.assetType}) : super(key: key);

  @override
  State<CryptoExchangeEdit> createState() => _CryptoExchangeEditState();
}

class _CryptoExchangeEditState extends State<CryptoExchangeEdit> {
  late String exchangeName;
  late String accountNumber;
  late String walletAddress;
  late String comments;
  late String attachment;

  @override
  void initState() {
    super.initState();
    // Initialize the local variables with the current values
    exchangeName = widget.cryptoexchange.exchangeName;
    accountNumber = widget.cryptoexchange.accountNumber;
    walletAddress = widget.cryptoexchange.walletAddress;
    comments = widget.cryptoexchange.comments;
    attachment = widget.cryptoexchange.attachment;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Edit Crypto Exchange', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              initialValue: exchangeName,
              decoration: const InputDecoration(labelText: 'Exchange Name'),
              onChanged: (value) {
                setState(() {
                  exchangeName = value;
                });
              },
            ),
            TextFormField(
              initialValue: accountNumber,
              decoration: const InputDecoration(labelText: 'Account Number'),
              onChanged: (value) {
                setState(() {
                  accountNumber = value;
                });
              },
            ),
            TextFormField(
              initialValue: walletAddress,
              decoration: const InputDecoration(labelText: 'Wallet Address'),
              onChanged: (value) {
                setState(() {
                  walletAddress = value;
                });
              },
            ),
            TextFormField(
              initialValue: comments,
              decoration: const InputDecoration(labelText: 'Comments'),
              onChanged: (value) {
                setState(() {
                  comments = value;
                });
              },
            ),
            TextFormField(
              initialValue: attachment,
              decoration: const InputDecoration(labelText: 'Attachment'),
              onChanged: (value) {
                setState(() {
                  attachment = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                // Update the BankAccount object with the new values
                final updatedcryptoexchange = CryptoExchange(
                  exchangeName: exchangeName,
                  accountNumber: accountNumber,
                  walletAddress: walletAddress,
                  comments: comments,
                  attachment: attachment,
                  assetId: widget.cryptoexchange.assetId,
                  category: widget.assetType,
                );

                // Call API to update bank account details
                final response = await updatecryptoexchange(updatedcryptoexchange);
                DisplayUtils.showToast('Asset Updated Successfully');

                Navigator.pop(context);
                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => CryptoExchangeScreen(
                      assetType: widget.assetType,
                    ),
                  ),
                );
                if (response != null) {

                } else {
                }
              },
              child: const Text('Update'),
            ),

          ],
        ),
      ),
    );
  }

  Future<CryptoExchange?> updatecryptoexchange(CryptoExchange cryptoExchange) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (token == null) {
      // Handle token absence or expiration here
      return null;
    }

    final dio = Dio();
    dio.options.headers["Authorization"] = token; // Add token to headers

    try {
      final response = await dio.put(
        'http://43.205.12.154:8080/v2/asset/${cryptoExchange.assetId}',
        data: cryptoExchange.toJson(), // Convert account object to JSON and send as request body
      );

      if (response.statusCode == 200) {
        // Parse and return updated bank account details
        return CryptoExchange.fromJson(jsonDecode(response.data));
      } else {
        return null; // Return null if update fails
      }
    } catch (e) {
      print(e);
      return null; // Return null if an error occurs
    }
  }
}
