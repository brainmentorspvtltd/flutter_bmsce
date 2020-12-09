import 'package:flutter/material.dart';

class ShopDrawer extends StatelessWidget {
  double lng, lat;
  String address;
  ShopDrawer(this.lng, this.lat, this.address);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text('Lat Lng $lng ::: $lat'),
              accountEmail: Text(address))
        ],
      ),
    );
  }
}
