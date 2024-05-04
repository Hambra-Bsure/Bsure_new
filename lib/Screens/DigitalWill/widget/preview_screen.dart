import 'package:accordion/accordion.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Retrofit/node_api_client.dart';
import '../Digitalwill_screens/video/Digitalwill_verify_otp.dart';
import '../Digitalwill_screens/video/camera_page.dart';
import '../bloc/will_bloc.dart';
import '../bloc/will_state.dart';
import 'will_save_request.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text("Preview", style: TextStyle(color: Colors.white)),
      ),
      body: BlocBuilder<WillBloc, WillState>(
        builder: (context, state) {
          var assets = state.assets;
          return Accordion(
            maxOpenSections: 1,
            // Adjust the number of open sections as needed
            //headerTextStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            children: List.generate(assets.length, (index) {
              var asset = assets[index];
              var nominees = asset.nominees;
              return AccordionSection(
                isOpen: false,
                // Set to true if you want a section to be open initially
                header: Container(
                  color: const Color(0xff429bb8),
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    assets[index].assetName,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                content: Column(
                  children: [
                    Text(
                      assets[index].assetId.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      assets[index].assetIdentity.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    // Add other content as needed
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: nominees
                          .where((nominee) => nominee.share > 0)
                          .map(
                            (nominee) => Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '${nominee.name}:',
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                                Text(
                                  nominee.share.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              );
            }),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          SubmitData(context);
        },
        label: const Text("Submit"),
        icon: const Icon(Icons.check),
        backgroundColor: const Color(0xFF00436A),
        foregroundColor: Colors.white,
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }

  Future<void> SubmitData(BuildContext context) async {
    final dio = Dio();
    final client = NodeClient(dio);
    final sf = await SharedPreferences.getInstance();
    final token = sf.get("token") as String;

    final bloc = BlocProvider.of<WillBloc>(context);
    final willState = bloc.state;

    if (willState is WillState) {
      final List<Asset> assets = willState.assets;

      // Convert the list of assets to the required format for submission
      final List<AssetReq> assetReqs = assets.map((asset) {
        return AssetReq(
          assetId: asset.assetId,
          nominees: asset.nominees.map((nominee) {
            return NomineeReq(
              nomineeId: nominee.id,
              share: nominee.share
                  .toDouble(), // Convert share to double if necessary
            );
          }).toList(),
        );
      }).toList();

      // Create a WillState object
      final WillState willStateObject = WillState(assets: assets);

      final response = await client.digitalWillSave(
        token: token,
        request: assetReqs, // Pass the WillState object
      );

      if (response.isValid == true) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Center(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Choose an option",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NomineeForAllAssets(),
                          ),
                        );
                      },
                      child: const Text("Verify Otp"),
                    ),
                    const SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CameraApp(),
                          ),
                        );
                      },
                      child: const Text("Verify video"),
                    ),
                  ],
                ),
              ),
            );
          },
        );
        // Show the dialog here
      } else {
        // Handle the error as needed
      }
    }
  }
}
