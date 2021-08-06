import 'dart:convert';

import 'package:e_service/models/constanta.dart';
import 'package:e_service/models/kendaraanmodel.dart';
import 'package:e_service/service/kendaraanservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class GaragePage extends StatefulWidget {
  const GaragePage({key}) : super(key: key);

  @override
  _GaragePageState createState() => _GaragePageState();
}

class _GaragePageState extends State<GaragePage> {
  bool isLoading = true;
  // Kendaraanmodel kendaraanmodel = new Kendaraanmodel();
  String key_id = "0";
  List<Kendaraanmodel> listKendaraanModel = [];

  void initState() {
    readUserData();
    super.initState();
  }

  void readUserData() async {
    final storage = FlutterSecureStorage();
    key_id = await storage.read(key: Constanta.keyId);
    getDatakendaraan();
  }

  void getDatakendaraan() {
    setState(() {
      isLoading = true;
    });
    Map map = {
      "id_user": key_id,
    };
    var requestBody = jsonEncode(map);
    KendaraandataServices.getdatakendaraan(requestBody).then((value) {
      //Decode response
      final result = value;
      //check status
      if (result.success == true && result.code == 200) {
        //parse model and return value
        listKendaraanModel = List<Kendaraanmodel>.from(
            result.content.map((x) => Kendaraanmodel.fromJson(x)));
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
          "Garage",
        ),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              top: 24,
            ),
            child: Text(
              'Daftar Mobil :',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          for (Kendaraanmodel item in listKendaraanModel)
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
              child: Card(
                color: Colors.grey,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      // padding: const EdgeInsets.only(left: 16, top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            item.nameKendaraan,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Ink.image(
                                height: 200,
                                width: 300,
                                image: item.type == "mobil"
                                    ? AssetImage('image/img_mobil.jpg')
                                    : item.type == "motor"
                                        ? AssetImage('image/img_motor.jpg')
                                        : null,
                                fit: BoxFit.fill,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 40, top: 16, bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Details',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 10,
                          ),
                          Text('No Plat : ' + item.plat),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Color : ' + item.color),
                          SizedBox(
                            height: 10,
                          ),
                          Text('No Mesin : ' + item.noMesin),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
