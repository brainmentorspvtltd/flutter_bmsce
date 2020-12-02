import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mymusicapp/models/song.dart';
import 'package:mymusicapp/models/user.dart';
import 'package:mymusicapp/screens/login.dart';
import 'package:mymusicapp/screens/singlesong.dart';
import 'package:mymusicapp/utils/server.dart';
import 'package:toast/toast.dart';

class ListOfSongs extends StatefulWidget {
  User user;
  Function fn;
  ListOfSongs(this.user, this.fn);

  @override
  _ListOfSongsState createState() => _ListOfSongsState();
}

class _ListOfSongsState extends State<ListOfSongs> {
  List<Song> songs = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Async Way
    /* Future<http.Response> future = Server.collectSongs();
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
      setState(() {});
      print("Songs are $songs");
    }).catchError((err) => print("Error in Fetching Songs $err"));
    */
  }

  Future<List<Song>> _getSongs() async {
    http.Response response = await Server.collectSongs();
    String body = response.body;
    Map<String, dynamic> map = convert.jsonDecode(body);
    List<dynamic> listOfMap = map['results'];
    listOfMap.forEach((singleMap) {
      Song song = Song();
      song.title = singleMap['trackName'];
      song.imageURL = singleMap['artworkUrl100'];
      song.audioURL = singleMap['previewUrl'];
      song.subTitle = singleMap['collectionName'] ?? singleMap['artistName'];
      songs.add(song);
    });

    return songs;
  }

  _openPlayer(Song currentSong) {
    // AudioPlayer
    // currentSong.isPlaying = !currentSong.isPlaying;
    //setState(() {});
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => SingleSong(currentSong)));
  }

  Widget _createSingleSong(int index) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      child: Card(
        child: ListTile(
          leading: Image.network(songs[index].imageURL ?? ''),
          subtitle: Text(songs[index].subTitle ?? ''),
          trailing: IconButton(
              onPressed: () {
                _openPlayer(songs[index]);
              },
              icon: Icon(
                songs[index].isPlaying ? Icons.pause : Icons.play_circle_fill,
                size: 30,
                color: Colors.blue,
              )),
          title: Text(songs[index].title ?? '', style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 5,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blueAccent),
              accountEmail: Text(
                widget.user.email,
                style: TextStyle(fontSize: 20),
              ),
              accountName: Text(
                widget.user.userid,
                style: TextStyle(fontSize: 20),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(widget.user.photo),
                // child: Image.network(widget.user.photo),
              ),
            ),
            InkWell(
              onTap: () async {
                await widget.fn();
                Toast.show('U Logout SuccessFully', context, duration: 3);
                Future.delayed(Duration(seconds: 4),(){
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (ctx) => Login()));
                });

              },
              child: ListTile(
                title: Text(
                  'Logout',
                  style: TextStyle(fontSize: 22),
                ),
                leading: Icon(
                  Icons.logout,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            )
            // Container(
            //   width: 300,
            //   height: 300,
            //   decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       image: DecorationImage(
            //           image: NetworkImage(widget.user.photo, scale: 2))),
            // ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Songs List'),
      ),
      body: Container(
        color: Colors.yellowAccent,
        child: FutureBuilder(
          future: _getSongs(),
          builder: (BuildContext btx, AsyncSnapshot snapShot) {
            if (!snapShot.hasData) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (snapShot.hasError) {
              return Center(child: Text('Some Thing Went Wrong on Server'));
            }
            return ListView.builder(
              itemCount: songs.length,
              itemBuilder: (BuildContext ctx, int index) {
                return _createSingleSong(index);
              },
            );
          },
          // child: ListView.builder(
          //   itemCount: songs.length,
          //   itemBuilder: (BuildContext ctx, int index) {
          //     return _createSingleSong(index);
          //   },
          // ),
        ),
      ),
    );
  }
}
