void main(List<String> args) {
  var firstNo = args[0];
  var secondNo = args[1];
  print(firstNo.runtimeType);
  print(secondNo.runtimeType);
  var result = firstNo + secondNo;
  //int firstNo = int.parse(args[0]);
  //int secondNo = int.parse(args[1]);
  //int result = firstNo + secondNo;
  print("Result is $result");
}
