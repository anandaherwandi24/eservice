// To parse this JSON data, do
//
//     final bengkelmodel = bengkelmodelFromJson(jsonString);

import 'dart:convert';

Bengkelmodel bengkelmodelFromJson(String str) =>
    Bengkelmodel.fromJson(json.decode(str));

String bengkelmodelToJson(Bengkelmodel data) => json.encode(data.toJson());

class Bengkelmodel {
  Bengkelmodel({
    this.idBengkel,
    this.nameBengkel,
    this.email,
    this.password,
    this.handphone,
    this.alamat,
    this.deskripsi,
    this.latitude,
    this.longtitude,
    this.jarak,
  });

  String idBengkel;
  String nameBengkel;
  String email;
  String password;
  String handphone;
  String alamat;
  String deskripsi;
  String latitude;
  String longtitude;
  String jarak;

  factory Bengkelmodel.fromJson(Map<String, dynamic> json) => Bengkelmodel(
        idBengkel: json["id_bengkel"],
        nameBengkel: json["name_bengkel"],
        email: json["email"],
        password: json["password"],
        handphone: json["handphone"],
        alamat: json["alamat"],
        deskripsi: json["deskripsi"],
        latitude: json["latitude"],
        longtitude: json["longtitude"],
        jarak: json["jarak"],
      );

  Map<String, dynamic> toJson() => {
        "id_bengkel": idBengkel,
        "name_bengkel": nameBengkel,
        "email": email,
        "password": password,
        "handphone": handphone,
        "alamat": alamat,
        "deskripsi": deskripsi,
        "latitude": latitude,
        "longtitude": longtitude,
        "jarak": jarak,
      };
}
