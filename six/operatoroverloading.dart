class Vector {
  int x, y;
  Vector(this.x, this.y);
  Vector operator +(Vector obj) {
    int x = this.x + obj.x;
    int y = this.y + obj.y;
    Vector sum = Vector(x, y);
    return sum;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "X is $x and Y is $y";
  }
}

void main() {
  Vector one = Vector(10, 20);
  Vector two = Vector(30, 40);
  Vector sum = one + two;
  print(sum);
  // int x = 100;
  // int y = 200;
  // int z = x + y;
}
