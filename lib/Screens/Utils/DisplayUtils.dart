import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class DisplayUtils {
  static void showToast(String message, {bool isSuccess = true}) {
    Color backgroundColor = isSuccess ? Color(0xff429bb8) : Colors.red;

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
