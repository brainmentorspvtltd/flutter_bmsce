import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:musicappbvp/db/songcrud.dart';

import '../models/Song.dart';

class MusicPlayer extends StatefulWidget {
  Song song; // Current Song
  MusicPlayer(Song song) {
    this.song = song;
  }
  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  double currentVol = 0.0;
  bool _isPlaying = false;
  AudioPlayer audioPlayer;
  Duration _duration;
  Duration _position;

  @override
  initState() {
    super.initState();
    _initAudioPlayer();
  }

  play() async {
    int result = await audioPlayer.play(widget.song.audioURL);

    if (result == 1) {
      // success
      setState(() {
        _isPlaying = true;
      });
    }
  }

  pause() async {
    int result = await audioPlayer.pause();
    if (result == 1) {
      // success
      setState(() {
        _isPlaying = false;
      });
    }
  }

  stop() async {
    int result = await audioPlayer.stop();
    if (result == 1) {
      // success
      setState(() {
        _isPlaying = false;
      });
    }
  }

  resume() async {
    int result = await audioPlayer.resume();
    if (result == 1) {
      // success
      setState(() {
        _isPlaying = true;
      });
    }
  }

  _initAudioPlayer() {
    audioPlayer = AudioPlayer();
    // Register the Listener
    audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _duration = duration;
      });
    });
    audioPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        _isPlaying = false;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((position) {
      setState(() {
        _position = position;
      });
    });
  }

  _addInPlayList() async {
    bool result = await SongCRUD.addNewSong(widget.song);
    String msg = "";
    if (result) {
      msg = "Song Added in PlayList SuccessFully";
    } else {
      msg = "Problem in Song Add in PlayList";
    }
    Fluttertoast.showToast(
        msg: msg,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  _getGap() {
    return SizedBox(
      height: 10,
    );
  }

  _getStyle([double size = 30]) {
    return TextStyle(fontSize: size, fontWeight: FontWeight.bold);
  }

  _getSongBox() {
    return Container(
      color: Colors.blueGrey,
      width: width,
      height: height * 0.40,
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          Container(
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.song.url),
              ),
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              )),
        ],
      ),
    );
  }

  Size size;
  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          _getSongBox(),
          _getGap(),
          Text(
            widget.song.name,
            style: _getStyle(),
          ),
          _getGap(),
          Text(
            widget.song.aName ?? '',
            style: _getStyle(20),
          ),
          _getGap(),
          Slider(
            onChanged: (currentValue) {
              final pos = currentValue * _duration.inMilliseconds;
              audioPlayer.seek(Duration(milliseconds: pos.round()));
            },
            value: (_position != null &&
                    _duration != null &&
                    _position.inMilliseconds > 0 &&
                    _position.inMilliseconds < _duration.inMilliseconds)
                ? _position.inMilliseconds / _duration.inMilliseconds
                : 0.0,
            // Fixed
//            max: 20,
//            value: 10,
//            min: 1,
          ),
          _getGap(),
          Text(
            _position != null
                ? "${_position.toString().split(".").first}/${_duration.toString().split(".").first}"
                : "0.0",
            style: _getStyle(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.volume_off,
                  size: 30,
                ),
                onPressed: () async {
                  await audioPlayer.setVolume(0.0);
                },
              ),
              IconButton(
                icon: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 30,
                ),
                onPressed: () {
                  if (_isPlaying) {
                    pause();
                  } else {
                    play();
                  }
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.stop,
                  size: 30,
                ),
                onPressed: () {
                  stop();
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.volume_up,
                  size: 30,
                ),
                onPressed: () async {
                  await audioPlayer.setVolume(1.0);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.volume_up,
                  color: Colors.green,
                  size: 30,
                ),
                onPressed: () async {
                  currentVol++;
                  print("CUrrent VOl $currentVol");
                  await audioPlayer.setVolume(currentVol);
                },
              )
            ],
          ),
          _getGap(),
          RaisedButton(
            color: Colors.lightGreen,
            onPressed: () {
              _addInPlayList();
            },
            child: Text(
              'Add to PlayList',
              style: _getStyle(20),
            ),
          )
        ],
      )),
    );
  }
}
