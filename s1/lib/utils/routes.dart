import 'package:flutter/cupertino.dart';
import 'package:shop_app/screens/home_screen.dart';
import 'package:shop_app/screens/shop_splashscreen.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    "/": (BuildContext context) => ShopScreen(),
    "/home-screen": (BuildContext context) => HomeScreen()
  };
}
