void main() {
  var nums = [10, 90, 2, 1, 100, 155, 30, 20, 10];
  // Traditional Code
  // Loop
  /*for (int i = 0; i < nums.length; i++) {
    print("Value is ${nums[i]}");
  }*/
  // Iterator
  /*
  for (int currentValue in nums) {
    print("Value is $currentValue");
  }*/
  /*nums.forEach((currentElement) {
    print("Value is $currentElement");
  });*/
  nums.forEach((element) => print("Value is $element"));
  bool t = nums.every((element) => element <= 100);
  print(t);
  nums.sort((one, two) => two - one);
  print("After Sort $nums");
  int temp = nums.firstWhere((element) => element > 100);
  print("Temp is $temp");
  int total = nums.fold(0, (acc, currentElement) => acc + currentElement);
  //print('Prev $acc and Ele $currentElement'));
  print("Total is $total");
  List<int> subList =
      nums.where((element) => element >= 90 && element <= 100).toList();
  print("Iterate It ");
  nums.where((element) => element > 20).forEach((element) => print(element));
  print("SUb List is $subList");
}
