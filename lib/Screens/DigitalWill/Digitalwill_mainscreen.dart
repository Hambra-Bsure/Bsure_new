import 'package:Bsure_devapp/Screens/DigitalWill/widget/asset_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc/will_bloc.dart';
import 'bloc/will_state.dart';
import 'api.dart';
import 'components/loading.dart';
import 'components/no_asset.dart';
import 'components/no_nominee.dart'; // Import your API file containing getWillAssets function

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  late final Future<List<Asset>?> state;

  @override
  void initState() {
    super.initState();
    state = getWillAssets();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(),
      home: SafeArea(
        child: Scaffold(
          body: FutureBuilder(
            future: state,
            builder: (context, AsyncSnapshot<List<Asset>?> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(child: Text('Please wait...'));
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return const Loading();
                case ConnectionState.done:
                  if (snapshot.hasError || snapshot.data == null) {
                    return const Center(
                      child: Text(
                        'Error loading data. Please try again.',
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  } else {
                    List<Asset>? assets = snapshot.data;
                    if (assets == null || assets.isEmpty) {
                      return const NoAsset();
                    } else {
                      // Check if there are no nominees
                      bool noNominees =
                      assets.every((asset) => asset.nominees.isEmpty);
                      if (noNominees) {
                        // If there are no nominees, show the NoNominee screen
                        return const NoNominee();
                      } else {
                        // If there are nominees, display the AssetList
                        return BlocProvider(
                          create: (context) =>
                              WillBloc(WillState(assets: assets)),
                          child: AssetList(assets: assets),
                        );
                      }
                    }
                  }
              }
            },
          ),
        ),
      ),
    );
  }
}
