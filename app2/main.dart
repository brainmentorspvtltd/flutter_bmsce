import 'package:firstdemoapp/screens/eight.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'My First App',
    //home: Text('Hello Flutter'),
    //home: First(),
    home: GreetApp(),
    theme: ThemeData.light(),
    debugShowCheckedModeBanner: false,
  ));
}
