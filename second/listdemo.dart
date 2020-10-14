class Employee extends Object {
  int id;
  String name;
  double salary;
  Employee() {
    id = 1001;
    name = "Ram";
    salary = 9999;
  }
  @override
  String toString() {
    return "Id is $id Name is $name Salary is $salary";
  }
}

void main() {
  Employee ram = new Employee();
  print(ram);
  print(ram.toString());
  List<int> num = [90, 1, 88, 33, 44, 2, 0];
  num.add(1000);
  num.insert(0, 20000);
  //num.remove(1000);
  //num.removeAt(0);

  //num.removeRange(2, 5);
  //num.clear();
  print(num.contains(44) ? "Found" : "Not Found");
  print(num.indexOf(44) >= 0 ? "Found " : "Not Found");
  print(num.lastIndexOf(44) >= 0 ? "Found" : "Not Found ");
  int val = num.elementAt(1);
  val = num[0];
  print(num); // num.toString()
}
