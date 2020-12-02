import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import './local_music_player.dart';

class SearchAudioFiles extends StatefulWidget {
  @override
  _SearchAudioFilesState createState() => _SearchAudioFilesState();
}

class _SearchAudioFilesState extends State<SearchAudioFiles> {
  String directory;
  PermissionStatus _permissionStatus;
  @override
  void initState() {
    super.initState();
    checkPermission();
  }

  checkPermission() async {
    // Either the permission was already granted before or the user just granted it.
    if (await Permission.storage.request().isGranted) {
      _listOfSongs();
    }
    if (await Permission.storage.isPermanentlyDenied) {
      // The user opted to never again see the permission request dialog for this
      // app. The only way to change the permission's status now is to let the
      // user manually enable it in the system settings.
      //openAppSettings();
    }
  }

// get local songs list from entire android
  Future<List<String>> _listOfSongs() async {
    List<String> _songs = List();
    Completer _completer = Completer<List<String>>();
    Directory dir = Directory('/storage/emulated/0/');
    String mp3Path = dir.toString();
    print(mp3Path);
    List<FileSystemEntity> _files;
    _files = dir.listSync(recursive: true, followLinks: false);
    for (FileSystemEntity entity in _files) {
      String path = entity.path;
      if (path.endsWith('.mp3')) _songs.add(path);
    }
    _completer.complete(_songs);
    await Future.delayed(Duration(seconds: 2));
    return _completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local MP3 Files"),
      ),
      body: FutureBuilder<List<String>>(
        future: _listOfSongs(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<String> _songs = snapshot.data;
            return Container(
              child: ListView.builder(
                  itemCount: _songs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LocalMusicPlayer(
                                      localFilePath: _songs[index],
                                    )));
                      },
                      title: Text(_songs[index]),
                    );
                  }),
            );
          }
          return Center(
            child: Text("Please Wait.."),
          );
        },
      ),
    );
  }
}
