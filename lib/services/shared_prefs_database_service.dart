import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsDatabaseService {
  SharedPrefsDatabaseService();

  Future<bool?> saveList(String key, List<String> value) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      bool result = await prefs.setStringList(key, value);
      return result;
    } catch (e) {
      debugPrint("Error saving list: $e");
      return false;
    }
  }

  Future<List<String>?> getList(String key) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? result = prefs.getStringList(key);
      return result;
    } catch (e) {
      debugPrint("Error getting list: $e");
      return null;
    }
  }
}
