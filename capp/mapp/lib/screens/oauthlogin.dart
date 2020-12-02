import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:musicappbvp/utils/constants.dart';
import 'package:musicappbvp/utils/token.dart';

import 'artistscreen.dart';

class OAuthLogin extends StatefulWidget {
  @override
  _OAuthLoginState createState() => _OAuthLoginState();
}

class _OAuthLoginState extends State<OAuthLogin> {
  FirebaseAuth _auth =
      FirebaseAuth.instance; // Create Object of Firebase Authentication
  GoogleSignIn _googleSignIn = GoogleSignIn();
  _loginWithGmail() async {
    GoogleSignInAccount _googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication _googleSignInAuth =
        await _googleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: _googleSignInAuth.accessToken,
        idToken: _googleSignInAuth.idToken);
    UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    User userObject = userCredential.user;
    print("User Info  is $userObject");
    //userObject.refreshToken;
    //userObject.uid
    String token = await userObject.getIdToken();
    Token.generateToken(token);
    Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => ArtistScreen(userObject, _auth)));

    //return userObject;
  }

  _loginWithFB() {}

  _createButton(String txt, String url, Function fn) {
    return Center(
      child: Container(
        width: deviceSize.width * 0.75,
        height: deviceSize.height * 0.10,
        child: RaisedButton(
          color: Colors.tealAccent,
          onPressed: () {
            fn();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                child: Image.network(url),
              ),
              Text(
                txt,
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }

  Size deviceSize;
  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.network(Constants.LEFT_BORDER),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.network(Constants.RIGHT_BORDER),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _createButton("Login", Constants.GOOGLE_ICON, _loginWithGmail),
                Divider(height: 50),
                _createButton("Login", Constants.FB_ICON, _loginWithFB)
              ],
            )
          ],
        ),
      ),
    );
  }
}
