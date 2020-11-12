import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  IconData icon;
  Function fn;
  RoundedButton(this.icon, this.fn);
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: () {
          fn();
        },
        child: Icon(this.icon),
        shape: CircleBorder(),
        fillColor: Colors.grey,
        padding: EdgeInsets.all(16));
  }
}
