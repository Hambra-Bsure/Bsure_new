import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc/will_state.dart';

Future<List<Asset>?> getWillAssets() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    if (token == null) {
      token = "";
    }

    var url = "http://35.154.102.222/node/api/will/assets";
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': token,
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final assets = json["assets"] as List<dynamic>;

      Asset myFun(asset) => Asset.fromJson(asset);

      return assets.map<Asset>(myFun).toList();
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}
