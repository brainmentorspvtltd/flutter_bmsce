import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mymusicapp/db/dboperations.dart';
import 'package:mymusicapp/models/user.dart';
import 'package:mymusicapp/utils/constants.dart';
import 'package:toast/toast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Size deviceSize;
  void _showMessage(String message) {
    Toast.show(message, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  }

  _getAllUsersButton() {
    return GestureDetector(
      onTap: () async {
        Future<QuerySnapshot> futureQuerySnapShot = DbOperations.readAllUsers();
        futureQuerySnapShot.then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                print(
                    "Doc is ${doc['userid']} Password ${doc['password']} Email ${doc['email']} Phone ${doc['phone']}");
              })
            });
        //_showMessage(result);
      },
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
                'Get All Users',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }

  _createRegisterButton() {
    return GestureDetector(
      onTap: () async {
        String result = await DbOperations.addUser(
            User.takeUser('shyam', '2222', 'shyam@gmail.com', '22222'));
        _showMessage(result);
      },
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
                'Register Here',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }

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
                    _getAllUsersButton(),
                    SizedBox(height: 20),
                    _createRegisterButton(),
                    SizedBox(height: 20),
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
