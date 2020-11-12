import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  Widget child;
  Color color;
  Box(this.child, this.color);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: this.color, borderRadius: BorderRadius.circular(10)),
            child: this.child));
  }
}
