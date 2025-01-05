import 'package:Bsure_devapp/Screens/Repositary/Models/Share_assets/ShareAssetnewrequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/Share_assets/my_share_asset_res.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/Share_assets/response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../LoginScreen.dart';
import '../Repositary/Models/Nominee_models/Get_Nominee_response.dart';
import '../Repositary/Models/Share_assets/ShareAssetnewresponse.dart';
import '../Repositary/Models/User_models/Get_user_res.dart';
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
  bool isLoading = false;
  List<Asset> _assets = [];
  final List<int> _selectedNomineeIds = []; // List to hold selected nominee IDs
  Map<int, List<String>> selectedNomineesMap = {};
  final Map<int, List<int>> selectedNomineeIdsMap = {};
  bool isLoaded = false;

  GetUserResponse? Userprofile;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await _getAllCategoryAssets();
    await _getSharedAssets();
    await getData();
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
      const url = 'http://43.205.12.154:8080/v2/share/by-me';

      final response = await dio.get(url);

      if (response.statusCode == 200) {
        myShareAssetsResponse = MyShareAssetsResponse.fromJson(response.data);
        if (myShareAssetsResponse?.assets != null) {
          for (var asset in myShareAssetsResponse!.assets!) {
            selectedNomineesMap[asset.id] = asset.nominees
                    ?.map(
                        (nominee) => '${nominee.firstName} ${nominee.lastName}')
                    .toList() ??
                [];
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
        Uri.parse("http://43.205.12.154:8080/v2/asset/all"),
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

  Future<void> getData() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final token = sharedPreferences.getString("token");

      if (token == null || token.isEmpty) {
        _showLoginAlert();
        return;
      }

      final dio = Dio();
      dio.options.headers['Authorization'] = token;

      final response = await dio.get('http://43.205.12.154:8080/v2/users');

      if (response.statusCode == 200) {
        //DisplayUtils.showToast('Successfully fetched profile details');

        final getUserResponse = GetUserResponse.fromJson(response.data);
        final user = getUserResponse.user;

        setState(() {
          Userprofile = getUserResponse;
          isLoaded = true;
        });

        if (user != null) {
          final firstName = user.firstName ?? 'N/A';
          final lastName = user.lastName ?? 'N/A';
          await sharedPreferences.setString('firstName', firstName);
          await sharedPreferences.setString('lastName', lastName);
          print('First Name: $firstName, Last Name: $lastName');
        }
      } else {
        DisplayUtils.showToast('Failed to fetch user profile');
        setState(() {
          isLoaded = true;
        });
      }
    } catch (error) {
      DisplayUtils.showToast("Error fetching data");
      setState(() {
        isLoaded = true;
      });
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
                // Check if assetList is empty
                if (asset.assetList.isNotEmpty) ...[
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
                ] else ...[
                  // Optionally show a message when assetList is empty
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'No details available',
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                ],
                const SizedBox(height: 10),
                NomineeCardWidget(
                  assetId: asset.id ?? 0,
                  initiallySelectedNomineeIds: selectedNomineeIdsMap[asset.id] ?? [],
                  onNomineeSelected: (nomineeId, isSelected) {
                    setState(() {
                      if (isSelected) {
                        _selectedNomineeIds.add(nomineeId);
                      } else {
                        _selectedNomineeIds.remove(nomineeId);
                      }
                    });
                  },
                  selectedNomineeIdsMap: selectedNomineeIdsMap, // Pass the map here
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

  Future<void> submitNominees() async {
    setState(() => isLoading = true);

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");
      if (token == null) {
        throw Exception("Authentication token is missing.");
      }

      List<ShareAssetsreq> shareAssets = [];

      for (var asset in _assets) {
        final selectedNomineeIds = selectedNomineeIdsMap[asset.id] ?? [];
        if (selectedNomineeIds.isNotEmpty) {
          shareAssets.add(ShareAssetsreq(
              assetId: asset.id, nomineeIds: selectedNomineeIds));
        }
      }

      // Debugging: Check if shareAssets is empty
      print('Share Assets: $shareAssets');

      // Check if shareAssets is empty before proceeding
      if (shareAssets.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No nominees selected to share.')),
        );
        return; // Exit the function if no nominees are selected
      }

      final payload = ShareAssetsnewrequest(shareAssets: shareAssets).toJson();

      final response = await http.post(
        Uri.parse("http://43.205.12.154:8080/v2/share/new"),
        headers: {
          "Authorization": token,
          "Content-Type": "application/json",
        },
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        ShareAssetsnewresponse apiResponse =
        ShareAssetsnewresponse.fromJson(responseBody);

        if (apiResponse.success == true) {
          _shareNomineeInfo(_selectedNomineeIds);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Shared Assets submitted successfully')),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MyAssetsScreen()),
          );
        } else {
          throw Exception(apiResponse.message ?? 'Failed to submit nominees');
        }
      } else {
        final responseBody = jsonDecode(response.body);
        throw Exception(responseBody['message'] ?? 'Failed to submit nominees');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> _shareNomineeInfo(List<int> selectedNomineeIds) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final firstName = sharedPreferences.getString('firstName');
    final lastName = sharedPreferences.getString('lastName');

    if (firstName != null && lastName != null) {
      final customizedShareText =
          '$firstName $lastName has shared some of his assets for your view in Bsure App. '
          'Please log into Bsure App to view the details, visit: '
          'https://play.google.com/store/apps/details?id=com.bsure&pcampaignid=web_share';

      Share.share(customizedShareText);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('User  profile not loaded. Cannot share.')),
      );
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
          : Column(children: [
              Expanded(child: _buildAssetsList()),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: _selectedNomineeIds.isNotEmpty
                      ? () {
                          submitNominees(); // Call without parameters
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff429bb8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ]),
    );
  }
}

class NomineeCardWidget extends StatefulWidget {
  final int assetId;
  final List<int> initiallySelectedNomineeIds;
  final Function(int nomineeId, bool isSelected) onNomineeSelected;
  final Map<int, List<int>> selectedNomineeIdsMap;

  const NomineeCardWidget({
    Key? key,
    required this.assetId,
    required this.initiallySelectedNomineeIds,
    required this.onNomineeSelected,
    required this.selectedNomineeIdsMap,
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
        Uri.parse("http://43.205.12.154:8080/v2/nominee/all"),
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
    final previouslySelectedNomineeIds = widget.initiallySelectedNomineeIds;
    setState(() {
      _isSelected.addAll(List.generate(_nominees.length, (index) {
        return previouslySelectedNomineeIds.contains(_nominees[index].id);
      }));
    });
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
      color: Colors.white,
      child: Card(
        elevation: 2,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
                              if (_isSelected[i]) {
                                if (!widget.selectedNomineeIdsMap[widget.assetId]!.contains(_nominees[i].id)) {
                                  widget.selectedNomineeIdsMap[widget.assetId]!.add(_nominees[i].id!);
                                }
                              } else {
                                widget.selectedNomineeIdsMap[widget.assetId]!.remove(_nominees[i].id);
                              }
                            });
                          },
                          child: Text(
                            fullName,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
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

                            // Update the selectedNomineeIdsMap
                            if (_isSelected[i]) {
                              if (!widget.selectedNomineeIdsMap[widget.assetId]!.contains(_nominees[i].id)) {
                                widget.selectedNomineeIdsMap[widget.assetId]!.add(_nominees[i].id!);
                              }
                            } else {
                              widget.selectedNomineeIdsMap[widget.assetId]!.remove(_nominees[i].id);
                            }
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class ShareAsset {
  final int assetId;
  final List<int> nomineeIds;

  ShareAsset({required this.assetId, required this.nomineeIds});

  Map<String, dynamic> toJson() => {
        'assetId': assetId,
        'nomineeIds': nomineeIds,
      };
}
