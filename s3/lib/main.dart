import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/utils/firebaseobj.dart';
import 'package:shop_app/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FireBaseAppObject.app = await Firebase.initializeApp();
  runApp(EasyLocalization(
    child: App(),
    supportedLocales: [Locale('en', 'US'), Locale('hi', 'IN')],
    path: 'assets/translations',
    fallbackLocale: Locale('en', 'US'),
  ));
  // runApp(MaterialApp(
  //   title: 'Shop App',
  //   routes: getRoutes(),
  //   debugShowCheckedModeBanner: false,
  // ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Shop App',
      routes: getRoutes(),
      debugShowCheckedModeBanner: false,
    );
  }
}
