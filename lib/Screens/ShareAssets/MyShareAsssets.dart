import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
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
      const url = 'https://dev.bsure.live/v2/share/by-me';

      final response = await dio.get(
        url,
        options: Options(
          headers: {
            "ngrok-skip-browser-warning": "69420",
          },
        ),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data as Map<String, dynamic>;
        myShareAssetsResponse = MyShareAssetsResponse.fromJson(data);

        if (myShareAssetsResponse != null &&
            myShareAssetsResponse!.assets != null) {
          for (var asset in myShareAssetsResponse!.assets!) {
            selectedNomineesMap[asset.id] = asset.nominees != null
                ? asset.nominees!
                    .map(
                        (nominee) => '${nominee.firstName} ${nominee.lastName}')
                    .toList()
                : [];
          }
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
          'My shared assets',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : (myShareAssetsResponse != null &&
                  myShareAssetsResponse!.assets != null &&
                  myShareAssetsResponse!.assets!.isNotEmpty)
              ? _buildAssetsList()
              : _buildNoAssetsMessage(),
    );
  }

  Widget _buildAssetsList() {
    bool hasSelectedNominee = false;

    for (var asset in myShareAssetsResponse!.assets!) {
      if (selectedNomineesMap[asset.id]!.isNotEmpty) {
        hasSelectedNominee = true;
        break;
      }
    }

    if (!hasSelectedNominee) {
      return _buildNoNomineesMessage();
    }

    return Card(
      color: Colors.lightBlue,
      child: ListView.builder(
        itemCount: myShareAssetsResponse!.assets!.length,
        itemBuilder: (context, index) {
          final asset = myShareAssetsResponse!.assets![index];
          selectedNomineesMap.putIfAbsent(asset.id, () => []);

          bool anyNomineeSelected = selectedNomineesMap[asset.id]!.isNotEmpty;

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
                    if (anyNomineeSelected)
                      ..._buildDetailsList(asset.details ?? []),
                    if (!anyNomineeSelected)
                      const Text(
                        'No one any shared assets',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    const Divider(),
                    for (var nominee in asset.nominees ?? [])
                      CheckboxListTile(
                        title: Text(
                          '${nominee.firstName} ${nominee.lastName}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        value: selectedNomineesMap[asset.id]!.contains(
                            '${nominee.firstName} ${nominee.lastName}'),
                        onChanged: (bool? value) {
                          if (value != null && value) {
                            selectedNomineesMap[asset.id]!.add(
                                '${nominee.firstName} ${nominee.lastName}');
                          } else {
                            _confirmUnshareNominee(
                                asset.id, nominee, nominee.sharedAssetId);
                          }
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

  Widget _buildNoAssetsMessage() {
    return Center(
      child: Container(
        color: Colors.white,
        child: const Text(
          'I have not shared the assets with anyone',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildNoNomineesMessage() {
    return Center(
      child: Container(
        color: Colors.white,
        child: const Text(
          'No one any shared assets',
          style: TextStyle(
            fontSize: 18,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }

  void _confirmUnshareNominee(int assetId, Nominee nominee, int sharedAssetId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Unshare nominee?"),
          content: const Text("Are you sure you want to unshare this nominee?"),
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
                await _unshareNominee(assetId, nominee, sharedAssetId);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _unshareNominee(
      int assetId, Nominee nominee, int sharedAssetId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");

      final dio = Dio();
      dio.options.headers["Authorization"] = token;

      final url = 'https://dev.bsure.live/v2/share/$sharedAssetId';
      final response = await dio.delete(
        url,
        options: Options(
          headers: {
            "ngrok-skip-browser-warning": "69420",
          },
        ),
      );

      if (response.statusCode == 200) {
        setState(() {
          selectedNomineesMap[assetId]!
              .remove('${nominee.firstName} ${nominee.lastName}');
        });
        DisplayUtils.showToast("Nominee unshared successfully");
      } else {
        print('Failed to unshare nominee: ${response.statusCode}');
        print(response.data);
      }
    } catch (e) {
      print('Failed to unshare nominee: $e');
    }
  }

  bool _checkAssetDeleted(int assetId) {
    return myShareAssetsResponse!.assets!
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
