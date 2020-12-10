import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shop_app/utils/constants.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animationController.addListener(() => this.setState(() {}));
    animationController.repeat(period: Duration(seconds: 2), reverse: true);
    _moveToNextScreen();
  }

  _moveToNextScreen() {
    Timer(Duration(seconds: 3),
        () => Navigator.of(context).pushReplacementNamed("/home-screen"));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(Constants.FK_COLOR),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(50),
                  child: Text(
                    Constants.POWERED_BY,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  Constants.FK_LOGO,
                  width: animation.value * 200,
                  height: animation.value * 200,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
