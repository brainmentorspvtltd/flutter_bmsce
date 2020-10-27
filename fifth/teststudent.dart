import './student.dart';

void main() {
  //Student ram = Student(1001, "Ram", 90);
  // Has - A
  Student ram = Student.takeInput(1001, name: "ram", marks: 90);
  //ram = Student.takeInput(1002);
  ram.name = "Ram  Kumar";
  print(ram); // ram.toString()
  print(ram.toString());
  //ram.takeInput(1001, "Ram", 90);
  //ram.display();
  /*ram.rollno = 1001;
  ram.name = "Ram";
  ram.marks = 90;
  print(ram.rollno);
  print(ram.name);
  print(ram.marks);
  */
}
