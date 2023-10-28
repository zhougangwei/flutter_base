import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }


  static Future<bool> getBool(String key, {bool defaultValue = false}) async {
    return _preferences?.getBool(key) ?? defaultValue;
  }

  static Future<void> setBool(String key, bool value) async {
    await _preferences?.setBool(key, value);
  }

  static Future<int> getInt(String key, {int defaultValue = 0}) async {
    return _preferences?.getInt(key) ?? defaultValue;
  }

  static Future<void> setInt(String key, int value) async {
    await _preferences?.setInt(key, value);
  }

  static Future<String> getString(String key, {String defaultValue = ''}) async {
    return _preferences?.getString(key) ?? defaultValue;
  }

  static Future<void> setString(String key, String value) async {
    await _preferences?.setString(key, value);
  }

  static Future<double> getDouble(String key, {double defaultValue = 0.0}) async {
    return _preferences?.getDouble(key) ?? defaultValue;
  }

  static Future<void> setDouble(String key, double value) async {
    await _preferences?.setDouble(key, value);
  }

  static Future<List<String>> getStringList(String key, {List<String> defaultValue = const []}) async {
    return _preferences?.getStringList(key) ?? defaultValue;
  }

  static Future<void> setStringList(String key, List<String> value) async {
    await _preferences?.setStringList(key, value);
  }


  static Future<void> remove(String key) async {
    await _preferences?.remove(key);
  }

  static Future<void> clear() async {
    await _preferences?.clear();
  }
}