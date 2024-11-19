import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../LoginScreen.dart';

class WillAssetsScreen extends StatefulWidget {
  @override
  _WillAssetsScreenState createState() => _WillAssetsScreenState();
}

class _WillAssetsScreenState extends State<WillAssetsScreen> {
  final Dio _dio = Dio();
  List<dynamic> _assets = [];
  List<dynamic> _witness = [];
  bool _willExists = false;

  @override
  void initState() {
    super.initState();
    _fetchAssets();
  }

  Future<void> _fetchAssets() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.get("token");

      if (token == null) {
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

      final response = await _dio.get(
        'http://43.205.12.154:8080/v2/will/assets',
        options: Options(
          headers: {'Authorization': '$token'},
        ),
      );

      if (response.data['success'] && response.data['assets'].isNotEmpty) {
        setState(() {
          _assets = response.data['assets'];
          _witness = response.data['witness'];
        });
      } else {
        await _checkWillExists();
      }
    } catch (e) {
      print('Error fetching assets: $e');
    }
  }

  Future<void> _checkWillExists() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.get("token");

      if (token == null ) {
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

      final response = await _dio.get(
        'http://43.205.12.154:8080/v2/will/check-exists',
        options: Options(
          headers: {'Authorization': '$token'},
        ),
      );

      if (response.data['success']) {
        setState(() {
          _willExists = true;
        });
      }
    } catch (e) {
      print('Error checking will existence: $e');
    }
  }

  void _navigateToEditScreen(Map<String, dynamic> asset) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditAssetScreen(asset: asset),
      ),
    ).then((updatedAsset) {
      if (updatedAsset != null) {
        setState(() {
          int index = _assets.indexWhere((a) =>
          a['assetId'] == updatedAsset['assetId']);
          if (index != -1) {
            _assets[index] = updatedAsset;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Get Will Assets', style: TextStyle(color: Colors.white)),
      ),
      body: _assets.isNotEmpty
          ? ListView.builder(
        itemCount: _assets.length,
        itemBuilder: (context, index) {
          final asset = _assets[index];
          return Card(
            color: Colors.white,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Asset Details Card
                      Card(
                        color: Colors.white,
                        elevation: 2.0,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Center(
                                      child: Text(
                                        '${asset['category']}',
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              // Space between category and details
                              ...asset['details'].map<Widget>((detail) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          '${detail['fieldName']}:',
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10.0),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          detail['fieldValue'] ?? "N/A",
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black54,
                                          ),
                                          textAlign: TextAlign.right,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      // Space between asset details and nominees
                      // Nominees Card
                      Card(
                        color: Colors.white,
                        elevation: 2.0,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Share Values:',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              // Space between title and nominees
                              ...asset['nominees'].map<Widget>((nominee) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          '${nominee['name']} (${nominee['relation']}):',
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10.0),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          '${nominee['share']}%',
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black54,
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 8.0,
                  right: 8.0,
                  child: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => _navigateToEditScreen(asset),
                  ),
                ),
              ],
            ),
          );
        },
      )
          : Center(
        child: _willExists
            ? const Text("Will exists for this user.")
            : const Text("No assets found."),
      ),
    );
  }
}

  class EditAssetScreen extends StatefulWidget {
  final Map<String, dynamic> asset;

  EditAssetScreen({required this.asset});

  @override
  _EditAssetScreenState createState() => _EditAssetScreenState();
}

class _EditAssetScreenState extends State<EditAssetScreen> {
  late Map<String, dynamic> _asset;
  late List<TextEditingController> _nomineeShareControllers;

  @override
  void initState() {
    super.initState();
    _asset = widget.asset;
    _nomineeShareControllers = _asset['nominees']
        .map<TextEditingController>((nominee) =>
        TextEditingController(text: nominee['share'].toString()))
        .toList();
  }

  void _updateAsset() async {
    try {
      for (int i = 0; i < _nomineeShareControllers.length; i++) {
        _asset['nominees'][i]['share'] =
            double.tryParse(_nomineeShareControllers[i].text) ?? 0.0;
      }

      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.get("token");

      final response = await Dio().put(
        'http://43.205.12.154:8080/v2/will/assets/${_asset['assetId']}',
        data: _asset,
        options: Options(
          headers: {'Authorization': '$token'},
        ),
      );

      if (response.data['success']) {
        Navigator.pop(context, _asset);
      } else {
        // Handle unsuccessful update
      }
    } catch (e) {
      print('Error updating asset: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff429bb8),
        title: const Text('Edit Asset',style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('Nominees:', style: TextStyle(fontWeight: FontWeight.bold)),
            ..._asset['nominees'].asMap().entries.map<Widget>((entry) {
              int index = entry.key;
              var nominee = entry.value;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text('${nominee['name']} - Relation: ${nominee['relation']}'),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _nomineeShareControllers[index],
                        decoration: InputDecoration(labelText: 'Share (%)'),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateAsset,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff429bb8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                elevation: 0,
              ),
              child: const Text('Update will',style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
