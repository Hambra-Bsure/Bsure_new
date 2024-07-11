import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Repositary/Models/Share_assets/share_asset_withme_res.dart';
import '../Repositary/Retrofit/node_api_client.dart';

class Shareassetwithme extends StatefulWidget {
  const Shareassetwithme({Key? key}) : super(key: key);

  @override
  _ShareassetwithmeState createState() => _ShareassetwithmeState();
}

class _ShareassetwithmeState extends State<Shareassetwithme> {
  late NodeClient nodeClient;
  late ShareAssetswithmeResponse shareAssetsResponse;
  bool isLoading = true;
  var height = 0.0;
  var width = 0.0;

  @override
  void initState() {
    super.initState();
    nodeClient = NodeClient(Dio());
    shareAssetsResponse = ShareAssetswithmeResponse(
      success: false,
      message: '',
      data: [],
    );
    _getSharedAssets();
  }

  Future<void> _getSharedAssets() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");

      if (token != null) {
        final dio = Dio();
        dio.options.headers["Authorization"] = token;
        const url = 'http://43.205.12.154:8080/v2/share/with-me';

        final response = await dio.get(
          url,
          options: Options(
            headers: {
              "ngrok-skip-browser-warning": "69420",
            },
          ),
        );

        print(response.data); // Print the response data

        setState(() {
          shareAssetsResponse =
              ShareAssetswithmeResponse.fromJson(response.data);
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching shared assets: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text(
          'Shared assets with me',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.grey[200],
      // Background color for the whole screen
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : shareAssetsResponse.success == true
              ? Card(
                  child: ListView.builder(
                    itemCount: shareAssetsResponse.data.length,
                    itemBuilder: (context, index) {
                      final userData = shareAssetsResponse.data[index];
                      return Card(
                        color: Colors.lightBlue,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              color: Colors.white,
                              margin: const EdgeInsets.all(8),
                              child: ListTile(
                                title: Center(
                                  child: Text(
                                    '${userData.firstName ?? ''} ${userData.lastName ?? ''}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                subtitle: Center(
                                  child: Text(
                                    userData.mobileNumber,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      // FontWeight.bold for bold text
                                      fontSize:
                                          16, // Example font size, adjust as needed
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            for (var asset in userData.assets)
                              Column(
                                children: [
                                  if (userData.assets.indexOf(asset) != 0)
                                    const Divider(),
                                  Card(
                                    color: Colors.white,
                                    margin: const EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 8.0),
                                          child: Center(
                                            child: Text(
                                              asset.category,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          ),
                                        ),
                                        ...asset.details
                                            .map(
                                              (detail) => Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0, bottom: 8.0),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      // Wrap the Row widget with Expanded
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            // Wrap the Text widget with Expanded
                                                            child: Text(
                                                              '${detail.fieldName.replaceAllMapped(RegExp(r'(?<=[a-z])(?=[A-Z])|(?<=[A-Z])(?=[A-Z][a-z])'), (match) => ' ${match.group(0)!}').trim()}:',
                                                              // Convert camelCase to words
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              overflow: TextOverflow
                                                                  .ellipsis, // Add this line to handle overflow
                                                            ),
                                                          ),
                                                          Expanded(
                                                            // Wrap the Text widget with Expanded
                                                            child: Text(
                                                              detail.fieldValue ??
                                                                  '',
                                                              // Use an empty string as the default value if detail.fieldValue is null
                                                              overflow: TextOverflow
                                                                  .ellipsis, // Add this line to handle overflow
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              : const Center(
                  child: Text('No one has shared assets with you'),
                ),
    );
  }
}
