import 'package:e_service/page/user/order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsBengkelPage extends StatefulWidget {
  final String idBengkel;
  final String nameBengkel;
  final String handphone;
  final String alamat;
  final String deskripsi;

  final Widget child;
  @override
  _DetailsBengkelPageState createState() => _DetailsBengkelPageState();
  DetailsBengkelPage(this.idBengkel, this.nameBengkel, this.handphone,
      this.alamat, this.deskripsi,
      {Key key, this.child})
      : super(key: key);
  // This widget is the root of your application.
}

class _DetailsBengkelPageState extends State<DetailsBengkelPage> {
  bool _like = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          child: Stack(
            children: <Widget>[
              Container(
                height: height * 0.55,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('image/img_bengkel.jpg'),
                        fit: BoxFit.cover)),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.9),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                ),
              ),
              Container(
                width: width,
                margin: EdgeInsets.only(top: height * 0.5),
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.nameBengkel,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 50,
                      width: width,
                      child: Text("5 Km"),
                    ),
                    Text(
                      "Address",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.alamat,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 0.5,
                          wordSpacing: 1.5),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 2,
                      color: Colors.grey[300],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "No Handphone",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.handphone,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 0.5,
                          wordSpacing: 1.5),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 2,
                      color: Colors.grey[300],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Description",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.deskripsi,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 0.5,
                          wordSpacing: 1.5),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        // RaisedButton(
                        //   onPressed: () {},
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(10)),
                        //   color: Colors.orange[800],
                        //   padding: EdgeInsets.fromLTRB(35, 15, 35, 15),
                        //   child: Text(
                        //     "Kembali",
                        //     style: TextStyle(color: Colors.white, fontSize: 18),
                        //   ),
                        // )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                left: 30,
                top: height * 0.05,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.keyboard_backspace,
                    size: 42,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
