import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalToken {
  LocalToken._() {}
  static final storage = new FlutterSecureStorage();
  // Once u login then generate and pass the tokenId
  static generateToken(String tokenId) {
    storage.write(key: 'fklocal', value: tokenId);
  }

  // On all internal screens after login , use this one to check do u have the valid token
  static Future<String> readAToken() {
    return storage.read(key: 'fklocal');
  }
}
