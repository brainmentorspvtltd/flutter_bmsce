import 'package:bmi_calc/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
        title: 'BMI Calc',
        debugShowCheckedModeBanner: false,
        home: Home(),
        theme: ThemeData(
            sliderTheme: SliderThemeData(
                activeTrackColor: Colors.white, thumbColor: Colors.redAccent))),
  );
}
