import 'package:firstdemoapp/screens/multidemo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'My First App',
    //home: Text('Hello Flutter'),
    //home: First(),
    home: Multi(),
    theme: ThemeData.light(),
    debugShowCheckedModeBanner: false,
  ));
}
