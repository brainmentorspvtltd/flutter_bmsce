import 'package:flutter/material.dart';
import 'package:musicappbvp/utils/constants.dart';

class Login extends StatefulWidget {
  //Login(){}
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  _createUserId() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(10),
      child: TextField(
        style: TextStyle(fontSize: 30),
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Type Userid Here',
            labelText: 'Userid',
            prefixIcon: Icon(Icons.person)),
      ),
    );
  }

  _createReset() {}

  _doLogin() {}
  _createButton() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: RaisedButton(
        color: Colors.blue,
        onPressed: () {},
        child: IconButton(
          icon: Icon(Icons.vpn_key),
          color: Colors.red,
          iconSize: 30,
          hoverColor: Colors.yellowAccent,
          onPressed: () {},
        ),
      ),
    );
  }

  _createPwd() {
    return Container(
        child: TextField(
      obscureText: true,
      style: TextStyle(fontSize: 30),
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Type Password Here',
          labelText: 'Password',
          prefixIcon: Icon(Icons.filter_tilt_shift)),
    ));
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Login'),
      ),*/
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.network(
              Constants.LOGIN_BG,
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                          _createUserId(),
                          _createPwd(),
                          _createButton()
                        ],
                      ),
                      height: media.height * 0.50,
                      width: media.width * 0.95,
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(30)),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
      //backgroundColor: Colors.tealAccent,
    );
  }
}
