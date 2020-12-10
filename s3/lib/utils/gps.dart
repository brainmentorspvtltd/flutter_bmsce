import 'package:geolocator/geolocator.dart';

Future<Map<String, double>> getGpsLocation() async {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  double longitude = position.longitude;
  double latitude = position.latitude;
  print("Long $longitude Lat $latitude");
  return {"lat": latitude, "lng": longitude};
}
