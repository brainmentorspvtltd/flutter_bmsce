import 'package:firstdemoapp/screens/six.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'My First App',
    //home: Text('Hello Flutter'),
    //home: First(),
    home: Six(),
    theme: ThemeData.light(),
    debugShowCheckedModeBanner: false,
  ));
}
