import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc/will_state.dart';

Future<List<Asset>> getWillAssets() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token") ?? "";

    var url = "http://43.205.12.154:8080/v2/will/assets";
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
