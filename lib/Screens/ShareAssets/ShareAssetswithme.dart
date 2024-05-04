import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Repositary/Models/Share_assets/Shareasset_withme_res.dart';
import '../Repositary/Retrofit/node_api_client.dart';

class Shareassetwithme extends StatefulWidget {
  const Shareassetwithme({Key? key}) : super(key: key);

  @override
  _ShareassetwithmeState createState() => _ShareassetwithmeState();
}

class _ShareassetwithmeState extends State<Shareassetwithme> {
  late NodeClient nodeClient;
  late ShareAssetswithmeResponse shareAssetsResponse;
  bool isLoading = true;
  String? selectedUserName;
  var height = 0.0;
  var width = 0.0;

  @override
  void initState() {
    super.initState();
    Dio dio = Dio();
    nodeClient = NodeClient(dio);
    shareAssetsResponse = ShareAssetswithmeResponse(
        assetDetailsList: []); // Initialize with an empty list
    _getSharedAssets();
  }

  Future<void> _getSharedAssets() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");
      ShareAssetswithmeResponse response =
          await nodeClient.getSharedAssetswithme(token!);
      setState(() {
        shareAssetsResponse = response;
        isLoading = false;
        print(jsonEncode(response));
        if (response.assetDetailsList != null &&
            response.assetDetailsList!.isNotEmpty) {
          // Set the initial selected user
          selectedUserName = response.assetDetailsList![0].userName;
        }
      });
    } catch (e) {
      print('Error fetching shared assets: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text(
          'Shared Assets with me',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : shareAssetsResponse != null && shareAssetsResponse.success == true
              ? Column(
                  children: [
                    // Dropdown for selecting usernames
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        value: selectedUserName,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedUserName = newValue;
                          });
                        },
                        items: shareAssetsResponse.assetDetailsList!
                            .map((assetDetails) {
                          return DropdownMenuItem<String>(
                            value: assetDetails.userName,
                            child: Text(assetDetails.userName ?? 'N/A'),
                          );
                        }).toList(),
                      ),
                    ),
                    // Display assets based on the selected user
                    _buildAssetList(selectedUserName),
                  ],
                )
              : const Center(
                  child: Text('Failed to fetch shared assets'),
                ),
    );
  }

  Widget _buildAssetList(String? userName) {
    if (userName == null) {
      return const Center(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('No user selected.please select user in dropdown'),
      ));
    }

    List<AssetDetails> selectedUserAssets = shareAssetsResponse!
        .assetDetailsList!
        .where((asset) => asset.userName == userName)
        .toList();

    return selectedUserAssets.isEmpty
        ? const Center(
            child: Text('No assets shared for the selected user.'),
          )
        : Expanded(
            child: ListView.builder(
              itemCount: selectedUserAssets.length,
              itemBuilder: (context, index) {
                AssetDetails assets = selectedUserAssets[index];
                return Column(
                  children: [
                    Container(
                      width: width,
                      margin: const EdgeInsets.all(8),
                      color: const Color(0xff429bb8),
                      child: Column(
                        children: [
                          Text(
                            'User Name: ${assets.userName ?? 'N/A'}',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                          Text(
                            'User Mobile: ${assets.mobileNumber ?? 'N/A'}',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    _buildAssetCard(assets.assetDataList!),
                    const SizedBox(height: 16),
                  ],
                );
              },
            ),
          );
  }

  Widget _buildAssetCard(List<Map<String, dynamic>> assetData) {
    List<Widget> children = [];
    for (var entry in assetData) {
      List<Widget> entryWidgets = []; // Initialize an empty list for each entry

      if (entry['uaiValue'] != null) {
        var value = entry['uaiValue'];
        for (var entry1 in value) {
          entryWidgets.add(Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  '${entry1['displayName']}:',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  '${entry1['uaiValue']}',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ));
        }
      }

      children.add(
        Card(
          elevation: 3,
          margin: const EdgeInsets.all(8),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: entryWidgets, // Use the entryWidgets list here
            ),
          ),
        ),
      );
    }

    return Column(
      children: children,
    );
  }
}
