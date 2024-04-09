import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeadersUtils {
  static Future<Dio> getAuthDio() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    Dio dio = Dio();
    dio.options.headers["Authorization"] = "Bearer $token";

    return dio;
  }
}
