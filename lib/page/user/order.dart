import 'dart:convert';

import 'package:dropdownfield/dropdownfield.dart';
import 'package:e_service/models/constanta.dart';
import 'package:e_service/models/kendaraanmodel.dart';
import 'package:e_service/models/ordermodel.dart';
import 'package:e_service/service/kendaraanservice.dart';
import 'package:e_service/service/orderservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class OrderPage extends StatefulWidget {
  final String idBengkel;

  @override
  _OrderPageState createState() => _OrderPageState();
  OrderPage(this.idBengkel, {Key key}) : super(key: key);
}

class _OrderPageState extends State<OrderPage> {
  String dropdownvalue = 'Pilih Kendaraan';
  var _nameController = new TextEditingController();
  var _tanggalController = new TextEditingController();
  var _informationController = new TextEditingController();
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  bool isLoading = true;
  String _service = "";
  String key_id = "0";

  void initState() {
    super.initState();
    readUserData();
  }

  void readUserData() async {
    final storage = FlutterSecureStorage();
    key_id = await storage.read(key: Constanta.keyId);
  }

  void insertorder() {
    Ordermodel ordermodel = new Ordermodel(
        idBengkel: widget.idBengkel,
        idUser: key_id,
        nameOrder: _nameController.text,
        information: _informationController.text,
        tanggal: date.toString(),
        price: _service);

    var requestBody = jsonEncode(ordermodel.toJson());
    OrderServices.insertorder(requestBody)
        .then((value) {})
        .catchError((error) {});
    print(requestBody);
  }

  void _pilihservice(String value) {
    setState(() {
      _service = value;
    });
  }

  selectdate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
    final TimeOfDay picked2 = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: time.hour, minute: time.minute),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
    if (picked != null && picked != date) if (picked2 != null &&
        picked2 != time)
      setState(() {
        this.date = DateTime(picked.year, picked.month, picked.day,
            picked2.hour, picked2.minute);
      });
  }

  // selecttime(BuildContext context) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Service",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: _nameController,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            decoration: InputDecoration(
                              hintText: 'Full Name',
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.green, width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Service Schedule',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            readOnly: true,
                            onTap: () {
                              selectdate(context);
                            },
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            decoration: InputDecoration(
                              hintText: (date.toString()),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.green, width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Others Information',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          TextField(
                            controller: _informationController,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            minLines: 1,
                            maxLines: 3,
                            decoration: InputDecoration(
                              hintText: 'Decription Problem',
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 100.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.green, width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Type Service',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: <Widget>[
                              RadioListTile(
                                title: Text('Service Regular : Rp. 350.000'),
                                value: "350000",
                                groupValue: _service,
                                onChanged: (String value) {
                                  setState(() {
                                    _pilihservice(value);
                                  });
                                },
                              ),
                              RadioListTile(
                                title: Text('Service Premium : Rp. 750.000'),
                                value: "750000",
                                groupValue: _service,
                                onChanged: (String value) {
                                  setState(() {
                                    _pilihservice(value);
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            // padding: EdgeInsets.only(left: 113, right: 110),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              onPressed: () {
                                insertorder();
                              },
                              padding: EdgeInsets.only(
                                  bottom: 12, top: 12, left: 60, right: 60),
                              color: Colors.green,
                              child: Text('Order',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                            ),
                          )
                        ],
                      )),
                )),
          ],
        ),
      ),
    );
  }
}
