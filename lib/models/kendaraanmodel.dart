// To parse this JSON data, do
//
//     final kendaraanmodel = kendaraanmodelFromJson(jsonString);

import 'dart:convert';

Kendaraanmodel kendaraanmodelFromJson(String str) =>
    Kendaraanmodel.fromJson(json.decode(str));

String kendaraanmodelToJson(Kendaraanmodel data) => json.encode(data.toJson());

class Kendaraanmodel {
  Kendaraanmodel({
    this.idUser,
    this.idKendaraan,
    this.nameKendaraan,
    this.type,
    this.noMesin,
    this.plat,
    this.color,
  });

  String idUser;
  String idKendaraan;
  String nameKendaraan;
  String type;
  String noMesin;
  String plat;
  String color;

  factory Kendaraanmodel.fromJson(Map<String, dynamic> json) => Kendaraanmodel(
        idUser: json["id_user"],
        idKendaraan: json["id_kendaraan"],
        nameKendaraan: json["name_kendaraan"],
        type: json["type"],
        noMesin: json["no_mesin"],
        plat: json["plat"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "id_kendaraan": idKendaraan,
        "name_kendaraan": nameKendaraan,
        "type": type,
        "no_mesin": noMesin,
        "plat": plat,
        "color": color,
      };
}
