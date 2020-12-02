import 'dart:convert' as jsonParser;

import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:musicappbvp/models/Song.dart';
import 'package:musicappbvp/screens/musicplayer.dart';
import 'package:musicappbvp/utils/constants.dart';

class Music extends StatefulWidget {
  String singerName;
  Music(this.singerName);
  @override
  _MusicState createState() => _MusicState();
}

class _MusicState extends State<Music> {
  List<Song> songs = [];
  _callMusicPlayer(Song song) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => MusicPlayer(song)));
  }

  _fillSongs(List<dynamic> listOfSongs) {
    print("Fill Songs Call ${listOfSongs.runtimeType}");
    print(listOfSongs);
    // listOfSongs.map((e) => null)
    var tempsongs = listOfSongs.map((singleSong) {
      Song song = new Song();
      song.audioURL = singleSong['previewUrl'];
      song.name = singleSong['trackName'];
      song.aName = singleSong['collectionName'] ?? '';
      song.url = singleSong['artworkUrl60'];
      return song;
    }).toList();
    setState(() {
      songs = tempsongs;
    });
    print("SONGS ARE ::::: $songs");
    // listOfSongs.forEach((singleSong) => print(singleSong['collectionName']));
    //trackName,previewUrl
  }

  _loadSongs() {
    String url = Constants.getURL(widget.singerName);
    print("SINGER URL IS $url");
    Future<http.Response> future = http.get(url);
    future.then((response) {
      print("Response is ${response.body.runtimeType}");
      var map = jsonParser.jsonDecode(response.body);
      // print("Map is $map");
      _fillSongs(map['results']);
    }).catchError((err) => print("Error is $err"));
    print("Url is $url");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadSongs();
  }

  AudioPlayer _audioPlayer = AudioPlayer();

  void _playSong(String url) {
    _audioPlayer.stop();
    _audioPlayer.play(url);
  }

  List<Widget> printSongs() {
    return songs.map((song) {
      return Container(
        margin: EdgeInsets.all(10),
        child: Card(
          shadowColor: Colors.deepOrange,
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: ListTile(
                leading: Image.network(song.url),
                subtitle: Text(song.aName ?? ''),
                trailing: IconButton(
                    onPressed: () {
                      _callMusicPlayer(song);
                      //_playSong(song.audioURL);
                    },
                    icon: Icon(
                      Icons.play_circle_filled,
                      size: 30,
                      color: Colors.blue,
                    )),
                title: Text(song.name
                    // song.name
                    //   .substring(0, song.name.length > 30 ? 30 : song.name.length),
                    )),
          ),
        ),
      );
      /*
        Card(
        elevation: 5,
        //shape: ShapeBorder(),
        shadowColor: Colors.white60,
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Image.network(song.url),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                song.name.substring(
                    0, song.name.length > 30 ? 30 : song.name.length),
                softWrap: true,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(
                  Icons.play_circle_filled,
                  size: 30,
                  color: Colors.blue,
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ) */
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: printSongs(),
          ),
        ),
      ),
    );
  }
}
