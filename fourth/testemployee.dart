import 'dart:io';

import 'employee.dart';

void main() {
  print("Enter the Id ");
  int id = int.parse(stdin.readLineSync());
  //Employee employee = Employee(id);
  //print(employee);
  //print(employee.toString());

  //employee.id = id; // calling setter
  print("Enter the Name");
  String name = stdin.readLineSync();
  //Employee employee = Employee.takeInput(id, name);
  print("Enter the Salary");
  double salary = double.parse(stdin.readLineSync());
  Employee employee = Employee.takeAll(name);
  //employee.name = 'Ram';
  employee.salary = salary;
  print(employee);
}
