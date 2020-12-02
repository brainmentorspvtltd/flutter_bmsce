import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:musicappbvp/models/Song.dart';

import 'local/local_music_player.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Aug 2020
  Song song = Song();
  song.audioURL = 'ghjhgdfjkhg';
  song.name = "AAAAA";
  song.aName = "BBBB";
  song.url =
      "https://flutter.dev/assets/flutter-lockup-1caf6476beed76adec3c477586da54de6b552b2f42108ec5bc68dc63bae2df75.png";

  //For Testing Purpose
  //print(await SongCRUD.addNewSong() ? "Added " : "Not Added");
  runApp(MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MusicApp',
          home: LocalMusicPlayer())
      //home: Music()
      // home: SplashScreen())
      // home: MusicPlayer(song)));
      );
}
