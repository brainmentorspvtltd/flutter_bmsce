import 'package:audioplayers/audioplayers.dart';
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
  AudioPlayer audioPlayer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initAudioPlayer();
    playSong(widget.song.audioURL);
  }

  Duration _songDuration;
  Duration _currentDuration;

  bool _isPlaying = false;
  void _initAudioPlayer() {
    audioPlayer = AudioPlayer();
    audioPlayer.onDurationChanged.listen((event) {
      _songDuration = event;
      setState(() {});
    });
    audioPlayer.onAudioPositionChanged.listen((event) {
      _currentDuration = event;
      setState(() {});
    });
    audioPlayer.onPlayerCompletion.listen((event) {
      _isPlaying = false;
      setState(() {});
    });
  }

  final int SUCCESS = 1;
  void playSong(String urlOfTheSong) async {
    int response = await audioPlayer.play(urlOfTheSong);
    if (response == SUCCESS) {
      _isPlaying = true;
      setState(() {});
    } else {}
  }

  void pauseSong() async {
    int response = await audioPlayer.pause();
    if (response == 1) {
      _isPlaying = false;
      setState(() {});
    } else {}
  }

  void stopSong() async {
    int response = await audioPlayer.stop();
    if (response == 1) {
      setState(() {
        _isPlaying = false;
      });
    } else {}
  }

  void resumeSong() async {
    int response = await audioPlayer.resume();
    if (response == 1) {
      setState(() {
        _isPlaying = true;
      });
    } else {}
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.dispose();
  }

  double _getSliderValue() {
    // print(
    //"FULL " + _currentDuration.toString() + " " + _songDuration.toString());
    // print(
    // 'CD ${_currentDuration.inMilliseconds} TD ${_songDuration.inMilliseconds}');
    return (_currentDuration != null &&
            _songDuration != null &&
            _currentDuration.inMilliseconds > 0 &&
            _currentDuration.inMilliseconds < _songDuration.inMilliseconds)
        ? _currentDuration.inMilliseconds / _songDuration.inMilliseconds
        : 0.0;
  }

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
          ),
          Slider(
              value: _getSliderValue(),
              onChanged: (currentValue) {
                final postion = currentValue * _songDuration.inMilliseconds;
                audioPlayer.seek(Duration(milliseconds: postion.round()));
              }),
          SizedBox(
            height: 10,
          ),
          Text(
            (_currentDuration != null
                    ? _currentDuration.toString().split(".").first
                    : '00:00:00') +
                "/" +
                (_songDuration != null
                    ? _songDuration.toString().split(".").first
                    : '00:00:00'),
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.volume_off,
                    size: 30,
                  ),
                  onPressed: () async {
                    await audioPlayer.setVolume(0.0);
                  }),
              IconButton(
                  icon: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 30,
                  ),
                  onPressed: () async {
                    if (_isPlaying) {
                      pauseSong();
                    } else {
                      resumeSong();
                    }
                  }),
              IconButton(
                  icon: Icon(
                    Icons.stop,
                    size: 30,
                    color: Colors.red,
                  ),
                  onPressed: () async {
                    stopSong();
                  }),
              IconButton(
                  icon: Icon(
                    Icons.volume_up,
                    size: 30,
                    color: Colors.green,
                  ),
                  onPressed: () async {
                    audioPlayer.setVolume(1.0);
                  })
            ],
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            onPressed: () {},
            child: Text(
              'Add to PlayList',
              style: TextStyle(fontSize: 30),
            ),
            elevation: 5,
            padding: EdgeInsets.all(10),
            color: Colors.greenAccent,
          )
        ],
      ),
    );
  }
}
