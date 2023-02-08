import 'package:one_hundred_days_of_flutter/Day-15%20/%20Day-16/cache/shared_not_initialze.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { counter }

class SharedManager {
  SharedPreferences? prefs;

  SharedManager();

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  // Eger bir sorun olursa Exception'a girecek ve kod calismamis olacak
  void _checkPreferences() {
    if (prefs == null) {
      throw SharedNotInitiazleException();
    }
  }

  Future<void> saveString(SharedKeys key, String value) async {
    _checkPreferences();
    await prefs?.setString(key.name, value);
  }

  String? getString(SharedKeys key) {
    _checkPreferences();
    return prefs?.getString(key.name);
  }

  Future<bool> removeItem(SharedKeys key) async {
    _checkPreferences();
    return (await prefs?.remove(key.name)) ?? false;
  }
}
