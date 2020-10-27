class Student {
  //extends Object {
  int _rollno; // Instance Var
  String _name;
  double _marks;

  set name(String name) {
    this._name = name;
  }

  get name {
    return this._name;
  }

  set marks(double marks) {
    _marks = marks;
  }

  get marks {
    return _marks;
  }

  /*Student() {
    print("I am a Default Cons");
  }*/
  // Student(int rollno, String name, double marks) {
  //   this.rollno = rollno;
  //   this.name = name;
  //   this.marks = marks;
  // }
  // Named Constructor
  Student.takeInput(int rollno, {String name = "", double marks = 0.0}) {
    this._rollno = rollno;
    this._name = name;
    this._marks = marks;
  }
  Student(this._rollno, this._name, this._marks);

  void takeInput(int rollno, String name, double marks) {
    this._rollno = rollno;
    this._name = name;
    this._marks = marks;
  }

  @override
  String toString() {
    return "Id is ${this._rollno} Name is $name Marks is $_marks";
  }
  /*void display() {
    print("Id is $rollno Name is $name Marks is $marks");
  }*/
}
