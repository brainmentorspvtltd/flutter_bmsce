import 'package:flutter/material.dart';

class GreetApp extends StatefulWidget {
  @override
  _GreetAppState createState() => _GreetAppState();
}

class _GreetAppState extends State<GreetApp> {
  _createTxtField(String label, IconData icon, TextEditingController ctrl) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: ctrl,
        style: TextStyle(fontSize: 24),
        cursorColor: Colors.amber,
        cursorWidth: 5,
        keyboardType: TextInputType.text,
        //textAlign: TextAlign.center,
        //obscureText: true,
        //obscuringCharacter: '#',
        //textDirection: TextDirection.rtl,
        //maxLines: 5,
        //minLines: 3,
        toolbarOptions: ToolbarOptions(
            cut: true, copy: false, selectAll: true, paste: false),
        decoration: InputDecoration(
            hintText: label,
            //helperText: label,
            labelText: label,
            labelStyle: TextStyle(color: Colors.deepPurple),
            prefixIcon: Icon(
              icon,
              color: Colors.red,
              size: 30,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            )),

        //enabled: false,
      ),
    );
  }

  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();
  String _fullName = "";
  _sayWelcome() {
    print("I am in Say Welcome ");
    String firstName = firstNameCtrl.text; // get the textfield value
    String lastName = lastNameCtrl.text;
    setState(() {
      _fullName = initCapital(firstName) + " " + initCapital(lastName);
    });

    print("Full Name is $_fullName");
  }

  String initCapital(String str) =>
      str[0].toUpperCase() + str.substring(1).toLowerCase();

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: deviceSize.height / 6),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'GREET APP',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
                _createTxtField(
                    'Type First Name Here', Icons.person, firstNameCtrl),
                SizedBox(
                  height: 20,
                ),
                _createTxtField(
                    'Type Last Name Here', Icons.account_circle, lastNameCtrl),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      child: RaisedButton(
                        color: Colors.amber,
                        onPressed: () {
                          _sayWelcome();
                        },
                        child: Text(
                          'Welcome',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                      child: RaisedButton(
                        color: Colors.cyan,
                        onPressed: () {},
                        child:
                            Text('Clear All', style: TextStyle(fontSize: 20)),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  _fullName ?? "",
                  style: TextStyle(fontSize: 32),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
