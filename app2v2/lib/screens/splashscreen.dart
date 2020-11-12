import 'dart:async';

import 'package:audioplayer/audioplayer.dart';
import 'package:bmi_calc/screens/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  _playMusic() {
    audioPlayer.play(
        'https://audio-ssl.itunes.apple.com/itunes-assets/Music/15/2c/15/mzm.dlejlbso.aac.p.m4a');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    _playMusic();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.redAccent,
                Colors.yellow,
                Colors.purpleAccent,
                Colors.cyanAccent,
                Colors.greenAccent
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/bmi.png'),
                Text(
                  'BMI CALC APP',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Powered By Brain Mentors')
              ],
            )
          ],
        ),
      ),
    );
  }

  void moveToNextScreen() {
    Timer(Duration(seconds: 9), () {
      audioPlayer.stop();
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => Home()));
    });
  }
}
