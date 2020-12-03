import 'package:flutter/material.dart';

class Three extends StatefulWidget {
  @override
  _ThreeState createState() => _ThreeState();
}

class _ThreeState extends State<Three> {
  int index = 0;
  Widget firstScreen() {
    return Container(
      child: Text(
        'First Screen ',
        style: TextStyle(fontSize: 32),
      ),
    );
  }

  Widget secondScreen() {
    return ListView.builder(
      itemBuilder: (BuildContext ctx, int index) {
        return ListTile(
          leading: Icon(
            Icons.account_circle,
            size: 30,
            color: Colors.redAccent,
          ),
          title: Text(
            "Person $index",
            style: TextStyle(fontSize: 32),
          ),
        );
      },
      itemCount: 100,
    );
  }

  Widget thirdScreen() {
    return Container(
      child: Center(
          child: FlutterLogo(
        size: 250,
      )),
    );
  }

  List<Widget> getTabs() {
    List<Widget> tabs = [firstScreen(), secondScreen(), thirdScreen()];
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (int currentIndex) {
          index = currentIndex;
          setState(() {});
        },
        elevation: 5,
        backgroundColor: Colors.tealAccent,
        iconSize: 22,
        selectedFontSize: 24,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
                color: Colors.black,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30,
                color: Colors.black,
              ),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.email,
                size: 30,
                color: Colors.black,
              ),
              label: 'Email')
        ],
      ),
      body: SafeArea(
        child: getTabs()[index],
      ),
    );
  }
}
