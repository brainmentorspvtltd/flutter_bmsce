import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  double result;
  ResultScreen(this.result);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Text(
                'Your Result',
                style: TextStyle(fontSize: 45, color: Colors.white),
              ),
            ),
          ),
          Expanded(
              child: Container(
            child: Column(
              children: [
                Text(''),
                Text(
                  result.toString(),
                  style: TextStyle(fontSize: 30, color: Colors.white),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
