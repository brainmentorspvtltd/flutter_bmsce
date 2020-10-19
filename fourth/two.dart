void main() {
  if (10 > 2) {}
  if (true) {
  } else {}
  String result = 10 > 2 ? "Hello" : "Bye";
  /*int day = 1;
  switch (day) {
    case 1:
      print("Fun Day");
      break;
    case 2:
      print("Working Day");
      break;
    default:
      print("Other Day");
  }*/
  String day = "Sunday";
  switch (day) {
    case "Sunday":
      print("Fun Day");
      continue enjoy;
    case "Monday":
      print("Working Day");
      break;
    enjoy:
    case "Saturday":
      print("FunDay");
      break;
    default:
      print("Other Day");
  }
}
