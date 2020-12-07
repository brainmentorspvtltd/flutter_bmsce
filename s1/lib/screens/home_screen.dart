import 'package:flutter/material.dart';
import 'package:shop_app/utils/constants.dart';
import 'package:shop_app/widgets/slider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Color(Constants.FK_COLOR),
        actions: [
          Icon(
            Icons.notifications,
            size: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Icon(
              Icons.shopping_cart,
              size: 20,
            ),
          )
        ],
        title: Image.network(
          Constants.FK_HOME_LOGO,
          height: deviceSize.height / 2,
          width: deviceSize.width / 4,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(deviceSize.height / 12),
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search For Products, Brands and More'),
            ),
          ),
        ),
      ),
      body: Column(
        children: [SliderWidget()],
      ),
    );
  }
}
