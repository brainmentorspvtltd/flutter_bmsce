import 'package:firstdemoapp/screens/first.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'My First App',
    //home: Text('Hello Flutter'),
    home: First(),
    theme: ThemeData.light(),
    debugShowCheckedModeBanner: false,
  ));
}
