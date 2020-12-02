import 'dart:convert' as convert;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:musicappbvp/local/search_audio_files.dart';
import 'package:musicappbvp/screens/music.dart';
import 'package:musicappbvp/screens/playlist.dart';
import 'package:musicappbvp/utils/constants.dart';
import 'package:musicappbvp/utils/token.dart';

class ArtistScreen extends StatefulWidget {
  User _user;
  FirebaseAuth _auth;
  ArtistScreen(User userObject, FirebaseAuth _auth) {
    this._user = userObject;
    this._auth = _auth;
  }
  @override
  _ArtistScreenState createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  _getStyle() {
    return TextStyle(fontSize: 16, color: Colors.black);
  }

  _signOut() async {
    if (widget._auth != null) {
      await widget._auth.signOut();
    }
  }

  _getDrawer() {
    return Drawer(
        elevation: 5,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(widget._user.photoURL),
              ),
              accountEmail: Text(
                widget._user.email,
                style: _getStyle(),
              ),
              accountName: Text(
                widget._user.displayName,
                style: _getStyle(),
              ),
              decoration: BoxDecoration(color: Colors.tealAccent),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => PlayList()));
              },
              leading: Icon(
                Icons.library_music,
                color: Colors.black,
                size: 30,
              ),
              title: Text(
                'My PlayList',
                style: _getStyle(),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.monetization_on,
                color: Colors.black,
                size: 30,
              ),
              title: Text(
                'Subscribe',
                style: _getStyle(),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.black,
                size: 30,
              ),
              title: Text(
                'Profile',
                style: _getStyle(),
              ),
            ),
            ListTile(
              onTap: () {
                _signOut();
              },
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.black,
                size: 30,
              ),
              title: Text(
                'SignOut',
                style: _getStyle(),
              ),
            ),
            ListTile(
              title: Text(
                'Local Songs',
                style: TextStyle(fontSize: 30),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => SearchAudioFiles()));
              },
              leading: Icon(
                Icons.library_music,
                size: 30,
              ),
            )
          ],
        ));
  }

  Future<List<dynamic>> _getAllSingers() async {
    http.Response response = await http.get(Constants.SINGERS_INFO_URL);
    String json = response.body;
    Map<String, dynamic> map = convert.jsonDecode(json);
    List<dynamic> list = map['singers'];
    return list;
  }

  _fetchTheToken() async {
    String token = await Token.readToken();
    // Call FireBase and pass the token
  }

  _printOneSinger(var singer, int index) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () {
                String singerName = singer[index]['name'];
                print("CURRENT SINGER NAME IS $singerName");
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => Music(singerName)));
              },
              hoverColor: Colors.white,
              splashColor: Colors.white,
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.purpleAccent, width: 3)),
                width: 150,
                height: 150,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(singer[index]['photo']),
                ),
              ),
            ),
          ),
          Container(
            child: Text(
              singer[index]['name'],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  _printGrid(AsyncSnapshot snapShot) {
    return GridView.builder(
      itemCount: snapShot.data.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext ctx, int index) {
        return _printOneSinger(snapShot.data, index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _getDrawer(),
      appBar: AppBar(
        title: Text('Artists'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.orange,
              Colors.pinkAccent,
              Colors.yellowAccent,
              Colors.tealAccent,
              Colors.black
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          ),
          FutureBuilder(
            future: _getAllSingers(),
            builder: (BuildContext ctx, AsyncSnapshot snapShot) {
              // Not present
              if (snapShot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              // Present
              return _printGrid(snapShot);
            },
          )
        ],
      ),
    );
  }
}
