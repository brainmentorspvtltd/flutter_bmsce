class A1 {
  int y;
  /*A1() {
    y = 100;
    print("A1 x is $y");
  }*/
  A1(int y) {
    this.y = y;
  }
}

class B1 extends A1 {
  int x;
  B1(int x) : super(100) {
    this.x = 200;
    print("X is $x and this x is ${this.x} and parent is ${super.y}");
    int z = super.y + this.x + x;
    print("Z is $z");
  }
}

void main() {
  B1 obj = B1(300);
}
