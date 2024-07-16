import 'dart:convert';
import 'package:Bsure_devapp/Screens/Assets/post_asset_addition/stock_brokers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Repositary/Models/get_asset_models/stock_broker.dart';
import '../../Utils/DisplayUtils.dart';
import '../Update_asset_screens/Stock_Broker_Edit.dart';

class StockBrokerScreen extends StatefulWidget {
  final String assetType;

  const StockBrokerScreen({super.key, required this.assetType});

  @override
  _StockBrokerScreenState createState() => _StockBrokerScreenState();
}

class _StockBrokerScreenState extends State<StockBrokerScreen> {
  List<StockBroker> stockbrokers = [];
  bool isLoading = false;

  final String category = 'StockBroker';

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
    var token = prefs.get("token");

    final url =
    Uri.parse('https://dev.bsure.live/v2/asset/category/StockBroker');
    final response = await http.get(url, headers: {
      "Authorization": token.toString(),
      "ngrok-skip-browser-warning": "69420",
    });

    if (response.statusCode == 200) {
      final data = StockBrokerResponse.fromJson(jsonDecode(response.body));
      if (data.success) {
        setState(() {
          stockbrokers = data.assets;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(data.message),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to fetch StockBrokers'),
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
        const Text('Stock broker', style: TextStyle(color: Colors.white)),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : stockbrokers.isEmpty
          ? const Center(
        child: Text("No assets found",
          style: TextStyle(fontSize: 20.0),
        ),
      )
          : ListView.builder(
        itemCount: stockbrokers.length,
        itemBuilder: (context, index) {
          final broker = stockbrokers[index];
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
                        icon: const Icon(Icons.edit,color: Color(0xff429bb8)),
                        onPressed: () async {
                          final updatedBroker = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StockBrokerEdit(
                                broker: broker,
                                assetType: widget.assetType,
                              ),
                            ),
                          );
                          if (updatedBroker != null) {
                            setState(() {
                              final index = stockbrokers.indexWhere(
                                      (element) =>
                                  element.assetId ==
                                      updatedBroker.assetId);
                              if (index != -1) {
                                stockbrokers[index] = updatedBroker;
                              }
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  buildInfoRow('Broker name:', broker.brokerName),
                  const SizedBox(height: 8.0),
                  buildInfoRow('Demat account number:', broker.dematAccountNumber),
                  const SizedBox(height: 8.0),
                  buildInfoRow('Comments:', broker.comments),
                  const SizedBox(height: 8.0),
                  buildInfoRow('Attachment:', broker.attachment),
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
                                  List<StockBroker> newStockBrokers =
                                  <StockBroker>[];
                                  newStockBrokers
                                      .addAll(stockbrokers);
                                  newStockBrokers.removeAt(index);
                                  setState(() {
                                    stockbrokers = newStockBrokers;
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
              builder: (context) => StockBrokerAdd(
                assetType: category,
              ),
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
    final stockBroker = stockbrokers[index];
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
        'https://dev.bsure.live/v2/asset/${stockBroker.assetId}',
      );

      if (response.statusCode == 200) {
        DisplayUtils.showToast("Stock Broker successfully deleted.");
      }
    } catch (e) {}
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
