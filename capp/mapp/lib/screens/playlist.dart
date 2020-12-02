import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:musicappbvp/db/songcrud.dart';

class PlayList extends StatefulWidget {
  @override
  _PlayListState createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  _printOneSong(QuerySnapshot song, int index) {
//    print("SONG REC ");
//    print(song.docs[index].get('photo'));
//    print(song.docs[index].get('trackName'));
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        elevation: 5,
        shadowColor: Colors.purpleAccent,
        child: ListTile(
          leading: Image.network(song.docs[index].get('photo')),
          title: Text(song.docs[index].get('trackName')),
          subtitle: Text((song.docs[index].get('albumName')) ?? ''),
          trailing: IconButton(
            icon: Icon(
              Icons.play_circle_filled,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      appBar: AppBar(),
      body: StreamBuilder(
        stream: SongCRUD.getPlayListStream(),
        builder: (BuildContext ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Some Error Occur During Fetch',
                style: TextStyle(fontSize: 30),
              ),
            );
          }
          return ListView.builder(
              itemBuilder: (BuildContext ct, int index) {
                print("Inside ListView Builder ");
                print(snapshot.data);
                return _printOneSong(snapshot.data, index);
              },
              itemCount: snapshot.data.docs.length);
        },
      ),
    );
  }
}
