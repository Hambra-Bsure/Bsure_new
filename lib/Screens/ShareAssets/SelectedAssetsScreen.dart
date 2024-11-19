import 'package:Bsure_devapp/Screens/ShareAssets/EditAssetScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../LoginScreen.dart';
import '../Repositary/Models/Nominee_models/Get_Nominee_response.dart';
import '../Repositary/Models/Share_assets/response.dart';
import 'MyShareAsssets.dart';

class SelectedAssetsScreen extends StatefulWidget {
  const SelectedAssetsScreen({super.key});

  @override
  State<SelectedAssetsScreen> createState() => _SelectedAssetsScreenState();
}

class _SelectedAssetsScreenState extends State<SelectedAssetsScreen> {
  List<Nominees> _nominees = [];
  List<Asset> _assets = [];
  bool isLoading = true;
  String? token;
  final List<String> _selectedOptions = [];
  final List<int> _selectedAssetIds = []; // Define this variable correctly
  bool _isSubmitted = false;

  static const double _fontSize = 10;

  @override
  void initState() {
    super.initState();
    _fetchTokenAndAssets();
  }

  Future<void> _fetchTokenAndAssets() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

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

    setState(() => isLoading = true);

    try {
      final res = await http.get(
        Uri.parse("https://dev.bsure.live/v2/asset/all"),
        headers: {
          "Authorization": token.toString(),
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: 'Share your assets ',
              ),
              TextSpan(
                text: 'with nominees',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _assets.length,
                itemBuilder: (context, index) {
                  bool isSelected =
                      _selectedAssetIds.contains(_assets[index].id ?? 0);
                  return Padding(
                    padding: const EdgeInsets.all(1),
                    child: Card(
                      elevation: 2,
                      child: Row(
                        children: [
                          Expanded(
                              child: AssetCard(
                            asset: _assets[index],
                            isSelected: _selectedAssetIds
                                .contains(_assets[index].id ?? 0),
                            onSelected: (bool selected) {
                              setState(() {
                                if (selected) {
                                  _selectedAssetIds.add(_assets[index].id ?? 0);
                                } else {
                                  _selectedAssetIds
                                      .remove(_assets[index].id ?? 0);
                                }
                              });
                            },
                            backgroundColor: Colors.white,
                          )),
                          const SizedBox(width: 1),
                          Expanded(
                            child: NomineeCardWidget(
                              assetId: _assets[index].id ?? 0,
                              selectedAssetIds: _selectedAssetIds,
                              onNomineeSelected: (assetId, isSelected) {
                                // Define the callback
                                setState(() {
                                  if (isSelected) {
                                    _selectedAssetIds.add(assetId);
                                  } else {
                                    _selectedAssetIds.remove(assetId);
                                  }
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AssetCard extends StatefulWidget {
  final Asset asset;
  final bool isSelected;
  final ValueChanged<bool> onSelected;
  final Color backgroundColor; // Keep this for flexibility in future use

  const AssetCard({
    Key? key,
    required this.asset,
    required this.isSelected,
    required this.onSelected,
    required this.backgroundColor, // Keep this for future use
  }) : super(key: key);

  @override
  _AssetCardState createState() => _AssetCardState();
}

class _AssetCardState extends State<AssetCard> {
  String _capitalize(String s) {
    return s[0].toUpperCase() + s.substring(1);
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
    return GestureDetector(
      onTap: () {
        widget.onSelected(!widget.isSelected);
      },
      child: Card(
        elevation: widget.isSelected ? 20 : 5,
        // Change elevation based on selection
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          height: 350,
          width: 200,
          color: Colors.white,
          // Always keep the background color white
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (var i = 0; i < widget.asset.assetList.length; i++)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Text(
                            '${_capitalize(widget.asset.assetList[i].fieldName)}:',
                            style: const TextStyle(
                                fontSize: _SelectedAssetsScreenState._fontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors
                                    .black), // Always black text for label
                          ),
                        ),
                        Expanded(
                          flex: 4, // Give more space to the value
                          child: Text(
                            _getDisplayValue(
                                widget.asset.assetList[i].fieldValue),
                            style: const TextStyle(
                                fontSize: _SelectedAssetsScreenState._fontSize,
                                color: Colors.grey),
                            // Always grey text for value
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 2), // Add space between fields
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NomineeCardWidget extends StatefulWidget {
  final int assetId;
  final List<int> selectedAssetIds;
  final Function(int, bool) onNomineeSelected;

  const NomineeCardWidget({
    Key? key,
    required this.assetId,
    required this.selectedAssetIds,
    required this.onNomineeSelected,
  }) : super(key: key);

  @override
  _NomineeCardWidgetState createState() => _NomineeCardWidgetState();
}

class _NomineeCardWidgetState extends State<NomineeCardWidget> {
  List<Nominees> _nominees = [];
  final List<bool> _isSelected = [];
  bool _isEditMode = false;
  List<Asset> _assets = [];
  List<int> _selectedNomineeIds = [];
  List<int> _selectedAssetIds = []; // Define this variable
  bool _isSubmitEnabled = false; // Flag to enable/disable submit button

  @override
  void initState() {
    super.initState();
    _fetchNominees();
    _loadSelectedNominees();
  }

  Future<void> _loadSelectedNominees() async {
    final prefs = await SharedPreferences.getInstance();
    final selectedNomineeIds = prefs.getStringList('selectedNomineeIds');
    if (selectedNomineeIds != null) {
      setState(() {
        _selectedNomineeIds =
            selectedNomineeIds.map((id) => int.parse(id)).toList();
      });
    }
  }

  Future<void> _saveSelectedNominees() async {
    final prefs = await SharedPreferences.getInstance();
    final selectedNomineeIds = _isSelected
        .asMap()
        .entries
        .where((entry) => entry.value)
        .map((entry) => _nominees[entry.key].id)
        .toList();

    await prefs.setStringList('selectedNomineeIds',
        selectedNomineeIds.map((id) => id.toString()).toList());
  }

  Future<void> _fetchNominees() async {
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

      final res = await http.get(
        Uri.parse("https://dev.bsure.live/v2/nominee/all"),
        headers: {
          "Authorization": token.toString(),
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
    return Container(
      height: 350, // Set the desired height to handle larger lists
      width: 200, // Set the desired width
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _nominees.length,
                  itemBuilder: (context, i) {
                    String fullName = '';
                    if (_nominees[i].firstName != null &&
                        _nominees[i].firstName!.isNotEmpty) {
                      fullName += _nominees[i].firstName!;
                    }
                    if (_nominees[i].lastName != null &&
                        _nominees[i].lastName!.isNotEmpty) {
                      if (fullName.isNotEmpty) {
                        fullName += ' ';
                      }
                      fullName += _nominees[i].lastName!;
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isSelected[i] = !_isSelected[i];
                                _isSubmitEnabled =
                                    _isSelected.any((element) => element);
                                if (_isSelected[i]) {
                                  _selectedNomineeIds.add(_nominees[i].id ?? 0);
                                } else {
                                  _selectedNomineeIds
                                      .remove(_nominees[i].id ?? 0);
                                }
                                _saveSelectedNominees();
                                widget.onNomineeSelected(
                                    widget.assetId, _isSelected[i]);
                              });
                            },
                            child: _isEditMode
                                ? TextFormField(
                                    initialValue: fullName,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  )
                                : Text(
                                    fullName,
                                    style: const TextStyle(
                                        fontSize: _SelectedAssetsScreenState
                                            ._fontSize,
                                        color: Colors.black),
                                  ),
                          ),
                        ),
                        Checkbox(
                          value: _isSelected[i],
                          onChanged: (bool? value) {
                            setState(() {
                              _isSelected[i] = value ?? false;
                              _isSubmitEnabled =
                                  _isSelected.any((element) => element);
                              if (value ?? false) {
                                _selectedNomineeIds.add(_nominees[i].id ?? 0);
                              } else {
                                _selectedNomineeIds
                                    .remove(_nominees[i].id ?? 0);
                              }
                              _saveSelectedNominees();
                              widget.onNomineeSelected(
                                  widget.assetId, value ?? false);
                            });
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyAssetsScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color(0xFF429bb8),
                    ),
                    child: Text(
                      _isEditMode ? 'Save' : 'Edit',
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      List<int> selectedNomineeIds = [];
                      for (int i = 0; i < _nominees.length; i++) {
                        if (_isSelected[i]) {
                          selectedNomineeIds.add(_nominees[i].id ?? 0);
                        }
                      }
                      setState(() {
                        _selectedNomineeIds = selectedNomineeIds;
                      });
                      _saveSelectedNominees();
                      submitNominees(
                        selectedAssetIds: widget.selectedAssetIds,
                        selectedNomineeIds: selectedNomineeIds,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color(0xFF429bb8),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
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
        headers: {
          "Authorization": token!,
          "Content-Type": "application/json",
        },
        body: jsonEncode(payload),
      );

      if (res.statusCode == 200) {
        print('Nominees submitted successfully');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nominees submitted successfully')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const MyAssetsScreen(), // Replace with the actual screen to navigate to
          ),
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
