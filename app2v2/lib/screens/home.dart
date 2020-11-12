import 'package:bmi_calc/helpers/bmi_calc.dart';
import 'package:bmi_calc/screens/result.dart';
import 'package:bmi_calc/widgets/box.dart';
import 'package:bmi_calc/widgets/mybutton.dart';
import 'package:bmi_calc/widgets/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  Widget printCol(String label, String value, List<RoundedButton> list) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label.toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
          Row(
            children: [list[0], list[1]],
          )
        ],
      ),
    );
  }

  int weight = 0;
  int age = 0;
  Widget printWeightAndAge() {
    return Expanded(
      child: Row(
        children: [
          Box(
              printCol(
                "WEIGHT",
                weight.toString(),
                [
                  (RoundedButton(Icons.add, () {
                    setState(() {
                      weight++;
                    });
                  })),
                  (RoundedButton(Icons.remove, () {
                    if (weight > 1) {
                      setState(() {
                        weight--;
                      });
                    }
                  }))
                ],
              ),
              Colors.deepPurple),
          Box(
              printCol("AGE", age.toString(), [
                RoundedButton(Icons.add, () {
                  setState(() {
                    age++;
                  });
                }),
                RoundedButton(Icons.remove, () {
                  if (age > 1) {
                    setState(() {
                      age--;
                    });
                  }
                }),
              ]),
              Colors.blue)
        ],
      ),
    );
  }

  int height = 110;
  Widget printHeight() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            'HEIGHT',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              height.toString(),
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
            Text(
              'cms',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        SizedBox(
          height: 30,
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
              Box(printHeight(), Colors.blueGrey),
              printWeightAndAge(),
              MyButton(() {
                double result = computeBMI(weight, height);
                print("BMI is $result");
                Fluttertoast.showToast(
                    msg: "BMI is $result",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => ResultScreen(result)));
              })
            ],
          ),
        ),
      ),
    );
  }
}
