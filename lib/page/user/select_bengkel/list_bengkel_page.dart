import 'package:flutter/material.dart';

class ListbengkelPage extends StatelessWidget {
  final String name_bengkel;
  final VoidCallback ontap;
  final VoidCallback ontap2;
  final String address;
  final String jarak;
  const ListbengkelPage(
      {Key key,
      this.name_bengkel,
      this.address,
      this.jarak,
      this.ontap,
      this.ontap2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 24),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 6.0),
                child: Row(children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        name_bengkel,
                        style: new TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 6.0),
                child: Row(children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        width: 350,
                        child: Text(
                          address,
                          style: new TextStyle(
                            fontSize: 14.0,
                          ),
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 6.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                              fontSize: 18, color: Colors.green),
                        ),
                        onPressed: ontap,
                        child: const Text(
                          'Detail',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                              fontSize: 18, color: Colors.green),
                        ),
                        onPressed: ontap2,
                        child: const Text(
                          'Pilih >',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
