import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class Storage {
  static Future<String?> get(String key) async {
    final value = await rootBundle.loadString('assets/db.json');
    final data = jsonDecode(value);
    final Key = await generateKey();
    return data[Key + key];
  }

  static Future<void> set(String key, String value) async {
    final data = await rootBundle.loadString('assets/db.json');
    final jsonData = jsonDecode(data);
    final Key = await generateKey();
    jsonData[Key + key] = value;
  }

  static Future<void> del(String key) async {
    final Key = await generateKey();
    final data = await rootBundle.loadString('assets/db.json');
    final jsonData = jsonDecode(data);
    jsonData.remove(Key + key);
  }

  static Future<void> clear() async {
    final data = await rootBundle.loadString('assets/db.json');
    final jsonData = jsonDecode(data);
    jsonData.clear();
  }

  static Future<String> generateKey() async {
    var key = '';
    try {
      key = 'APP-PLUS';
      // Add platform-specific code here
    } catch (e) {
      final deviceId = 'DEVICE-ID'; // Replace with actual device ID retrieval code
      key = deviceId;
    }
    return key + '_';
  }
}