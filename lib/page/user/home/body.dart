import 'dart:convert';

import 'package:e_service/constans.dart';
import 'package:e_service/models/constanta.dart';
import 'package:e_service/models/usermodel.dart';
import 'package:e_service/service/userdataservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _BodyState createState() => new _BodyState();
}

class _BodyState extends State<Body> {
  Usermodel usermodel = new Usermodel();
  String key_id = "0";
  bool isLoading = true;
  void initState() {
    readUserData();
    super.initState();
  }

  void readUserData() async {
    final storage = FlutterSecureStorage();
    key_id = await storage.read(key: Constanta.keyId);
    getDataUserLogin();
  }

  void getDataUserLogin() {
    setState(() {
      isLoading = true;
    });
    Map map = {
      "id": key_id,
    };
    var requestBody = jsonEncode(map);
    UserdataServices.getdatauser(requestBody).then((value) {
      //Decode response
      final result = value;
      //check status
      if (result.success == true && result.code == 200) {
        //parse model and return value
        usermodel = Usermodel.fromJson(result.content);
        setState(() {
          isLoading = false;
        });
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: <Widget>[
                      Image.asset('image/ic_orang.png', width: 40),
                      Text(" "),
                      Text(
                        usermodel.name ?? "",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
                Image.asset('image/bell.png', width: 40),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Saldo',
                    style: TextStyle(color: kTextColor2, fontSize: 20)),
                Text('Rp.0',
                    style: TextStyle(color: kTextColor2, fontSize: 20)),
              ],
            ),
            margin: EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenWidth(10),
            ),
            decoration: BoxDecoration(
              color: Colors.green[300],
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(10),
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Column(
                  children: [
                    Material(
                        child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(0),
                          vertical: getProportionateScreenWidth(0),
                        ),
                        decoration: BoxDecoration(color: kPrimaryColor),
                        child: ClipRRect(
                          child: Image.asset('image/top_up.png',
                              width: 40, color: Colors.white),
                        ),
                      ),
                    )),
                    SizedBox(height: 10.0),
                    Text("Top Up",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ],
                )),
                Container(
                    child: Column(
                  children: [
                    Material(
                        child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(0),
                          vertical: getProportionateScreenWidth(0),
                        ),
                        decoration: BoxDecoration(color: kPrimaryColor),
                        child: ClipRRect(
                          child: Image.asset('image/tarik_saldo.png',
                              width: 40, color: Colors.white),
                        ),
                      ),
                    )),
                    SizedBox(height: 10.0),
                    Text("Transfer",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ],
                )),
                Container(
                    child: Column(
                  children: [
                    Material(
                        child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(0),
                          vertical: getProportionateScreenWidth(0),
                        ),
                        decoration: BoxDecoration(color: kPrimaryColor),
                        child: ClipRRect(
                          child: Image.asset('image/others.png',
                              width: 40, color: Colors.white),
                        ),
                      ),
                    )),
                    SizedBox(height: 10.0),
                    Text("More",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ],
                )),
              ],
            ),
            margin: EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenWidth(20),
            ),
            decoration: BoxDecoration(
              color: kPrimaryColor,
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  height: 24,
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Regular Service",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          child: Column(
                        children: [
                          Material(
                              child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(10),
                                vertical: getProportionateScreenWidth(10),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                child: Image.asset('image/motor.png',
                                    width: 40, color: kPrimaryColor),
                              ),
                            ),
                          )),
                          SizedBox(height: 10.0),
                          Text("Bike",
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ],
                      )),
                      Container(
                          child: Column(
                        children: [
                          Material(
                              child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(10),
                                vertical: getProportionateScreenWidth(10),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                child: Image.asset('image/mobil.png',
                                    width: 40, color: kPrimaryColor),
                              ),
                            ),
                          )),
                          SizedBox(height: 10.0),
                          Text("Car",
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ],
                      )),
                      Container(
                          child: Column(
                        children: [
                          Material(
                              child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(10),
                                vertical: getProportionateScreenWidth(10),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                child: Image.asset('image/bus.jpg',
                                    width: 40, color: kPrimaryColor),
                              ),
                            ),
                          )),
                          SizedBox(height: 10.0),
                          Text("Bus",
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ],
                      )),
                    ],
                  ),
                )
              ],
            ),
            margin: EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenWidth(10),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          Divider(
            thickness: 5,
            color: Colors.grey,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/selectbengkel_page');
            },
            child: Container(
              margin: EdgeInsets.only(
                  left: getProportionateScreenWidth(20),
                  right: getProportionateScreenWidth(20),
                  bottom: getProportionateScreenWidth(10),
                  top: getProportionateScreenWidth(10)),
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(60),
              ),
              decoration: BoxDecoration(
                color: Colors.green[300],
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage('image/banner.JPG'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Divider(
            thickness: 5,
            color: Colors.grey,
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 24,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: kDefaultPadding),
                        child: Text(
                          "Recomended",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: kDefaultPadding),
                        child: Text(
                          "Jaminan kualitas dan harga yang menarik",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            left: kDefaultPadding,
                            top: kDefaultPadding / 2,
                            bottom: kDefaultPadding * 0.25),
                        width: size.width * 0.6,
                        child: Column(
                          children: <Widget>[
                            Image.asset("image/agung_toyota.JPG"),
                            Container(
                              padding: EdgeInsets.all(kDefaultPadding / 2),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 50,
                                        color: kPrimaryColor.withOpacity(0.23))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "Agung Toyota\n".toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text:
                                              "Jl. Yos Sudarso, Kp. Seraya, Kec. Batu Ampar, Kota Batam, Kepulauan Riau"
                                                  .toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black))
                                    ]),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: kDefaultPadding,
                            top: kDefaultPadding / 2,
                            bottom: kDefaultPadding * 0.25),
                        width: size.width * 0.6,
                        child: Column(
                          children: <Widget>[
                            Image.asset("image/Indoprisma.JPG"),
                            Container(
                              padding: EdgeInsets.all(kDefaultPadding / 2),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 50,
                                        color: kPrimaryColor.withOpacity(0.23))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "Indoprisma\n".toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text:
                                              "Tlk. Tering, Kec. Batam Kota,Kota Batam, Kepulauan Riau"
                                                  .toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black))
                                    ]),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: kDefaultPadding,
                            top: kDefaultPadding / 2,
                            bottom: kDefaultPadding * 0.25),
                        width: size.width * 0.6,
                        child: Column(
                          children: <Widget>[
                            Image.asset("image/rara_motor.JPG"),
                            Container(
                              padding: EdgeInsets.all(kDefaultPadding / 2),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 50,
                                        color: kPrimaryColor.withOpacity(0.23))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "Honda Rara Motor\n"
                                              .toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text:
                                              "Batu Selicin, Kec. Lubuk Baja, KotaBatam, Kepulauan Riau"
                                                  .toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black))
                                    ]),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
