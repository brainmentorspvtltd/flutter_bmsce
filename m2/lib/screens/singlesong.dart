import 'package:flutter/material.dart';
import 'package:mymusicapp/models/song.dart';

class SingleSong extends StatefulWidget {
  Song song;
  SingleSong(Song song) {
    this.song = song;
  }
  @override
  _SingleSongState createState() => _SingleSongState();
}

class _SingleSongState extends State<SingleSong> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            color: Colors.blueGrey,
            height: deviceSize.height * 0.35,
            width: deviceSize.width,
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueGrey,
                  border: Border.all(color: Colors.white, width: 5)),
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      widget.song.imageURL ?? '',
                    ),
                    radius: 100,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.song.title ?? '',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            widget.song.subTitle ?? '',
            style: TextStyle(fontSize: 22),
          )
        ],
      ),
    );
  }
}
