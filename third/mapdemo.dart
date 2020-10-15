void main() {
  Map<String, int> map = {};
  map.putIfAbsent("Amit", () => 100);
  map.putIfAbsent("Amit", () => 200);
  map.putIfAbsent("Ram", () => 10);
  map["Amit"] = 1000; // Updation
  map["shyam"] = 1999; // Insertion
  bool r = map.containsKey("Amit");
  r = map.containsValue(1000);
  print(map.values);
  print(map.keys);
  print(map);
  map.remove("shyam");
}
