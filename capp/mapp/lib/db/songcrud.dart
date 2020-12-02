import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:musicappbvp/models/Song.dart';

class SongCRUD {
  //static final temp = Firebase.initializeApp();
  // Step -1 DB Ref
  static final dbRef = FirebaseFirestore.instance;

  static Future<bool> addNewSong(Song song) async {
    DocumentReference docRef = await dbRef.collection('songs').add({
      'trackName': song.name,
      'albumName': song.aName,
      'photo': song.url,
      'audio': song.audioURL
    });
    print("DB Ref is ${docRef.id}");
    return true;
  }

  static List<Song> _convertToSongList(QuerySnapshot snapshot) {
    List<Song> songs = snapshot.docs.map((doc) {
      Song song = Song();
      song.name = doc['trackName'];
      song.aName = doc['albumName'];
      song.url = doc['photo'];
      song.audioURL = doc['audio'];
      return song;
    });
    return songs;
  }

  // Future
  static Future<List<Song>> getPlayList() async {
    QuerySnapshot snapShot = await dbRef.collection('songs').get();
    List<Song> songList = _convertToSongList(snapShot);
    return songList;
  }

  // Stream
  static Stream<QuerySnapshot> getPlayListStream() {
    Stream<QuerySnapshot> snapShot = dbRef.collection('songs').snapshots();
    print("SNAP SHOT STREAM ");
    print(snapShot);
    return snapShot;
    //List<Song> songList = _convertToSongList(snapShot);
    //return songList;
  }
}
