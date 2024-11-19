import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../LoginScreen.dart';
import 'bloc/will_state.dart';

Future<List<Asset>> getWillAssets(context) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token") ?? "";

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
    }

    var url = "https://dev.bsure.live/v2/will/assets";
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': token,
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json.containsKey("assets") && json["assets"] is List<dynamic>) {
        final List<dynamic> assets = json["assets"];
        return assets.map<Asset>((asset) => Asset.fromJson(asset)).toList();
      } else {
        // Return an empty list if the "assets" key is missing or invalid
        return [];
      }
    } else {
      // Return an empty list if the API call was not successful
      return [];
    }
  } catch (e) {
    // Return an empty list if an exception occurs during the API call
    print('Error loading assets: $e');
    return [];
  }
}
