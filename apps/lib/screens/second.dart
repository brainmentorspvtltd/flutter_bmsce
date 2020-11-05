import 'dart:math';

import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          transform: Matrix4.rotationZ(pi / 9),
          decoration: BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.black, width: 5)),
          padding: EdgeInsets.all(30),
          margin: EdgeInsets.only(
              top: deviceSize.height / 6, left: deviceSize.width / 3),
          height: deviceSize.height / 2,
          width: deviceSize.width / 2,
          // color: Colors.tealAccent,
          child: Text(
            'Hello Flutter',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
      // body: Center(
      //   child: Text(
      //     'Hello Flutter',
      //     style: TextStyle(fontSize: 30),
      //   ),
      // ),
    );
    //return Icon(Icons.search, size: 30, color: Colors.white);
    // return Image.network(
    //     'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F6%2F2019%2F10%2Fmcddead_fe005-2000.jpg');
    // //Text('Hello Flutter');
  }
}
