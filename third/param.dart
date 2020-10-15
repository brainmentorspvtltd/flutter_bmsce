void main() {
  print(add());
  print(add(y: 10));
  print(add2(90));
}

int add2([int x = 0, int y = 0]) {
  return x + y;
}

// // Positional Optional Param
// int add([int x = 0, int y = 0]) {
//   return x + y;
// }
// Named Optional Param
int add({int x = 0, int y = 0}) {
  return x + y;
}
