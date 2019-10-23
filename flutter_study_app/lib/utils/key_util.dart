import 'dart:convert';
import 'dart:math' as math;

import 'package:encrypt/encrypt.dart';

const _keys = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

String _createdSecretKey({int size = 16}) {
  StringBuffer buffer = StringBuffer();
  for (var i = 0; i < size; i++) {
    final position = math.Random().nextInt(_keys.length);
    buffer.write(_keys[position]);
  }
  return buffer.toString();
}

class KeyUtil {
  KeyUtil._private();

  static KeyUtil _instance;

  factory KeyUtil() {
    if (_instance == null) {
      _instance = KeyUtil._private();
    }
    return _instance;
  }

  final _crypto = Encrypter(AES(Key.fromUtf8(_createdSecretKey())));

  static final IV _iv = IV.fromUtf8('0102030405060708');

  static const String _keyParam = 'param';

  //加密
  Map encrypt(Map map) {
    if (map == null) return null;
    return {
      _keyParam: _crypto.encrypt(json.encode(map), iv: _iv).base64,
    };
  }

  //解密
  Map<String, String> decrypt(Map<String, String> map) {
    if (map == null) return null;
    final String encoded = map[_keyParam];
    if (encoded == null || encoded.isEmpty) return null;

    String data = _crypto.decrypt64(encoded, iv: _iv);
    final Map<String, dynamic> result = json.decode(data);
    result.forEach((key, value) {
      if (value is! String) {
        result[key] = value.toString();
      }
    });
    return result.cast();
  }
}
