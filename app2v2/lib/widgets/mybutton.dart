import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  Function fn;
  MyButton(this.fn);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        fn();
      },
      child: Container(
        width: double.infinity,
        color: Colors.redAccent,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'CALCULATE',
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
