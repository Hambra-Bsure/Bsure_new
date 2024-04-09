import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Repositary/Models/AssetModels/GetbankResponse.dart';
import '../Repositary/Retrofit/node_api_client.dart';
import '../Utils/DisplayUtils.dart';
import '../Utils/SharedPrefHelper.dart';
import 'BankAccount.dart'; // Import the BankAccountScreen

class AssetDetailsList extends StatefulWidget {
  static const routeName = '/asset_details_list';
  final String assetType;

  const AssetDetailsList({Key? key, required this.assetType}) : super(key: key);

  @override
  State<AssetDetailsList> createState() => _AssetDetailsListState(assetType);
}

class _AssetDetailsListState extends State<AssetDetailsList> {
  late String userId;
  late double height;
  late double width;
  bool showNoAssetsMessage = false;
  bool isNewUser = false;
  GetBankResponse? products;
  bool isLoaded = false;

  final String assetType;

  _AssetDetailsListState(this.assetType);

  @override
  void initState() {
    super.initState();
    getData();
    _loadUserId().then((loadedUserId) {
      setState(() {
        userId = loadedUserId;
        isNewUser = loadedUserId.isEmpty;
      });
    });
  }

  Future<String> _loadUserId() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(SharedPrefHelper().USER_ID) ?? '';
  }

  Future<void> getData() async {
    const String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.'
        'eyJ1c2VySWQiOjIsInVzZXJFbWFpbCI6bnVsbCwidXNlck1vYmlsZSI6IjgzM'
        'jg1NjQ2ODMiLCJpYXQiOjE3MTIzMTkyMTUsImV4cCI6MTcxMjkyNDAxNX0.'
        'bh3HdNwm5-SYVIRwkqVl5z3giOUY9kTGSk7pV7aedwc'; // Replace with your actual token

    final prefs = await SharedPreferences.getInstance();
    Dio dio = Dio();
    final client = NodeClient(dio);

    try {
      var response = await client.getAssetsByCategory(token, assetType);

      processResponse(response);
    } catch (e) {
      DisplayUtils.showToast("API failure");
    }
  }

  void processResponse(GetBankResponse response) {
    setState(() {
      products = response;
      if (response.success == true) {
        if (products?.assets == null && response.message != null) {
          showNoAssetsMessage = true;
          Fluttertoast.showToast(
            msg: "Please add new assets",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } else {
          showNoAssetsMessage = false;
          isLoaded = true;
          print(response.toJson());
        }
      } else if (response.message != null) {
        DisplayUtils.showToast(response.message ?? "API failure");
      } else {
        DisplayUtils.showToast("API failure");
      }
    });
  }

  Future<void> _refresh() async {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text(
          "Asset Details List",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: isLoaded
            ? showNoAssetsMessage
                ? const Text('No assets found')
                : _buildAssetsList()
            : const CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                switch (assetType) {
                  case 'BankAccount':
                    return BankAccountScreen(assetType: assetType);
                  default:
                    return Container();
                }
              },
            ),
          );
          if (result != null && result) {
            getData();
          }
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

  Widget _buildAssetsList() {
    Map<String, List<Assets>> assetsByCategory = {};

    // Group assets by category
    products!.assets!.forEach((asset) {
      if (asset.category != null) {
        String category = asset.category!;
        if (assetsByCategory.containsKey(category)) {
          assetsByCategory[category]!.add(asset);
        } else {
          assetsByCategory[category] = [asset];
        }
      }
    });

    // Build a ListView to display assets grouped by category
    return ListView.builder(
      itemCount: assetsByCategory.length,
      itemBuilder: (context, index) {
        String category = assetsByCategory.keys.elementAt(index);
        List<Assets> categoryAssets = assetsByCategory[category]!;
        return _buildCategorySection(category, categoryAssets);
      },
    );
  }

// Widget to build a section for assets within a category
  Widget _buildCategorySection(String category, List<Assets> assets) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Display the category name as a section header
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            category,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        // Display assets belonging to the category
        Column(
          children: assets.map((asset) {
            return Card(
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Bank Name: ',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        Flexible(
                          child: Text(
                            asset.bankName ?? 'N/A',
                            style: const TextStyle(fontSize: 14.0),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Account Number:',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        Flexible(
                          child: Text(
                            asset.accountNumber ?? 'N/A',
                            style: const TextStyle(fontSize: 14.0),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Ifsc Code: ',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        Flexible(
                          child: Text(
                            asset.ifscCode ?? 'N/A',
                            style: const TextStyle(fontSize: 14.0),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Branch Name: ',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        Flexible(
                          child: Text(
                            asset.branchName ?? 'N/A',
                            style: const TextStyle(fontSize: 14.0),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Account Type: ',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        Flexible(
                          child: Text(
                            asset.accountType ?? 'N/A',
                            style: const TextStyle(fontSize: 14.0),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Comments: ',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        Flexible(
                          child: Text(
                            asset.comments ?? 'N/A',
                            style: const TextStyle(fontSize: 14.0),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Attachment: ',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        Flexible(
                          child: Text(
                            asset.attachment ?? 'N/A',
                            style: const TextStyle(fontSize: 14.0),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8.0),
                    // Add more fields as needed
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AssetDetailsList(
      assetType: 'BankAccount',
    ),
  ));
}
