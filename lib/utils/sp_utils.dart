import 'package:shared_preferences/shared_preferences.dart';

class SPUtils {
  static SharedPreferences? _preferences;

  static void init()  async{
    _preferences = await SharedPreferences.getInstance();
  }


  static bool getBool(String key, {bool defaultValue = false})  {
    return _preferences?.getBool(key) ?? defaultValue;
  }

  static void setBool(String key, bool value)  {
     _preferences?.setBool(key, value);
  }

  static int getInt(String key, {int defaultValue = 0})  {
    return _preferences?.getInt(key) ?? defaultValue;
  }

  static void setInt(String key, int value)  {
     _preferences?.setInt(key, value);
  }

  static String getString(String key, {String defaultValue = ''})  {
    return _preferences?.getString(key) ?? defaultValue;
  }

  static void setString(String key, String value)  {
     _preferences?.setString(key, value);
  }

  static double getDouble(String key, {double defaultValue = 0.0})  {
    return _preferences?.getDouble(key) ?? defaultValue;
  }

  static void setDouble(String key, double value)  {
     _preferences?.setDouble(key, value);
  }

  static List<String> getStringList(String key, {List<String> defaultValue = const []})  {
    return _preferences?.getStringList(key) ?? defaultValue;
  }

  static void setStringList(String key, List<String> value)  {
     _preferences?.setStringList(key, value);
  }


  static void remove(String key)  {
     _preferences?.remove(key);
  }

  static void clear()  {
     _preferences?.clear();
  }
}