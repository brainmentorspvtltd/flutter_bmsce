import 'package:flutter/material.dart';

class Fifth extends StatelessWidget {
  _getSection(String url, String title, String desc, String time) {
    return Container(
      margin: EdgeInsets.all(3),
      child: Stack(
        children: [
          Image.network(url),
          Positioned(
              bottom: 0,
              //left: 5,
              //bottom: 10,
              //left: 10,
              child: Container(
                margin: EdgeInsets.only(right: 30),
                // margin: EdgeInsets.symmetric(horizontal: 40),
                width: deviceSize.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          desc,
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: 20,
                        ),
                        Text(
                          time,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  _getGap() {
    return SizedBox(height: 10);
  }

  Size deviceSize;
  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _getSection(
                  'https://media1.tenor.com/images/54603c681d37cecb2973e7974dea7f43/tenor.gif',
                  "Iron Man",
                  "I am the Iron Man",
                  "10:10"),
              //_getGap(),
              _getSection(
                  'https://media3.giphy.com/media/Ph5ELYJov9n5oHzVHZ/giphy.gif',
                  "He Man",
                  "I am the He Man",
                  "20:00"),
              // _getGap(),
              _getSection(
                  'https://i.pinimg.com/originals/a1/9d/5c/a19d5c20e7972fdda513d0aac7b0d025.gif',
                  "Tom and Jerry",
                  "We are the Tom and Jerry",
                  "23:00"),
            ],
          ),
        ),
      ),
    );
  }
}
