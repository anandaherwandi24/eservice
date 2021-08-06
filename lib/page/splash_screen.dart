import 'package:e_service/size_config.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  String get tag => null;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  get child => null;

  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacementNamed('/welcome_page');
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
        ),
        Image.asset('image/background_splashscreen.JPG',
            fit: BoxFit.cover, width: 700),
        Padding(
          padding: EdgeInsets.only(top: 350, left: 70),
          child: Image.asset(
            'image/logo.jpg',
            width: 300,
            height: 160,
          ),
        ),
      ],
    ));
  }
}
