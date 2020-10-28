class A {
  void show() {
    print("A Show");
  }
}

class B {
  void output() {
    print("B output");
  }
}

class C {
  void disp() {
    print("C Disp");
  }
}

class D extends C with A, B {
  void printing() {
    print("D Print is called....");
  }
}

void main() {
  D d = D();
  d.disp();
  d.printing();
  d.show();
  d.output();
}
