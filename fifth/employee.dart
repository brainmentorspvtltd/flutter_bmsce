class Employee {
  //extends Object {
  int _id; // private
  String _name;
  double _salary;

// Every class has default constructor by default
  /*Employee() {
    _id = 1001;
  }*/
  // Param Cons
  Employee(int _id) {
    if (_id <= 0) {
      print("ID IS INVALID ");
      return;
    }
    this._id = _id;
  }
  // Named COnstructor
  // Employee.takeInput(int id, String name) {
  //   _id = id;
  //   _name = name;
  // }
  Employee.takeInput(this._id, this._name);
  Employee.takeAll(String name, {int id = 1, double salary = 99999}) {
    _id = id;
    _name = name;
    _salary = salary;
  }

/*
  set id(int _id) {
    if (_id <= 0) {
      print("Invalid Id");
      return;
    }
    this._id = _id;
  }*/

  get id {
    return _id ?? 0;
  }

  set name(String name) {
    _name = name;
  }

  get name {
    return _name ?? '';
  }

  set salary(double salary) {
    if (salary <= 0) {
      print("Negative or Zero Salary");
      return;
    }
    _salary = salary;
  }

  get salary {
    return _salary ?? 0.0;
  }

  @override
  String toString() {
    return "Id is $id Name is $name Salary is $salary";
  }
}
