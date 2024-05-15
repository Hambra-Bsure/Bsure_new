import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Repositary/Models/Share_assets/my_share_asset_res.dart';
import '../Utils/DisplayUtils.dart';

class MyAssetsScreen extends StatefulWidget {
  const MyAssetsScreen({Key? key}) : super(key: key);

  @override
  _MyAssetsScreenState createState() => _MyAssetsScreenState();
}

class _MyAssetsScreenState extends State<MyAssetsScreen> {
  MyShareAssetsResponse? myShareAssetsResponse;
  bool isLoading = true;
  Map<int, List<String>> selectedNomineesMap = {};

  @override
  void initState() {
    super.initState();
    _getSharedAssets();
  }

  Future<void> _getSharedAssets() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");

      final dio = Dio();
      dio.options.headers["Authorization"] = token;
      const url = 'http://43.205.12.154:8080/v2/share/by-me';

      final response = await dio.get(
        url,
        options: Options(
          headers: {
            "ngrok-skip-browser-warning": "69420",
          },
        ),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data ?? {};
        myShareAssetsResponse = MyShareAssetsResponse.fromJson(data);

        for (var asset in myShareAssetsResponse!.assets) {
          selectedNomineesMap[asset.id] = asset.nominees
              .map((nominee) => '${nominee.firstName} ${nominee.lastName}')
              .toList();
        }

        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        print('Failed to fetch shared assets: ${response.statusCode}');
        print(response.data);
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Failed to fetch shared assets: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text(
          'My Shared Assets',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: isLoading
          ? const Center(
          child: Center(child: Text("Assets are not shared with anyone")))
          : myShareAssetsResponse != null &&
          myShareAssetsResponse!.success == true
          ? _buildAssetsList()
          : const Center(
        child: Text('Failed to fetch shared assets'),
      ),
    );
  }

  Widget _buildAssetsList() {
    return Card(
      color: Colors.lightBlue,
      child: ListView.builder(
        itemCount: myShareAssetsResponse!.assets.length,
        itemBuilder: (context, index) {
          final asset = myShareAssetsResponse!.assets[index];
          selectedNomineesMap.putIfAbsent(asset.id, () => []);

          return Visibility(
            visible: !_checkAssetDeleted(asset.id),
            child: Card(
              color: Colors.white,
              elevation: 3,
              margin: const EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Text(
                        asset.category,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    ..._buildDetailsList(asset.details),
                    const Divider(),
                    for (var nominee in asset.nominees)
                      CheckboxListTile(
                        title: Text(
                          '${nominee.firstName} ${nominee.lastName}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        value: selectedNomineesMap[asset.id]!
                            .contains('${nominee.firstName} ${nominee.lastName}'),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value != null) {
                              if (value) {
                                _updateNomineeSelection(
                                    asset.id, nominee.sharedAssetId);
                              } else {
                                _updateNomineeSelection(
                                    asset.id, nominee.sharedAssetId);
                              }
                            }
                          });
                        },
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _updateNomineeSelection(int assetId, int sharedAssetId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");

      final dio = Dio();
      dio.options.headers["Authorization"] = token;

      final url = 'http://43.205.12.154:8080/v2/share/$sharedAssetId';

      final response = await dio.delete(
        url,
        options: Options(
          headers: {
            "ngrok-skip-browser-warning": "69420",
          },
        ),
      );

      if (response.statusCode == 200) {
        // Nominee unsharing successful
        // Check if all nominees of this asset are unshared
        final allUnshared = _checkAllUnshared(assetId);
        if (allUnshared) {
          // Prompt for confirmation before deleting the asset
          _promptAssetDeletionConfirmation(assetId);
        }
      } else {
        print('Failed to unshare nominee: ${response.statusCode}');
        print(response.data);
        // Handle error
      }
    } catch (e) {
      print('Failed to unshare nominee: $e');
      // Handle error
    }
  }

  void _promptAssetDeletionConfirmation(int assetId) {
    showDialog(
      context: context,
      builder: (context) {
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
                _deleteAsset(assetId);
              },
            ),
          ],
        );
      },
    );
  }


  bool _checkAllUnshared(int assetId) {
    // Check if all nominees of the asset are unshared
    return selectedNomineesMap[assetId]!.isEmpty;
  }

  Future<void> _deleteAsset(int assetId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");

      final dio = Dio();
      dio.options.headers["Authorization"] = token;

      final url = 'http://43.205.12.154:8080/v2/assets/$assetId';
      final response = await dio.delete(
        url,
        options: Options(
          headers: {
            "ngrok-skip-browser-warning": "69420",
          },
        ),
      );

      if (response.statusCode == 200) {
        // Asset deletion successful
        // Remove the asset from the list and show a message
        setState(() {
          myShareAssetsResponse!.assets
              .removeWhere((asset) => asset.id == assetId);
        });

        // Show a toast message to indicate successful deletion
        DisplayUtils.showToast("Asset deleted successfully");
      } else {
        print('Failed to delete asset: ${response.statusCode}');
        print(response.data);
        // Handle error
      }
    } catch (e) {
      print('Failed to delete asset: $e');
      // Handle error
    }
  }


  bool _checkAssetDeleted(int assetId) {
    return myShareAssetsResponse!.assets
        .where((asset) => asset.id == assetId)
        .isEmpty;
  }

  List<Widget> _buildDetailsList(List<Detail> details) {
    return details.map((detail) {
      final capitalizedFieldName =
          detail.fieldName.substring(0, 1).toUpperCase() +
              detail.fieldName.substring(1);

      return ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                '$capitalizedFieldName:',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 3,
              child: Text(
                detail.fieldValue ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
