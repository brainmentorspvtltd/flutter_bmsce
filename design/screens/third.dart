import 'package:flutter/material.dart';

class Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const url =
        'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F6%2F2019%2F10%2Fmcddead_fe005-2000.jpg';
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            color: Colors.black,
            width: double.infinity,
            height: double.infinity,
            child: Container(
                height: 300,
                width: 300,

                //transform: Matrix4.rotationZ(pi / 4),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.cyan, width: 7),
                    color: Colors.orange,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(url)),
                    boxShadow: [
                      BoxShadow(color: Colors.red, blurRadius: 9),
                      BoxShadow(color: Colors.yellow, blurRadius: 20),
                      BoxShadow(color: Colors.blueAccent, blurRadius: 38)
                    ])),
          ),
        ),
      ),
    );
  }
}
