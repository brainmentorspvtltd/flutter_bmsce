void main() {
  var f = Calc2(10.20, 90.20);
  int z = f["addition"]();
  print(z);
  z = f["subtract"]();
  print(z);
  Map<String, Function> map = Calc(10, 20);
  int result = map["addition"]();
  print(result);
  result = map["subtract"]();
  print(result);
  /*List<Function> list = Calc(10, 20);
  print("List is $list");
  int result = list[0](); // call add
  print(result); //result = 10, result = 20
  print(list[1]);*/
  //result = list[1];
  //Function f = list[1];
  //int result2 = list[1](); // call sub
  //print(result2);
  // x = 100;
  // y = 200;

  // int result = add();
  // print(result);
  // result = sub();
  // print(result);
}

//List<Function>
//Function
// Function return Function
// Variable Store a Function
// Closure
// How to Prevent Global Functions and Global Variables
// Nested Function
//List<Function>
// Strict Way
Map<String, Function> Calc(int x, int y) {
  //int x, y;
  int add() {
    return x + y;
  }

  int sub() {
    return x - y;
  }

  return {"addition": add, "subtract": sub};
  //return [add, sub];
  //return [add, sub];
}

// Loose Way
Calc2(x, y) {
  //int x, y;
  add() {
    return x + y;
  }

  sub() {
    return x - y;
  }

  return {"addition": add, "subtract": sub};
  //return [add, sub];
  //return [add, sub];
}
