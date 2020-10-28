enum Color { red, green, blue }
enum WeekDays { MONDAY, TUESDAY }
void main() {
  print(Color.red.index);
  Color c = Color.red;
  switch (c) {
    case Color.red:
      print("Roses are Red");
      break;
    case Color.green:
      print("Nature is Green");
      break;
    case Color.blue:
      print("Sky is Blue");
      break;
  }
}
