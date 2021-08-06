import 'dart:convert';

import 'package:e_service/models/constanta.dart';
import 'package:e_service/models/ordermodel.dart';
import 'package:e_service/page/user/activity/categorylist.dart';
import 'package:e_service/service/orderservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DetailservicePage extends StatefulWidget {
  const DetailservicePage({key}) : super(key: key);

  @override
  _DetailservicePageState createState() => _DetailservicePageState();
}

class _DetailservicePageState extends State<DetailservicePage> {
  int selectedIndex = 0;

  List<Ordermodel> listOrderModel = [];
  String key_id = "0";
  bool isLoading = true;

  @override
  void initState() {
    readUserData();
    super.initState();
  }

  void readUserData() async {
    final storage = FlutterSecureStorage();
    key_id = await storage.read(key: Constanta.keyId);
    getDataorder();
  }

  void getDataorder() {
    setState(() {
      isLoading = true;
    });
    Map map = {
      "id_user": key_id,
    };
    var requestBody = jsonEncode(map);
    OrderServices.getorder(requestBody).then((value) {
      //Decode response
      final result = value;
      //check status
      if (result.success == true && result.code == 200) {
        //parse model and return value
        listOrderModel = List<Ordermodel>.from(
            result.content.map((x) => Ordermodel.fromJson(x)));
      } else {}
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Activity History",
        ),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          CategoryList(),
          for (Ordermodel item in listOrderModel)
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 14),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
                        child: Row(children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                item.nameOrder,
                                style: new TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 2, right: 2, bottom: 6),
                        padding:
                            EdgeInsets.only(left: 120, right: 120, bottom: 2),
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
                        child: Row(children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                'address',
                                style: new TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 2, right: 2, bottom: 6),
                        padding:
                            EdgeInsets.only(left: 100, right: 100, bottom: 2),
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
                        child: Row(children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                item.tanggal,
                                style: new TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 2, right: 2, bottom: 6),
                        padding:
                            EdgeInsets.only(left: 120, right: 120, bottom: 2),
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          bottom: 10.0,
                        ),
                        child: Row(children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                item.information,
                                style: new TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 2, right: 2, bottom: 6),
                        padding:
                            EdgeInsets.only(left: 100, right: 100, bottom: 2),
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Total Pembayaran',
                                style: new TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              Text(
                                item.price,
                                style: new TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 60,
                            onPressed: () {
                              // authentication();
                            },
                            color: Colors.green,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "Go to Pay",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
