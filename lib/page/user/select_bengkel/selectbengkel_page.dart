import 'dart:convert';

import 'package:e_service/models/bengkelmodel.dart';
import 'package:e_service/models/constanta.dart';
import 'package:e_service/models/locationmodel.dart';
import 'package:e_service/page/bengkel/bengkel_profile/bengkel.dart';
import 'package:e_service/page/user/bengkel_profile/bengkel.dart';
import 'package:e_service/page/user/order.dart';
import 'package:e_service/page/user/select_bengkel/list_bengkel_page.dart';
import 'package:e_service/page/user/select_bengkel/serach_bar_page.dart';
import 'package:e_service/service/bengkelservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';

class SelectbengkelPage extends StatefulWidget {
  @override
  _SelectbengkelPageState createState() => _SelectbengkelPageState();
}

class _SelectbengkelPageState extends State<SelectbengkelPage> {
  // Locationmodel locationmodel = new Locationmodel();
  int selectedIndex = 0;
  var _namebengkelController = new TextEditingController();

  Bengkelmodel bengkelmodel = new Bengkelmodel();
  String key_id = "0";
  bool isLoading = true;
  List<Bengkelmodel> listBengkelModel = [];
  var locationMessage = '';
  String latitude;
  String longitude;

  @override
  void initState() {
    getDatabengkel();
    super.initState();
  }

  // void getCurrentLocation() async {
  //   var position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   var lat = position.latitude;
  //   var long = position.longitude;

  //   // passing this to latitude and longitude strings
  //   latitude = "$lat";
  //   longitude = "$long";
  //   getDatabengkel();
  // }

  void getDatabengkel() {
    setState(() {
      isLoading = true;
    });
    Map map = {"id_bengkel": "", "name_bengkel": _namebengkelController.text};
    var requestBody = jsonEncode(map);
    BengkeldataServices.getdatabengkel(requestBody).then((value) {
      //Decode response
      final result = value;
      //check status
      if (result.success == true && result.code == 200) {
        //parse model and return value
        listBengkelModel = List<Bengkelmodel>.from(
            result.content.map((x) => Bengkelmodel.fromJson(x)));
      } else {
        print("eror message : " + result.message);
      }
      setState(() {
        isLoading = false;
      });
    });
  }

  // void getjarak() {
  //   Map map = {
  //     "latitude": latitude,
  //     "longitude": longitude,
  //     for (Bengkelmodel data in listBengkelModel) "latitude": data.latitude,
  //     for (Bengkelmodel data in listBengkelModel) "longitude": data.longtitude
  //   };

  //   var requestBody = jsonEncode(map);
  //   BengkeldataServices.checkLocation(requestBody).then((value) {
  //     final result = value;
  //     if (result.success == true && result.code == 200) {
  //       locationmodel = Locationmodel().fromJson(result.content);
  //       print(locationmodel);
  //     }
  //   }).catchError((error) {});
  // }

  @override
  Widget build(BuildContext context) {
    var inputDecoration = InputDecoration(
      hintText: "Search Place",
      border: InputBorder.none,
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Service",
        ),
        backgroundColor: Colors.green,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                Row(
                  children: [
                    Container(
                      width: 350,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(29.5),
                          border: Border.all(color: Colors.black, width: 2)),
                      child: TextField(
                        controller: _namebengkelController,
                        decoration: inputDecoration,
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          getDatabengkel();
                        })
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text('The nearest repair shop :'),
                ),
                for (Bengkelmodel item in listBengkelModel)
                  ListbengkelPage(
                    name_bengkel: item.nameBengkel,
                    address: item.alamat,
                    jarak: item.jarak + " Km",
                    ontap: () {
                      Navigator.of(context).push(MaterialPageRoute<Null>(
                          builder: (BuildContext context) {
                        return new DetailsBengkelPage(
                            item.idBengkel,
                            item.nameBengkel,
                            item.handphone,
                            item.alamat,
                            item.deskripsi);
                      }));
                    },
                    ontap2: () {
                      Navigator.of(context).push(MaterialPageRoute<Null>(
                          builder: (BuildContext context) {
                        return new OrderPage(
                          item.idBengkel,
                        );
                      }));
                    },
                  ),
              ],
            ),
    );
  }
}
