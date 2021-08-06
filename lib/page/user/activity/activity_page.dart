import 'package:e_service/page/user/activity/categorylist.dart';
import 'package:flutter/material.dart';

class ActivtyPage extends StatefulWidget {
  const ActivtyPage({key}) : super(key: key);

  @override
  _ActivtyPageState createState() => _ActivtyPageState();
}

class _ActivtyPageState extends State<ActivtyPage> {
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
                              'Injection',
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
                              'Agung Toyota Batam',
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
                              'Jl. Yos Sudarso, Kp. Seraya, Kec. Batu Ampar, \nKota Batam, Kepulauan Riau',
                              style: new TextStyle(
                                fontSize: 14.0,
                              ),
                              maxLines: 3,
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
                              'Avanza 2010',
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
                              'Rp. 477,500',
                              style: new TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 2, right: 2, bottom: 6),
                      padding:
                          EdgeInsets.only(left: 100, right: 100, bottom: 2),
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
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
                              '17 April 2021 15.00',
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
                              'Honda Rara Motor',
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
                              'Batu Selicin, Kec. Lubuk Baja, KotaBatam,\nKepulauan Riau',
                              style: new TextStyle(
                                fontSize: 14.0,
                              ),
                              maxLines: 2,
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
                              'Motor Beat 2019',
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
                              'Rp. 307,000',
                              style: new TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 2, right: 2, bottom: 6),
                      padding:
                          EdgeInsets.only(left: 100, right: 100, bottom: 2),
                      color: Colors.grey,
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
