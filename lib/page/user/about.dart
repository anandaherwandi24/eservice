import 'package:e_service/constans.dart';
import 'package:e_service/size_config.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "About",
        ),
        backgroundColor: Colors.lightGreenAccent[700],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Image.asset(
            'image/about.jpg',
            fit: BoxFit.fill,
            width: 500,
            height: 1000,
          ),
          Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: kDefaultPadding * 6,
                  left: kDefaultPadding,
                  right: kDefaultPadding),
              child: Container(
                width: 250,
                margin: EdgeInsets.only(
                    left: getProportionateScreenWidth(66),
                    right: getProportionateScreenWidth(60),
                    bottom: getProportionateScreenWidth(20)),
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(60),
                  vertical: getProportionateScreenWidth(20),
                ),
                // decoration: BoxDecoration(
                //   image: const DecorationImage(
                //       image: AssetImage('image/about.png'), fit: BoxFit.fill),
                // ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: kDefaultPadding * 2,
                  left: kDefaultPadding,
                  right: kDefaultPadding),
              child: Container(
                  width: 600,
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )),
            )
          ]),
        ],
      ),
    );
  }
}
