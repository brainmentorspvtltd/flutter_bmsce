import 'package:flutter/material.dart';

class Two extends StatefulWidget {
  @override
  _TwoState createState() => _TwoState();
}

class _TwoState extends State<Two> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> friends = [];
  _loadFriends() {
    friends..add("ram")..add("shyam")..add("mike")..add("tim");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadFriends();
  }

  showSnackBar(String currentName, int index) {
    SnackBar snackBar = SnackBar(
      content: Text('$currentName is Deleted'),
      elevation: 5,
      backgroundColor: Colors.purpleAccent,
      duration: Duration(seconds: 6),
      action: SnackBarAction(
        label: 'UNDO',
        onPressed: () {
          friends.insert(index, currentName);
          setState(() {});
        },
      ),
    );
    // Scaffold.of(context).showSnackBar(SnackBar(
    //   content: Text('$currentName is Deleted'),
    //   elevation: 5,
    //   backgroundColor: Colors.purpleAccent,
    //   duration: Duration(seconds: 3),
    // ));

    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  int counter = 1;
  Future<Null> addNewFriend() async {
    await Future.delayed(Duration(seconds: 3), () {
      friends.add('NEW FRIEND $counter');
      counter++;
      setState(() {});
    });

    return null;
  }

  _openBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext ctx) {
          return Container(
            color: Colors.yellowAccent,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text('Email'),
                  onTap: () {},
                ),
                Divider(
                  color: Colors.black,
                  thickness: 2,
                  height: 3,
                ),
                ListTile(
                  leading: Icon(Icons.thumb_up),
                  title: Text('Like'),
                  onTap: () {},
                ),
                Divider(
                  color: Colors.black,
                  thickness: 2,
                  height: 3,
                ),
                ListTile(
                  leading: Icon(Icons.comment),
                  title: Text('Comments'),
                  onTap: () {},
                ),
                Divider(
                  color: Colors.black,
                  thickness: 2,
                  height: 3,
                ),
                ListTile(
                  leading: Icon(Icons.call),
                  title: Text('Call'),
                  onTap: () {},
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        splashColor: Colors.purpleAccent,
        child: Icon(
          Icons.mic,
          size: 40,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5.0,
        shape: CircularNotchedRectangle(),
        color: Colors.redAccent,
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.menu,
                  size: 30,
                ),
                onPressed: () {
                  _openBottomSheet();
                },
              ),
              Icon(
                Icons.search,
                size: 30,
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('LIST'),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: addNewFriend,
          child: ListView.builder(
            itemBuilder: (BuildContext ctx, int index) {
              return Dismissible(
                background: Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.delete_forever,
                    size: 32,
                    color: Colors.redAccent,
                  ),
                ),
                key: Key(friends[index]),
                onDismissed: (direction) {
                  String currentFriend = friends[index];
                  friends.remove(currentFriend);
                  setState(() {});
                  showSnackBar(currentFriend, index);
                },
                child: ListTile(
                  title: Text(friends[index]),
                  leading: Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              );
            },
            itemCount: friends.length,
          ),
        ),
      ),
    );
  }
}
