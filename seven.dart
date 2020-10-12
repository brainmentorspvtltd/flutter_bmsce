import 'dart:io';

void main() {
  String name = "Amit@gmail.com";
  print(name.codeUnitAt(0));
  print(name.codeUnits);
  print(name.runtimeType);
  print(name is String);
  print(stdout is Stdout);
  print(name.contains("yahoo"));
  print(name.indexOf("gmail"));
  print(name.lastIndexOf("gmail"));
  print(name.startsWith("Amit"));
  print(name.startsWith("Amit", 10));
  print(name.endsWith(".com"));
  print(name.toUpperCase());
  print(name.toLowerCase());
  print(name.substring(2, 5));
  print("       Amit       Srivastava     ".trim());
  List<String> str = "A-10, Roop Nagar, Delhi-7".split(",");
  print(str);
  print(name.length);
  print(name.isEmpty);
  print(name.isNotEmpty);
  //int e1 = int.parse(name[0]);
}
