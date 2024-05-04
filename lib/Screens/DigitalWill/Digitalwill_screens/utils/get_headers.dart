// ignore_for_file: depend_on_referenced_packages, file_names

import 'package:dio/dio.dart';

class HeadersUtils {
  static Dio getHeaders(token) {
    Dio dio = Dio(); // Provide a dio instance
    dio.options.headers["authorization"] = token;
    return dio;
  }
}
