// To parse this JSON data, do
//
//     final userdiscountResponsebean = userdiscountResponsebeanFromJson(jsonString);

import 'dart:convert';

UserdiscountResponsebean userdiscountResponsebeanFromJson(String str) =>
    UserdiscountResponsebean.fromJson(json.decode(str));

String userdiscountResponsebeanToJson(UserdiscountResponsebean data) =>
    json.encode(data.toJson());

class UserdiscountResponsebean {
  UserdiscountResponsebean({
    required this.isvalid,
    required this.message,
    required this.finalPrce,
    required this.discountAmount,
  });

  bool isvalid;
  String message;
  int finalPrce;
  int discountAmount;

  factory UserdiscountResponsebean.fromJson(Map<String, dynamic> json) =>
      UserdiscountResponsebean(
        isvalid: json["isvalid"],
        message: json["message"],
        finalPrce: json["finalPrce"],
        discountAmount: json["discountAmount"],
      );

  Map<String, dynamic> toJson() => {
    "isvalid": isvalid,
    "message": message,
    "finalPrce": finalPrce,
    "discountAmount": discountAmount,
  };
}