import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:geocoder/geocoder.dart';
import 'package:shop_app/utils/camera.dart';
import 'package:shop_app/utils/constants.dart';
import 'package:shop_app/utils/gps.dart';
import 'package:shop_app/utils/mic.dart';
import 'package:shop_app/widgets/shopdrawer.dart';
import 'package:shop_app/widgets/slider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, double> map = {};
  getTheMicData(String output) {
    _controller.text = output;
    setState(() {});
  }

  String address = "";
  loadGPSLocation() async {
    map = await getGpsLocation();
    Coordinates cord = Coordinates(map['lat'], map['lng']);
    List<Address> listOfAddress =
        await Geocoder.local.findAddressesFromCoordinates(cord);
    address = listOfAddress.first.countryName +
        " " +
        listOfAddress.first.subAdminArea;
    setState(() {});
  }

  FlutterTts _flutterTts = FlutterTts();
  readText() {
    _flutterTts.speak(_controller.text);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadGPSLocation();
  }

  _speakNow() {
    Mic mic = Mic(getTheMicData);
    mic.loadSpeech();
  }

  TextEditingController _controller = TextEditingController();
  String path;
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _speakNow();
        },
        child: Icon(
          Icons.mic,
          size: 30,
        ),
        elevation: 5,
        backgroundColor: Colors.purpleAccent,
      ),
      drawer: ShopDrawer(map['lng'], map['lat'], address),
      appBar: AppBar(
        backgroundColor: Color(Constants.FK_COLOR),
        actions: [
          InkWell(
            onTap: () async {
              path = await getCamera();
              setState(() {});
            },
            child: Icon(
              Icons.camera,
              size: 20,
            ),
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
              controller: _controller,
              decoration: InputDecoration(
                  suffix: IconButton(
                    icon: Icon(Icons.speaker, size: 32),
                    onPressed: () {
                      readText();
                    },
                  ),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search For Products, Brands and More'),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SliderWidget(),
            path != null
                ? Image.file(
                    File(path),
                    width: 200,
                    height: 200,
                  )
                : Text('No Image')
          ],
        ),
      ),
    );
  }
}
