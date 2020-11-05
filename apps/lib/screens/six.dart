import 'package:flutter/material.dart';

class Six extends StatelessWidget {
  List<String> items = [
    'https://raw.githubusercontent.com/brainmentorspvtltd/myserverdata/master/categories/grocery.png',
    'https://raw.githubusercontent.com/brainmentorspvtltd/myserverdata/master/categories/home.png',
    'https://raw.githubusercontent.com/brainmentorspvtltd/myserverdata/master/categories/mobiles.png',
    ' https://raw.githubusercontent.com/brainmentorspvtltd/myserverdata/master/categories/sports_and_more.png',
    'https://raw.githubusercontent.com/brainmentorspvtltd/myserverdata/master/categories/grocery.png',
    'https://raw.githubusercontent.com/brainmentorspvtltd/myserverdata/master/categories/home.png',
    'https://raw.githubusercontent.com/brainmentorspvtltd/myserverdata/master/categories/mobiles.png',
    ' https://raw.githubusercontent.com/brainmentorspvtltd/myserverdata/master/categories/sports_and_more.png',
    'https://raw.githubusercontent.com/brainmentorspvtltd/myserverdata/master/categories/grocery.png',
    'https://raw.githubusercontent.com/brainmentorspvtltd/myserverdata/master/categories/home.png',
    'https://raw.githubusercontent.com/brainmentorspvtltd/myserverdata/master/categories/mobiles.png',
    ' https://raw.githubusercontent.com/brainmentorspvtltd/myserverdata/master/categories/sports_and_more.png'
  ];
  List<Container> _getItems() {
    print(items);
    List<Container> listOfContainers = items
        .map((singleItem) => Container(
            width: 100,
            height: 100,
            child: Image.network(
              singleItem,
              height: 100,
              width: 100,
            )))
        .toList();
    return listOfContainers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Wrap(
          children: _getItems(),
        ),
      ),
    );
  }
}
