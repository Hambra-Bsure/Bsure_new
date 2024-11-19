import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart'; // For token management
import 'Screens/Repositary/Models/Nominee_models/Get_Nominee_response.dart';
import 'Screens/Repositary/Models/Share_assets/response.dart';
import 'Screens/ShareAssets/SelectedAssetsScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Share Your Assets with Nominees',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff429bb8),
          title: const Text('Share Your Assets with Nominees',
              style: TextStyle(color: Colors.white)),
        ),
        body: AssetAndNomineeList(),
      ),
    );
  }
}

class AssetAndNomineeList extends StatefulWidget {
  @override
  _AssetAndNomineeListState createState() => _AssetAndNomineeListState();
}

class _AssetAndNomineeListState extends State<AssetAndNomineeList> {
  List<Nominees> _nominees = [];
  List<Asset> _assets = [];
  bool isLoading = true;
  String? token;
  final List<String> _selectedOptions = [];
  final List<int> _selectedAssetIds = []; // Define this variable correctly
  bool _isSubmitted = false;

  @override
  void initState() {
    super.initState();
    _fetchTokenAndAssets();
  }

  Future<void> _fetchTokenAndAssets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjE0LCJ1c2VyTW9iaWxlIjoiODMyODU2NDY4MyIsImlhdCI6MTcyNjQ4NDUzNSwiZXhwIjoxNzI3MDg5MzM1fQ.mO1XYHe86TmHuKwu1Q-m0GEzRpq4kFgalHXJeVJ3hlE";

    if (token != null) {
      _getAllCategoryAssets();
    } else {
      print('No token found');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Authentication token is missing')),
      );
    }
  }

  Future<void> _getAllCategoryAssets() async {
    setState(() => isLoading = true);

    try {
      final res = await http.get(
        Uri.parse("https://dev.bsure.live/v2/asset/all"),
        headers: {
          "Authorization": token!,
        },
      );

      if (res.statusCode == 200) {
        final data = GetAssetsResponse.fromJson(jsonDecode(res.body));
        setState(() {
          _assets = data.assets!;
          isLoading = false;
        });
      } else {
        _handleError(res.statusCode, res.body);
      }
    } catch (e) {
      print('Error fetching assets: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to fetch assets')),
      );
      setState(() => isLoading = false);
    }
  }

  void _handleError(int statusCode, String body) {
    print('Failed to fetch assets: $statusCode, $body');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error fetching assets: $statusCode')),
    );
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      itemCount: _assets.length,
      itemBuilder: (context, index) {
        bool isSelected = _selectedAssetIds.contains(_assets[index].id ?? 0);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: Expanded(
                    child: AssetCard(
                      asset: _assets[index],
                      isSelected: isSelected,
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            _selectedAssetIds.add(_assets[index].id ?? 0);
                          } else {
                            _selectedAssetIds.remove(_assets[index].id ?? 0);
                          }
                        });
                      },
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: NomineeCardWidget(
                    assetId: _assets[index].id ?? 0,
                    selectedAssetIds:
                        _selectedAssetIds, // Pass the selected asset IDs
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class NomineeCardWidget extends StatefulWidget {
  final int assetId;
  final List<int> selectedAssetIds; // Add this parameter

  const NomineeCardWidget(
      {Key? key, required this.assetId, required this.selectedAssetIds})
      : super(key: key);

  @override
  _NomineeCardWidgetState createState() => _NomineeCardWidgetState();
}

class _NomineeCardWidgetState extends State<NomineeCardWidget> {
  List<Nominees> _nominees = [];
  final List<bool> _isSelected = []; // Track checkbox states
  List<Asset> _assets = [];

  @override
  void initState() {
    super.initState();
    _fetchNominees();
  }

  Future<void> _fetchNominees() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      const token =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjE0LCJ1c2VyTW9iaWxlIjoiODMyODU2NDY4MyIsImlhdCI6MTcyNjQ4NDUzNSwiZXhwIjoxNzI3MDg5MzM1fQ.mO1XYHe86TmHuKwu1Q-m0GEzRpq4kFgalHXJeVJ3hlE";

      if (token.isEmpty) {
        print('No token found');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Authentication token is missing')),
        );
        return;
      }

      final res = await http.get(
        Uri.parse("https://dev.bsure.live/v2/nominee/all"),
        headers: {
          "Authorization": token,
        },
      );

      if (res.statusCode == 200) {
        final data = GetNomineeResponse.fromJson(jsonDecode(res.body));

        if (data.nominees != null) {
          setState(() {
            _nominees = data.nominees!;
            _isSelected.clear();
            _isSelected
                .addAll(List.generate(_nominees.length, (index) => false));
          });
        } else {
          print('No nominees found in response');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No nominees found')),
          );
        }
      } else {
        _handleError(res.statusCode, res.body);
      }
    } catch (e) {
      print('Error fetching nominees: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to fetch nominees')),
      );
    }
  }

  void _handleError(int statusCode, String body) {
    print('Failed to fetch nominees: $statusCode, $body');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error fetching nominees: $statusCode')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 200, // Set the desired width
        height: 200, // Set the desired height
        color: Colors.white, // Set background color to white
        child: Card(
          elevation: 2,
          color: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(0.0),
              right: Radius.circular(0.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                if (_nominees.isNotEmpty)
                  for (int i = 0; i < _nominees.length; i++)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_nominees[i].firstName ?? 'No Name'),
                        Container(
                          child: Checkbox(
                            value: _isSelected[i],
                            onChanged: (bool? value) {
                              setState(() {
                                _isSelected[i] = value ?? false;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Collect selected nominee IDs
                        List<int> selectedNomineeIds = [];
                        for (int i = 0; i < _nominees.length; i++) {
                          if (_isSelected[i]) {
                            selectedNomineeIds.add(_nominees[i].id ?? 0);
                          }
                        }
                        // Call the submitNominees function with selected asset and nominee IDs
                        submitNominees(
                            selectedAssetIds: widget.selectedAssetIds,
                            selectedNomineeIds: selectedNomineeIds);
                      },
                      child: const Text('Submit'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Edit'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> submitNominees({
    required List<int> selectedAssetIds,
    required List<int> selectedNomineeIds,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjE0LCJ1c2VyTW9iaWxlIjoiODMyODU2NDY4MyIsImlhdCI6MTcyNjQ4NDUzNSwiZXhwIjoxNzI3MDg5MzM1fQ.mO1XYHe86TmHuKwu1Q-m0GEzRpq4kFgalHXJeVJ3hlE";

      if (token.isEmpty) {
        print('No token found');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Authentication token is missing')),
        );
        return;
      }

      final payload = {
        'assetIds': selectedAssetIds,
        'nomineeIds': selectedNomineeIds,
      };

      final res = await http.post(
        Uri.parse("https://dev.bsure.live/v2/share"),
        headers: {
          "Authorization": token,
          "Content-Type": "application/json",
        },
        body: jsonEncode(payload),
      );

      if (res.statusCode == 200) {
        print('Nominees submitted successfully');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nominees submitted successfully')),
        );
      } else {
        _handleError(res.statusCode, res.body);
      }
    } catch (e) {
      print('Error submitting nominees: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to submit nominees')),
      );
    }
  }
}
