// ignore_for_file: file_names, non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  String USER_ID = "USER_ID";
  String USER_NUMBER = "USER_NUMBER";
  String USER_TOKEN = "USER_TOKEN";
  String USER_LOGIN_STATUS = "USER_LOGIN_STATUS";
  String NOMINEE_ID = "NOMINEE_ID";
  String CAMPAIGN_ID = "CAMPAIGN_ID"; // Add a key for campaignId


  Future<String?> getMobileNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(USER_NUMBER);
  }

  void saveUserCredentials(String userId, String userToken) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(USER_ID, userId);
    prefs.setString(USER_TOKEN, userToken);
  }

  Future<bool> getLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(USER_LOGIN_STATUS) ?? false;
  }

  Future<void> setLoginStatus(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(USER_LOGIN_STATUS, isLoggedIn);
  }

  // Add a method to save campaignId
  void saveCampaignId(String campaignId) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(CAMPAIGN_ID, campaignId);
  }

  // Add a method to retrieve campaignId
  Future<String?> getCampaignId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(CAMPAIGN_ID);
  }

  static logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
