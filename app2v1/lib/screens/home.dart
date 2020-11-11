import 'package:bmi_calc/widgets/box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _appLabel() {
    return Text(
      'BMI CALCULATOR',
      style: TextStyle(
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  int height = 110;
  Widget printHeight() {
    return Column(
      children: [
        Text('Height'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              height.toString(),
              style: TextStyle(fontSize: 30),
            ),
            Text('cms')
          ],
        ),
        Slider(
          min: 100,
          max: 220,
          value: height.toDouble(),
          onChanged: (double newValue) {
            height = newValue.round();
            print("Height is $height");
            setState(() {
              height = newValue.round();
            });
          },
        )
      ],
    );
  }

  Widget printGender(String type, IconData icon) {
    return Column(
      children: [
        Icon(
          Icons.supervised_user_circle,
          size: 30,
        ),
        SizedBox(
          height: 10,
        ),
        Text(type)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          width: deviceSize.width,
          margin: EdgeInsets.only(top: deviceSize.height / 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _appLabel(),
              Expanded(
                child: Row(
                  children: [
                    Box(printGender("MALE", Icons.supervised_user_circle),
                        Colors.blueGrey),
                    Box(
                        printGender(
                            "FEMALE", Icons.supervised_user_circle_outlined),
                        Colors.red[100])
                    /*Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Icon(
                              Icons.supervised_user_circle,
                              size: 30,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("MALE")
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Icon(
                              Icons.supervised_user_circle_outlined,
                              size: 30,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("FEMALE")
                          ],
                        ),
                      ),
                    )*/
                  ],
                ),
              ),
              Box(printHeight(), Colors.blueGrey)
            ],
          ),
        ),
      ),
    );
  }
}
