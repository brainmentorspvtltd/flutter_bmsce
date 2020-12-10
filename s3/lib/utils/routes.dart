import 'package:flutter/cupertino.dart';
import 'package:shop_app/screens/home_screen.dart';
import 'package:shop_app/screens/paymentscreen.dart';
import 'package:shop_app/screens/shop_splashscreen.dart';
import 'package:shop_app/screens/uploadcameraphoto.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    "/": (BuildContext context) => ShopScreen(),
    "/home-screen": (BuildContext context) => HomeScreen(),
    "/upload": (BuildContext context) => UploadCameraPhoto(),
    "/payment": (BuildContext context) => PaymentScreen()
  };
}
