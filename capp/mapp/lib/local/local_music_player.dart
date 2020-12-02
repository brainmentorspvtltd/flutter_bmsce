import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../utils/wave.dart';

import '../models/Song.dart';

class LocalMusicPlayer extends StatefulWidget {
  final String localFilePath;
  LocalMusicPlayer({this.localFilePath});

  @override
  _LocalMusicPlayerState createState() => _LocalMusicPlayerState();
}

class _LocalMusicPlayerState extends State<LocalMusicPlayer>
    with TickerProviderStateMixin {
  bool _isPlaying = false;
  AudioPlayer audioPlayer;
  Duration _duration;
  Duration _position;
  get _durationText => _duration?.toString()?.split('.')?.first ?? '';
  get _positionText => _position?.toString()?.split('.')?.first ?? '';
  @override
  void initState() {
    _initAudioPlayer();
    playAudio(widget.localFilePath);

    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void _initAudioPlayer() {
    audioPlayer = AudioPlayer();

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

    audioPlayer.onAudioPositionChanged.listen((p) => setState(() {
          _position = p;
        }));
  }

  playAudio(path) async {
    int response = await audioPlayer.play(path);
    if (response == 1) {
      // success
      setState(() {
        _isPlaying = true;
      });
    } else {
      print('Some error occured in playing from storage!');
    }
  }

  pauseAudio() async {
    int response = await audioPlayer.pause();
    if (response == 1) {
      // success
      setState(() {
        _isPlaying = false;
      });
    } else {
      print('Some error occured in pausing');
    }
  }

  stopAudio() async {
    int response = await audioPlayer.stop();
    if (response == 1) {
      // success
      setState(() {
        _isPlaying = false;
      });
    } else {
      print('Some error occured in stopping');
    }
  }

  resumeAudio() async {
    int response = await audioPlayer.resume();
    if (response == 1) {
      // success
      setState(() {
        _isPlaying = true;
      });
    } else {
      print('Some error occured in resuming');
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.blueGrey,
              height: height * 0.40,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    height: 190,
                    width: 190,
                    decoration: new BoxDecoration(
                      border: Border.all(color: Colors.white, width: 5),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            AnimatedOpacity(
              opacity: _isPlaying ? 1.0 : 0.0,
              duration: Duration(seconds: 1),
              child: Wave(
                size: Size(MediaQuery.of(context).size.width, 50),
                isPlaying: _isPlaying,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${widget.localFilePath}",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${widget.localFilePath}",
              overflow: TextOverflow.ellipsis,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Stack(
                    children: [
                      Slider(
                        onChanged: (v) {
                          final Position = v * _duration.inMilliseconds;
                          audioPlayer
                              .seek(Duration(milliseconds: Position.round()));
                        },
                        value: (_position != null &&
                                _duration != null &&
                                _position.inMilliseconds > 0 &&
                                _position.inMilliseconds <
                                    _duration.inMilliseconds)
                            ? _position.inMilliseconds /
                                _duration.inMilliseconds
                            : 0.0,
                      ),
                    ],
                  ),
                ),
                Text(
                  _position != null
                      ? '${_positionText ?? ''} / ${_durationText ?? ''}'
                      : _duration != null
                          ? _durationText
                          : '',
                  style: TextStyle(fontSize: 24.0),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                    if (_isPlaying == true) {
                      pauseAudio();
                    } else {
                      resumeAudio();
                    }
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.stop,
                    size: 30,
                  ),
                  onPressed: () {
                    stopAudio();
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
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
