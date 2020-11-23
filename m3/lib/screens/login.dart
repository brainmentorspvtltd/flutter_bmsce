import 'package:flutter/material.dart';
import 'package:mymusicapp/utils/constants.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Size deviceSize;

  _createLoginWithGmail() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: deviceSize.height * 0.10,
        width: deviceSize.width * 0.75,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            color: Colors.limeAccent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(child: Image.network(Constants.GOOGLE_ICON)),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Login',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }

  _createLoginWithFB() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: deviceSize.height * 0.10,
        width: deviceSize.width * 0.75,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            color: Colors.grey),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(child: Image.network(Constants.FB_ICON)),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Login',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                width: deviceSize.width / 2,
                height: deviceSize.height / 2,
                child: Image.network(
                  Constants.LEFT_BORDER,
                ),
                top: 0,
                left: 0,
              ),
              Positioned(
                width: deviceSize.width / 2,
                height: deviceSize.height / 2,
                child: Image.network(Constants.RIGHT_BORDER),
                bottom: 0,
                right: 0,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _createLoginWithGmail(),
                    SizedBox(
                      height: 20,
                    ),
                    _createLoginWithFB()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
