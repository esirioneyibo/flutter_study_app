import 'package:shared_preferences/shared_preferences.dart';

///SharedPreferences 本地存储
class LocalStorage {
  /// 保存一个缓存
  static save(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  /// 获取key缓存内容
  static Future<String> get(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  /// 清除单条缓存
  static remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  /// 清除缓存
  static removeAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var keys = prefs.getKeys();
    keys.map((key) {
      remove(key);
    });
  }
}
