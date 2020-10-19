import 'dart:convert' as json;

void main() {
  List<int> l = List();
  l..add(10)..add(20)..add(30)..add(40);

  print(l);
// Old Style
  /* l.add(10);
  l.add(20);
  l.add(30); */

  double ee = 10 / 2;
  int f = 10 ~/ 2;
  List<String> list = ["Ram", "Amit"];
  print(list is List);
  print(list is String);
  print(list is! String);
  String jsonString = '{"name":"Amit","city":"Delhi"}';
  dynamic obj = json.jsonDecode(jsonString);
  print("OBJ is $obj");
  print(obj['name']);
  int a;
  int b;
  a ??= 10;
  b ??= 20;
  int c = a + b;
  print("C is $c");
  String name;
  print("Name is ${name ?? 'Missing'}");

  // this is a single line comment
  /*
  Block Level Comment

  */
  /**
   Doc
   */
}
