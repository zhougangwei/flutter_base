import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class JsonCacheManager {
  static JsonCacheManager? _instance;
  final BaseCacheManager cacheManager;

  factory JsonCacheManager() {
    _instance ??= JsonCacheManager._internal();
    return _instance!!;
  }

  JsonCacheManager._internal()
      : cacheManager = DefaultCacheManager(); // 创建默认的 BaseCacheManager 实例

  Future<String?> getJson(String url) async {
    final file = await cacheManager.getSingleFile(url);

    if (file != null && await file.exists()) {
        return await file.readAsString();
    }
    return null;
  }

  Future<void> cacheJson(String url, dynamic jsonData) async {
    final jsonString = json.encode(jsonData);
    await cacheManager.putFile(url, Uint8List.fromList(utf8.encode(jsonString)));
  }
}