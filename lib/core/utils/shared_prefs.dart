import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static Future<SharedPreferences> getPrefs() async =>
      await SharedPreferences.getInstance();

  static Future<bool> setUserToken(String token) async {
    final prefs = await SharedPrefsHelper.getPrefs();
    return prefs.setString('userToken', token);
  }

  static Future<String?> getUserToken() async {
    final prefs = await SharedPrefsHelper.getPrefs();
    return prefs.getString('userToken');
  }



  // Similar methods for sessionId and accountId...
  static Future<bool> setSessionId(String sessionId) async {
    final prefs = await SharedPrefsHelper.getPrefs();
    return prefs.setString('sessionId', sessionId);
  }

  static Future<String?> getSessionId() async {
    final prefs = await SharedPrefsHelper.getPrefs();
    return prefs.getString('sessionId');
  }

  static Future<bool> setAccountId(String accountId) async {
    final prefs = await SharedPrefsHelper.getPrefs();
    return prefs.setString('accountId', accountId);
  }

  static Future<String?> getAccountId() async {
    final prefs = await SharedPrefsHelper.getPrefs();
    return prefs.getString('accountId');
  }



}
