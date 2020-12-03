import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mymusicapp/db/dboperations.dart';

class ListOfUsers extends StatefulWidget {
  @override
  _ListOfUsersState createState() => _ListOfUsersState();
}

class _ListOfUsersState extends State<ListOfUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: DbOperations.readRealTime(),
        builder: (BuildContext ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Some Error in Stream'));
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data != null ? snapshot.data.docs.length : 0,
            itemBuilder: (BuildContext bt, int index) {
              return ListTile(
                leading: Icon(Icons.person),
                title: Text(snapshot.data.docs[index]['email']),
                subtitle: Text(snapshot.data.docs[index]['phone']),
              );
            },
          );
        },
      ),
    );
  }
  /* @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: DbOperations.readAllUsers(),
        builder: (BuildContext ctx, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error Occur During Fetching the Data',
                style: TextStyle(fontSize: 32),
              ),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data != null ? snapshot.data.length : 0,
            itemBuilder: (BuildContext bt, int index) {
              return ListTile(
                leading: Icon(Icons.person),
                title: Text(snapshot.data[index]['email']),
                subtitle: Text(snapshot.data[index]['phone']),
              );
            },
          );
        },
      ),
    );
  }*/
}
