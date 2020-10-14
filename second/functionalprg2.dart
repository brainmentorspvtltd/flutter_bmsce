void main() {
  loop(cube);
  print("#########################");
  loop(square);
}

square(y) {
  return y * y;
}

loop(Function fn) {
  for (int i = 1; i <= 10; i++) {
    print(fn(i));
  }
}

int cube(int num) {
  return num * num * num;
}
