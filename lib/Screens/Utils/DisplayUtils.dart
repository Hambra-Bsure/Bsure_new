// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DisplayUtils {
  String USER_ID = "USER_ID";

  static showToast(message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      //fontSize: 16.0
    );
  }
}
