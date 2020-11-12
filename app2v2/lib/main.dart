import 'package:bmi_calc/screens/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
        title: 'BMI Calc',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        theme: ThemeData(
            sliderTheme: SliderThemeData(
                activeTrackColor: Colors.white, thumbColor: Colors.redAccent))),
  );
}
