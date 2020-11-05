import 'package:flutter/material.dart';

class FourthDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.lightGreenAccent,
            Colors.yellow,
            Colors.orange,
            Colors.pinkAccent,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  //fit: StackFit.expand,
                  children: [
                    CircleAvatar(
                      radius: 150,
                      backgroundImage: NetworkImage(
                          'https://venturebeat.com/wp-content/uploads/2018/09/ironman.jpg'),
                      // child: Image.network(
                      //     'https://venturebeat.com/wp-content/uploads/2018/09/ironman.jpg'),
                    ),
                    Positioned(
                      top: 20,
                      left: 100,
                      child: Text(
                        'IronMan',
                        style: TextStyle(
                            fontSize: 30, color: Colors.lightGreenAccent),
                      ),
                    ),
                    Positioned(
                        bottom: 20,
                        left: 100,
                        child: RaisedButton(
                          color: Colors.cyan,
                          child: Text('PLAY'),
                          onPressed: () {},
                        ))
                  ],
                ),
                Card(
                  shadowColor: Colors.black,
                  margin: EdgeInsets.all(20),
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'I am Iron Man',
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
