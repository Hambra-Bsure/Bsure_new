import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class DisplayUtils {
  static void showToast(String message, {bool isSuccess = false}) {
    Color backgroundColor = isSuccess ? Colors.blue : Colors.red;

    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
