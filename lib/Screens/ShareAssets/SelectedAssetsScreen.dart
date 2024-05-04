import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../DigitalWill/components/no_asset.dart';
import '../DigitalWill/components/no_nominee.dart';
import '../Repositary/Models/Nominee_models/Get_Nominee_response.dart';
import '../Repositary/Models/Share_assets/Share_asset_res.dart';
import '../Repositary/Models/Share_assets/response.dart';
import '../Utils/DisplayUtils.dart';
import 'MyShareAsssets.dart';

class SelectedAssetsScreen extends StatefulWidget {
  const SelectedAssetsScreen({super.key});

  @override
  State<SelectedAssetsScreen> createState() => _SelectedAssetsScreenState();
}

class _SelectedAssetsScreenState extends State<SelectedAssetsScreen> {
  List<Nominees> _nominees = [];
  bool isLoading = false;
  String? selectedNominee;
  final List<String> _selectedOptions = [];
  GetAssetsResponse? _assetsResponse;
  List<int> selectedAssetIds = [];

  @override
  void initState() {
    super.initState();
    getData();
    _getAllCategoryAssets();
  }

  Future<void> getData() async {
    setState(() {
      isLoading = true;
    });

    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    final url = Uri.parse('http://43.205.12.154:8080/v2/nominee/all');
    final response = await http.get(url, headers: {
      "Authorization": token.toString(),
      "ngrok-skip-browser-warning": "69420",
    });

    print(response.body);

    if (response.statusCode == 200) {
      final data = GetNomineeResponse.fromJson(jsonDecode(response.body));
      if (data.success!) {
        setState(() {
          _nominees = data.nominees!;
          isLoading = false;
        });
      } else {
        // Handle error case
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to fetch bank accounts'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  Future<void> _getAllCategoryAssets() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    try {
      final res = await http.get(
        Uri.parse("http://43.205.12.154:8080/v2/asset/all"),
        headers: {
          "Authorization": token.toString(),
        },
      );

      print("123");
      print(res.body);

      final x = GetAssetsResponse.fromJson(jsonDecode(res.body));

      print("234");
      print(x);

      setState(() {
        _assetsResponse = x;
      });

      // Print asset labels and values
      if (_assetsResponse != null) {
        for (var asset in _assetsResponse!.assets) {
          for (var field in asset.assetList) {
            print("Label: ${field.fieldName}, Value: ${field.fieldValue}");
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text(
          'Selected Assets',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: _nominees.isEmpty
                    ? const NoNominee()
                    : _buildSection(
                        title:
                            "Select the nominee with whom you want to share your assets",
                        child: _buildNomineeList(),
                      ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: _buildSection(
                  title: _selectedOptions.isNotEmpty
                      ? "Select the Assets which you want to share with $selectedNominee"
                      : "Select a nominee to show related assets",
                  child: _buildAssetList(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_selectedOptions.isEmpty) {
                    DisplayUtils.showToast(
                        "Select a nominee before submitting");
                  } else if (selectedAssetIds.isEmpty) {
                    DisplayUtils.showToast(
                        "Select at least one asset before submitting");
                  } else {
                    // Call submit method with selected asset IDs
                    submit(selectedAssetIds, _selectedOptions);
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: const Color(0xff429bb8),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        const SizedBox(height: 10),
        child,
      ],
    );
  }

  Widget _buildAssetList() {
    if (_assetsResponse?.assets.isEmpty ?? true) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: NoAsset(),
        ),
      );
    }

    return SizedBox(
      height: 250,
      child: ListView.builder(
        itemCount: _assetsResponse!.assets.length,
        itemBuilder: (context, index) {
          final asset = _assetsResponse!.assets[index];
          return AssetCard(
            asset: asset,
            isSelected: selectedAssetIds.contains(asset.id ?? 0),
            onSelected: (isSelected) {
              setState(() {
                if (isSelected) {
                  selectedAssetIds.add(asset.id ?? 0);
                } else {
                  selectedAssetIds.remove(asset.id ?? 0);
                }
              });
            },
          );
        },
        shrinkWrap: true,
      ),
    );
  }

  Widget _buildNomineeList() {
    if (_nominees.isEmpty) {
      return const Center(
        child: Text('No nominees available. Please add nominees first.'),
      );
    }

    return SizedBox(
      height: 250,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: _nominees.map((nominee) {
          return GestureDetector(
            onTap: () {
              _toggleNomineeSelection(nominee.id.toString());
            },
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    nominee.firstName!,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Checkbox(
                  activeColor: const Color(0xff429bb8),
                  value: _selectedOptions.contains(nominee.id.toString()),
                  onChanged: (bool? value) {
                    _toggleNomineeSelection(nominee.id.toString());
                  },
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  void _toggleNomineeSelection(String nomineeId) {
    setState(() {
      if (_selectedOptions.contains(nomineeId)) {
        _selectedOptions.remove(nomineeId);
      } else {
        _selectedOptions.add(nomineeId);
      }
      selectedNominee = _nominees
          .firstWhere((nominee) => nominee.id.toString() == nomineeId)
          .firstName;
    });
  }

  Future<void> submit(
      List<int> selectedAssetIds, List<String> selectedNomineeIds) async {
    print("ass");
    print("Selected asset IDs: $selectedAssetIds");
    print("Selected nominee IDs: $selectedNomineeIds");

    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");
      if (token == null) {
        DisplayUtils.showToast("Token not found. Please log in.");
        return;
      }

      Dio dio = Dio(); // Create a Dio instance
      dio.options.headers["Authorization"] = token; // Set authorization header

      // Define the URL for the share request
      const url = 'http://43.205.12.154:8080/v2/share';

      // Prepare the request body
      final shareRequestData = {
        "nomineeIds": _selectedOptions.map((id) => int.parse(id)).toList(),
        "assetIds": selectedAssetIds,
      };

      // Send the POST request to the server
      final response = await dio.post(
        url,
        data: shareRequestData,
        options: Options(
          headers: {
            "ngrok-skip-browser-warning": "69420",
          },
        ),
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        // Parse the response data
        final shareResponse = ShareAssetResponse.fromJson(response.data);

        // Print the response
        print(jsonEncode(shareResponse));

        if (shareResponse.success == true) {
          DisplayUtils.showToast("Assets shared successfully");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const MyAssetsScreen(), // Navigate to MyAssetsScreen
            ),
          );
        } else {
          DisplayUtils.showToast(
              "Failed to share assets: ${shareResponse.message}");
        }
      } else {
        DisplayUtils.showToast(
            "Failed to share assets. Server returned ${response.statusCode}");
      }
    } catch (e) {
      DisplayUtils.showToast(
          "Failed to share assets. Check your network connection.");
    }
  }
}

class AssetCard extends StatefulWidget {
  final Asset asset;
  final bool isSelected; // Define isSelected parameter here
  final ValueChanged<bool> onSelected;

  const AssetCard({
    super.key,
    required this.asset,
    required this.isSelected, // Include isSelected parameter here
    required this.onSelected,
  });

  @override
  _AssetCardState createState() => _AssetCardState();
}

class _AssetCardState extends State<AssetCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onSelected(!widget.isSelected); // Notify parent widget
        });
      },
      child: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var i = 0; i < widget.asset.assetList.length; i++)
                      Text(
                        '${widget.asset.assetList[i].fieldName}: ${_getDisplayValue(widget.asset.assetList[i].fieldValue)}',
                        style: const TextStyle(fontSize: 16),
                      ),
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Checkbox(
                    activeColor: const Color(0xff429bb8),
                    value: widget.isSelected,
                    onChanged: (bool? value) {
                      setState(() {
                        widget
                            .onSelected(value ?? false); // Notify parent widget
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper function to get the display value of fieldValue
  String _getDisplayValue(dynamic value) {
    if (value == null) {
      return 'N/A';
    } else if (value is List) {
      return value.join(', ');
    } else {
      return value.toString();
    }
  }
}
