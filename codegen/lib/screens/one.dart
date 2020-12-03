import 'package:flutter/material.dart';

class One extends StatefulWidget {
  @override
  _OneState createState() => _OneState();
}

class _OneState extends State<One> {
  ScrollController sc = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          controller: sc,
          isAlwaysShown: true,
          thickness: 40,
          radius: Radius.circular(30),
          child: ListView.builder(
              controller: sc,
              itemCount: 100,
              itemBuilder: (BuildContext ctx, int index) {
                return Dismissible(
                  key: Key(index.toString()),
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.purpleAccent,
                      size: 30,
                    ),
                    title: Text('Item $index'),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
