import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Repositary/Models/Digital_will/Digitalwill_get_res.dart';
import '../../Repositary/Retrofit/node_api_client.dart';
import '../Digitalwill_mainscreen.dart';

class DigitalWillScreen extends StatefulWidget {
  const DigitalWillScreen({super.key});

  @override
  _DigitalWillScreenState createState() => _DigitalWillScreenState();
}

class _DigitalWillScreenState extends State<DigitalWillScreen> {
  late Future<DigitalwillgetResponse> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = fetchData();
  }

  Future<DigitalwillgetResponse> fetchData() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    print("token is");
    print(token);
    Dio dio = Dio();
    dio.options.headers["Authorization"] = token;
    NodeClient nodeClient = NodeClient(dio);


    try {
      var response = await nodeClient.digitalWillGetData(token.toString());
      print(jsonEncode(response));
      return response;
    } catch (e) {
      if (e is DioError) {
        if (e.response?.statusCode == 403) {
        } else if (e.response?.statusCode == 404) {
        } else {}
      } else {}
      rethrow;
    }
  }

  // Function to show a dialog for editing percentage
  Future<void> editPercentage(BuildContext context, String currentPercentage,
      Function(String) onPercentageUpdated) async {
    TextEditingController percentageController =
        TextEditingController(text: currentPercentage);

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Percentage'),
          content: TextFormField(
            controller: percentageController,
            keyboardType:
                TextInputType.number, // Assuming percentage is a number
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Pass the updated percentage to the callback function
                onPercentageUpdated(percentageController.text);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Digitalwill list',
            style: TextStyle(color: Colors.white)),
      ),
      body: FutureBuilder<DigitalwillgetResponse>(
        future: _futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text("Error: ${getErrorText(snapshot.error)}"));
          } else {
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.assets?.length ?? 0,
              itemBuilder: (context, index) {
                final asset = data.assets![index];
                bool hasNonZeroShare =
                    asset.nominees!.any((nominee) => nominee.share != 0);

                return Card(
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (hasNonZeroShare)
                        Center(
                          child: Text(
                            "${asset.assetName}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      if (hasNonZeroShare)
                        Center(
                          child: Text(
                            "Account No: ${asset.assetIdentity}",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      if (hasNonZeroShare) const Divider(),
                      ...(asset.nominees ?? [])
                          .where((nominee) => nominee.share != 0)
                          .map((nominee) {
                        return ListTile(
                          title: Text(
                            "${nominee.name}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text("Share: ${nominee.share}"),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () async {
                                  await editPercentage(
                                    context,
                                    nominee.share.toString(),
                                    (updatedPercentage) {
                                      setState(() {
                                        nominee.share =
                                            double.parse(updatedPercentage);
                                      });
                                    },
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () async {
                                  //  write delete will conditiion
                                },
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AppWidget()),
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

  String getErrorText(dynamic error) {
    if (error is DioError) {
      if (error.response?.statusCode == 404) {
        return "Assets not found.";
      } else if (error.response?.statusCode == 403) {
        return "User does not have permission.";
      } else {
        return "Failed to fetch data. Please try again.";
      }
    } else {
      return "Unexpected error occurred. Please try again.";
    }
  }
}
