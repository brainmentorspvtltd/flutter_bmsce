// Widget
import 'package:flutter/material.dart';

class First extends StatelessWidget {
  AppBar _appBar() {
    return AppBar(
      leading: Icon(
        Icons.menu,
        color: Colors.black,
        size: 26,
      ),
      actions: <Widget>[
        Padding(
          child: Icon(Icons.email),
          padding: EdgeInsets.only(right: 20),
        ),
        Padding(
          child: Icon(Icons.phone),
          padding: EdgeInsets.only(right: 20),
        )
      ],
      backgroundColor: Colors.blueAccent,
      title: Text(
        'Dead Pool',
        style: TextStyle(fontSize: 28),
      ),
    );
  }

  TextStyle _getStyle() {
    return TextStyle(
        fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);
  }

  SafeArea _bodyDesign(Size deviceSize) {
    return SafeArea(
      child: Center(
        child: Container(
          width: deviceSize.width,
          height: deviceSize.height,
          child: Padding(
            padding: EdgeInsets.all(50),
            child: Image.asset(LOCAL_IMG)
            //child: Image.network(URL)
            /*child: Text(
                'Hello Flutter',
                style: _getStyle(),
              ) */
            ,
          ),
          color: Colors.yellow,
        ),
      ),
    );
  }

  final String LOCAL_IMG = "assets/images/deadpool.png";
  @override
  Widget build(BuildContext context) {
    const String URL =
        "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F6%2F2019%2F10%2Fmcddead_fe005-2000.jpg";
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: _appBar(),
      // body: _bodyDesign(deviceSize),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.red,
            Colors.green,
            Colors.yellow,
            Colors.blue
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          //color: Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage(LOCAL_IMG),
                radius: 200,
                backgroundColor: Colors.white,
              ),
              Divider(
                height: 20,
              ),
              Text(
                'DEAD POOL',
                style: _getStyle(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Icon(
                      Icons.phone,
                      size: 30,
                      color: Colors.tealAccent,
                    ),
                  ),
                  Text(
                    '000000',
                    style: _getStyle(),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.email,
                    size: 30,
                    color: Colors.deepPurple,
                  ),
                  Text(
                    'deadpool@dead.com',
                    style: _getStyle(),
                  )
                ],
              )
            ],
            //children: <Widget>[Image.network(URL)],
          ),
        ),
      ),
    );
  }
}
