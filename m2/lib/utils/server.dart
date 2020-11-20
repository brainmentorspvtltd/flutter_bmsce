import 'package:http/http.dart' as http;

class Server {
  static Future<http.Response> collectSongs() {
    const URL = "https://itunes.apple.com/search?term=sonu+nigam&limit=11425";
    Future<http.Response> future = http.get(URL);
    return future;
  }

  collectArtist() {}
}
