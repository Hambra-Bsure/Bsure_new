import 'package:Bsure_devapp/Screens/Repositary/Models/Share_assets/my_share_asset_res.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/Share_assets/response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../LoginScreen.dart';
import '../Repositary/Models/Nominee_models/Get_Nominee_response.dart';
import '../Utils/DisplayUtils.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyAssetsScreen extends StatefulWidget {
  const MyAssetsScreen({Key? key}) : super(key: key);

  @override
  _MyAssetsScreenState createState() => _MyAssetsScreenState();
}

class _MyAssetsScreenState extends State<MyAssetsScreen> {
  MyShareAssetsResponse? myShareAssetsResponse;
  bool isLoading = true;
  List<Asset> _assets = [];
  final List<int> _selectedAssetIds = [];
  Map<int, List<String>> selectedNomineesMap = {};
  final Map<int, List<int>> selectedNomineeIdsMap = {};
  List<int> _storedSelectedAssetIds = []; // To store selected asset IDs
  List<int> _storedSelectedNomineeIds = [];

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await _getAllCategoryAssets();
    await _getSharedAssets();
    await _loadStoredIds(); // Now you can await this
  }

  Future<void> _loadStoredIds() async {
    final prefs = await SharedPreferences.getInstance();

    // Debugging: Check what is stored in SharedPreferences
    print(
        "All SharedPreferences keys and values: ${prefs.getKeys().map((key) => '$key: ${prefs.getStringList(key)}').toList()}");

    // Retrieve the stored asset IDs
    List<String>? storedAssetIds = prefs.getStringList('selectedAssetIds');
    List<String>? storedNomineeIds = prefs.getStringList('selectedNomineeIds');

    // Check if the retrieved values are valid lists
    if (storedAssetIds != null && storedAssetIds.isNotEmpty) {
      _storedSelectedAssetIds =
          storedAssetIds.map((id) => int.parse(id)).toList();
    } else {
      print("No stored asset IDs found or it's not a list.");
    }

    if (storedNomineeIds != null && storedNomineeIds.isNotEmpty) {
      _storedSelectedNomineeIds =
          storedNomineeIds.map((id) => int.parse(id)).toList();
    } else {
      print("No stored nominee IDs found or it's not a list.");
    }

    // Print the loaded IDs for verification
    print("Loaded Asset IDs: $_storedSelectedAssetIds");
    print("Loaded Nominee IDs: $_storedSelectedNomineeIds");
  }

  Future<void> _getSharedAssets() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");

      if (token == null || token.isEmpty) {
        _showLoginAlert();
        return;
      }

      final dio = Dio();
      dio.options.headers["Authorization"] = token;
      const url = 'https://dev.bsure.live/v2/share/by-me';

      final response = await dio.get(url);

      if (response.statusCode == 200) {
        myShareAssetsResponse = MyShareAssetsResponse.fromJson(response.data);

        if (myShareAssetsResponse != null &&
            myShareAssetsResponse!.assets != null) {
          for (var asset in myShareAssetsResponse!.assets!) {
            selectedNomineesMap[asset.id] = asset.nominees != null
                ? asset.nominees!
                    .map(
                        (nominee) => '${nominee.firstName} ${nominee.lastName}')
                    .toList()
                : [];

            // Store the nominee IDs for this asset
            selectedNomineeIdsMap[asset.id] = asset.nominees
                    ?.map((nominee) => nominee.sharedAssetId ?? 0)
                    .toList() ??
                [];
          }
        }

        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      DisplayUtils.showToast('Failed to fetch shared assets: $e');
    }
  }

  Future<void> _getAllCategoryAssets() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (token == null || token.isEmpty) {
      _showLoginAlert();
      return;
    }

    setState(() => isLoading = true);

    try {
      final res = await http.get(
        Uri.parse("https://dev.bsure.live/v2/asset/all"),
        headers: {"Authorization": token},
      );

      if (res.statusCode == 200) {
        final data = GetAssetsResponse.fromJson(jsonDecode(res.body));
        setState(() {
          _assets = data.assets ?? [];
          isLoading = false;
        });
      } else {
        _handleError(res.statusCode);
      }
    } catch (e) {
      print('Error fetching assets: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to fetch assets')),
      );
      setState(() => isLoading = false);
    }
  }

  void _handleError(int statusCode) {
    setState(() {
      isLoading = false;
    });
    DisplayUtils.showToast('Error fetching data: $statusCode');
  }

  void _showLoginAlert() {
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
  }

  Widget _buildAssetsList() {
    return ListView.builder(
      itemCount: _assets.length,
      itemBuilder: (context, index) {
        final asset = _assets[index];

        return Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    _capitalizeWords(asset.category),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                for (var assetDetail in asset.assetList)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text(
                          '${_capitalizeWords(assetDetail.fieldName)}:',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          _getDisplayValue(assetDetail.fieldValue),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 10),
                NomineeCardWidget(
                  assetId: asset.id ?? 0,
                  selectedAssetIds: _storedSelectedNomineeIds,
                  // This can be used for other purposes if needed
                  initiallySelectedNomineeIds:
                      selectedNomineeIdsMap[asset.id] ?? [],
                  // Ensure this is the correct list
                  onNomineeSelected: (assetId, isSelected) {
                    setState(() {
                      if (isSelected) {
                        _selectedAssetIds.add(assetId);
                      } else {
                        _selectedAssetIds.remove(assetId);
                      }
                    });
                  },
                ),
                const Divider(),
              ],
            ),
          ),
        );
      },
    );
  }

  String _capitalizeWords(String text) {
    final spacedText = text.replaceAllMapped(
      RegExp(r'(?<=[a-z])(?=[A-Z])'),
      (match) => ' ',
    );
    return spacedText
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }

  String _getDisplayValue(dynamic value) {
    if (value == null) {
      return 'N/A';
    } else if (value is List) {
      return value.join(', ');
    } else {
      return value.toString();
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
          ? const Center(child: CircularProgressIndicator())
          : _buildAssetsList(),
    );
  }
}

class NomineeCardWidget extends StatefulWidget {
  final int assetId;
  final List<int> selectedAssetIds;
  final List<int> initiallySelectedNomineeIds;
  final Function(int, bool) onNomineeSelected;

  const NomineeCardWidget({
    Key? key,
    required this.assetId,
    required this.selectedAssetIds,
    required this.initiallySelectedNomineeIds,
    required this.onNomineeSelected,
  }) : super(key: key);

  @override
  _NomineeCardWidgetState createState() => _NomineeCardWidgetState();
}

class _NomineeCardWidgetState extends State<NomineeCardWidget> {
  List<Nominees> _nominees = [];
  final List<bool> _isSelected = [];

  @override
  void initState() {
    super.initState();
    _fetchNominees();
  }

  Future<void> _fetchNominees() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");

      if (token == null || token.isEmpty) {
        _showLoginAlert();
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
            _initializeSelectedNominees();
          });
        } else {
          _showNoNomineesFound();
        }
      }
    } catch (e) {
      _showFetchError();
    }
  }

  void _initializeSelectedNominees() {
    final previouslySelectedNomineeIds =
        widget.initiallySelectedNomineeIds; // Ensure this is correct
    print("Initially selected nominee IDs: $previouslySelectedNomineeIds");

    // Initialize the selection state based on previously selected nominee IDs
    setState(() {
      // _isSelected.clear(); // Clear previous selections to avoid duplication
      _isSelected.addAll(List.generate(_nominees.length, (index) {
        return previouslySelectedNomineeIds.contains(_nominees[index].id);
      }));
    });
  }

  void _showLoginAlert() {
    // Existing implementation for showing login alert
  }

  void _showNoNomineesFound() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('No nominees found')),
    );
  }

  void _showFetchError() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Failed to fetch nominees')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      color: Colors.white,
      child: Card(
        elevation: 2,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _nominees.length,
                  itemBuilder: (context, i) {
                    String fullName =
                        '${_nominees[i].firstName} ${_nominees[i].lastName}';
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isSelected[i] = !_isSelected[i];
                                widget.onNomineeSelected(
                                  _nominees[i].id ?? 0,
                                  _isSelected[i],
                                );
                              });
                            },
                            child: Text(
                              fullName,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                        ),
                        Checkbox(
                          value: _isSelected[i],
                          onChanged: (bool? newValue) {
                            setState(() {
                              _isSelected[i] = newValue ?? false;
                              widget.onNomineeSelected(
                                _nominees[i].id ?? 0,
                                _isSelected[i],
                              );
                            });
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submitNominees, // Always enabled
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: const Color(0xFF429bb8),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitNominees() {
    final selectedNomineeIds = _isSelected
        .asMap()
        .entries
        .where((entry) => entry.value)
        .map((entry) => _nominees[entry.key].id ?? 0)
        .toList();

    if (selectedNomineeIds.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one nominee')),
      );
      return;
    }

    print("selectedAssetIds");
    print([widget.assetId]); // Assuming you are only using one asset ID

    // Print selected nominee IDs
    print("selectedNomineeIds");
    print(selectedNomineeIds);

    // Store selected IDs in the parent widget

    // Submit the selected nominees to the backend
    submitNominees(
      selectedAssetIds: [widget.assetId],
      selectedNomineeIds: selectedNomineeIds,
    );
  }

  Future<void> submitNominees({
    required List<int> selectedAssetIds,
    required List<int> selectedNomineeIds,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");

      if (token == null || token.isEmpty) {
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

      final payload = {
        'assetIds': selectedAssetIds,
        'nomineeIds': selectedNomineeIds,
      };

      final res = await http.post(
        Uri.parse("https://dev.bsure.live/v2/share"),
        headers: {"Authorization": token, "Content-Type": "application/json"},
        body: jsonEncode(payload),
      );

      if (res.statusCode == 200) {
        // Store the selected IDs in SharedPreferences
        await prefs.setStringList('selectedAssetIds',
            selectedAssetIds.map((id) => id.toString()).toList());
        await prefs.setStringList('selectedNomineeIds',
            selectedNomineeIds.map((id) => id.toString()).toList());
        // Debug prints
        print("Stored Asset IDs: ${selectedAssetIds}");
        print("Stored Nominee IDs: ${selectedNomineeIds}");

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nominees submitted successfully')),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyAssetsScreen()),
        );
      } else {
        // Handle error
      }
    } catch (e) {
      print('Error submitting nominees: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to submit nominees')),
      );
    }
  }
}
