import 'dart:convert';
import 'package:Bsure_devapp/Screens/Repositary/Models/Share_assets/response.dart';
import 'package:http/http.dart' as http;

Future<void> _getAllCategoryAssets() async {
  const String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsInVzZXJNb2JpbGUiOiI4MzI4NTY0NjgzIiwiaWF0IjoxNzE0NDU4ODkwLCJleHAiOjE3MTUwNjM2OTB9.0EXr9LqkC-R78zE9D7EeQR3hHYojFdKDxdmw6x2IMmY";

  try {
    final res = await http
        .get(Uri.parse("http://43.205.12.154:8080/v2/asset/all"), headers: {
      "Authorization": token,
    });

    print(res.body);

    final x = GetAssetsResponse.fromJson(jsonDecode(res.body));
    print(x);
  } catch (e) {
    print(e);
  }
}

void main() {
  _getAllCategoryAssets();
}
