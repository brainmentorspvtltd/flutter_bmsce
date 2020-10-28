class P {
  final int x = 100;

  // final int x = 100; // Instance Member
  static int y = 200; // Class Member
  static int add() {
    return 100;
  }
}

void main() {
  print(P.add());
  const int r = 100;
  final int r2 = 200;
  final StringBuffer sb = StringBuffer();
  //r++;
  //r2++;

  print(P.y);
  P.y = 3000;
  print(P.y);
  P obj = P();

  print(obj.x);
  //obj.x = 100;
}
