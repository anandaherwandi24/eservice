import 'package:flutter/material.dart';
import 'dart:async';
import './login_screen.dart';

class SuccesScreen extends StatefulWidget {
  String get tag => null;

  @override
  _SuccesScreenState createState() => _SuccesScreenState();
}

class _SuccesScreenState extends State<SuccesScreen> {
  get child => null;

  @override
  void initState() {
    super.initState();
    startSuccesScreen();
  }

  startSuccesScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return LoginPage();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.green,
              radius: 60.0,
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 100,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          Text(
            'Registration Success',
            style: TextStyle(
              height: 1,
              fontSize: 20,
            ),
          ),
        ],
        // padding: EdgeInsets.only(top: 70, left: 140),
      ),
    ]));
  }
}
