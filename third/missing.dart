void main() {
  List<int> arr = [1, 2, 4, 3, 6];
  int sum = 0;
  for (int i = 1; i <= 6; i++) {
    sum += i;
  }
  int total = arr.fold(0, (acc, currentValue) => acc + currentValue);
  print("Missing No is ${sum - total}");
}
