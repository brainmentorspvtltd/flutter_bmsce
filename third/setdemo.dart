void main() {
  Set<int> set = {10, 20, 10, 190, 20, 88, 100, 90, 88};
  for (int i in set) {
    // print(i);
  }
  Set<int> t = set.difference({20, 88});
  //print(t);
  bool r1 = set.any((element) => element > 100);
  // print(r1);
  //print(set.intersection({10, 100, 900, 1000}));
  //set.skip(3);
  print(set);
  // set.skipWhile((value) => value < 30).forEach((element) => print(element));
  set.takeWhile((value) => value < 100).forEach((element) => print(element));
}
