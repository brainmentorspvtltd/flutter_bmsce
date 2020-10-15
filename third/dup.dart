void main() {
  List<int> arr = [1, 3, 2, 4, 5, 1];
  print(arr.length == arr.toSet().length ? "Girls" : "Boys");
  //Set<int> set = arr.toSet();
  //print(arr.length == set.length ? "Girls" : "Boys");
}
