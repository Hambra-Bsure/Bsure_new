import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc/will_state.dart';

Future<List<Asset>?> getWillAssets() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    if (token == null) {
      print("Token is null. Using an empty string as a default value.");
      token = "";
    }

    var url = "http://35.154.102.222/node/api/will/assets";
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': token,
      },
    );

    print("Token used: $token");

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final assets = json["assets"] as List<dynamic>;
      print("=");
      print(assets);

      Asset myFun(asset) => Asset.fromJson(asset);

      return assets.map<Asset>(myFun).toList();
    } else {
      print("Error: ${response.statusCode}");
      return null;
    }
  } catch (e) {
    print("Error: $e");
    return null;
  }
}
