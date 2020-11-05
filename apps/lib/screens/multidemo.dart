import 'package:flutter/material.dart';

class Multi extends StatelessWidget {
  _getContainer(String str, Color color) {
    return Container(
      width: 100,
      height: 100,
      //color: color,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.redAccent,
        Colors.lightGreenAccent,
        Colors.blueAccent
      ])),
      child: Text(
        str,
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  _getImage({int flex = 1}) {
    const url =
        'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F6%2F2019%2F10%2Fmcddead_fe005-2000.jpg';
    return Expanded(
      flex: flex,
      child: Container(
        width: 200,
        height: 200,
        child: Image.network(url),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          //crossAxisAlignment: CrossAxisAlignment.baseline,
          //textBaseline: TextBaseline.alphabetic,
          // textBaseline: TextBaseline.ideographic,
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //mainAxisAlignment: MainAxisAlignment.end,
          //mainAxisAlignment: MainAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network(
                  'https://media1.tenor.com/images/54603c681d37cecb2973e7974dea7f43/tenor.gif?itemid=16430080'),
            )
            // _getContainer("Hi", Colors.black12)
            //_getImage(),
            //_getImage(flex: 3),
            //_getImage(flex: 2)
            /*Text(
              '你好',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              'Hi',
              style: TextStyle(fontSize: 20),
            )*/
            // _getContainer("First", Colors.red),
            // _getContainer("Second", Colors.blue),
            // _getContainer("Third", Colors.green)
          ],
        ),
      ),
    );
  }
}
