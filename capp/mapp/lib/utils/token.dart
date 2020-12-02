import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Token {
  static FlutterSecureStorage _storage = FlutterSecureStorage();
  static generateToken(String token) async {
    await _storage.write(key: "tokennum", value: token);
  }

  static Future<String> readToken() async {
    String token = await _storage.read(key: "tokennum");
    return token;
  }
}
