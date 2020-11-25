import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mymusicapp/screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    title: 'My Music App',
    //home: ListOfSongs(),
    home: Login(),
    debugShowCheckedModeBanner: false,
  ));
}
