import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mymusicapp/models/song.dart';
import 'package:mymusicapp/utils/server.dart';

class ListOfSongs extends StatefulWidget {
  @override
  _ListOfSongsState createState() => _ListOfSongsState();
}

class _ListOfSongsState extends State<ListOfSongs> {
  List<Song> songs = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future<http.Response> future = Server.collectSongs();
    future.then((response) {
      String body = response.body;
      Map<String, dynamic> map = convert.jsonDecode(body);
      List<dynamic> listOfMap = map['results'];
      listOfMap.forEach((singleMap) {
        Song song = Song();
        song.title = singleMap['trackName'];
        song.imageURL = singleMap['artworkUrl100'];
        song.audioURL = singleMap['previewUrl'];
        song.subTitle = singleMap['collectionName'];
        songs.add(song);
      });
      print("Songs are $songs");
    }).catchError((err) => print("Error in Fetching Songs $err"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Songs List'),
      ),
      body: Container(
        color: Colors.cyanAccent,
      ),
    );
  }
}
