void main() {
  int result = add(10, 20);
  print("Result is $result");
  dynamic result2 = addition("Amit", "Srivastava");
  print(result2);
  Function e = () {};
  int result3 = mul(10, 2);
  print(result3);
}

var mul = (a, b) => a * b;
final div = (int a, int b) => a / b;

List<Function> Maths() {
  Function add = () {};
  Function sub = () {};
  var sin = () {};
  /*
  int add(){

  }
  int sub(){

  }
  int sin(){

  }
  int cos(){

  }*/
  return [add, sub, sin];
}

// function decleration style
int add(int x, int y) {
  return x + y;
}

addition(x, y) {
  return x + y;
}
