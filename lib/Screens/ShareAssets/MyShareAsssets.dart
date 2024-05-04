import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Repositary/Models/Share_assets/Myshare_asset_res.dart';

class MyAssetsScreen extends StatefulWidget {
  const MyAssetsScreen({Key? key}) : super(key: key);

  @override
  _MyAssetsScreenState createState() => _MyAssetsScreenState();
}

class _MyAssetsScreenState extends State<MyAssetsScreen> {
  MyShareAssetsResponse? myShareAssetsResponse;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getSharedAssets();
  }

  Future<void> _getSharedAssets() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");

      Dio dio = Dio();
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

        print("response");
        print(response.data);

        setState(() {
          isLoading = false;
        });
      } else {
        print('Error fetching shared assets: ${response.statusCode}');
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching shared assets: $e');
      setState(() {
        isLoading = false;
      });
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
              child: CircularProgressIndicator(),
            )
          : myShareAssetsResponse != null &&
                  myShareAssetsResponse!.success ==
                      true // Add null check for assets
              ? _buildAssetsList()
              : const Center(
                  child: Text('Failed to fetch shared assets'),
                ),
    );
  }

  Widget _buildAssetsList() {
    return ListView.builder(
      itemCount: myShareAssetsResponse!.assets.length,
      itemBuilder: (context, index) {
        final asset = myShareAssetsResponse!.assets[index];
        print(asset);
        return Card(
          elevation: 3,
          margin: const EdgeInsets.all(8),
          color: Colors.white,
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  asset.category,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold, // Making category name bold
                  ),
                ),
                if (asset.category == 'BankAccount' &&
                    asset.bankAccount != null) ...[
                  Text('Bank Name: ${asset.bankAccount?.bankName}'),
                  Text('Account Number: ${asset.bankAccount?.accountNumber}'),
                  Text('Ifsc Code: ${asset.bankAccount?.ifscCode}'),
                  Text('Branch Name: ${asset.bankAccount?.branchName}'),
                  Text('Account Type: ${asset.bankAccount?.accountType}'),
                  Text('Comments: ${asset.bankAccount?.comments}'),
                  // Add additional fields specific to BankAccount here
                ],
                if (asset.category == 'MutualFund' &&
                    asset.mutualFund != null) ...[
                  Text('AMC Name: ${asset.mutualFund?.amcName}'),
                  Text('Scheme Name: ${asset.mutualFund?.schemeName}'),
                  // Add additional fields specific to MutualFund here
                ],
                const Divider(),
                for (var nominee in asset.nominees)
                  CheckboxListTile(
                    title: Text('${nominee.firstName} ${nominee.lastName}'),
                    value: false, // Change this value based on your logic
                    onChanged: (bool? value) {
                      // Handle checkbox changes here
                    },
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Perform update operation with selectedNominees list
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff429bb8),
                      ),
                      child: const Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
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
