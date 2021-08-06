// To parse this JSON data, do
//
//     final ordermodel = ordermodelFromJson(jsonString);

import 'dart:convert';

Ordermodel ordermodelFromJson(String str) =>
    Ordermodel.fromJson(json.decode(str));

String ordermodelToJson(Ordermodel data) => json.encode(data.toJson());

class Ordermodel {
  Ordermodel({
    this.orderId,
    this.idUser,
    this.idBengkel,
    this.nameOrder,
    this.information,
    this.price,
    this.tanggal,
  });

  String orderId;
  String idUser;
  String idBengkel;
  String nameOrder;
  String information;
  String price;
  String tanggal;

  factory Ordermodel.fromJson(Map<String, dynamic> json) => Ordermodel(
        orderId: json["order_id"],
        idUser: json["id_user"],
        idBengkel: json["id_bengkel"],
        nameOrder: json["name_order"],
        information: json["information"],
        price: json["price"],
        tanggal: json["tanggal"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "id_user": idUser,
        "id_bengkel": idBengkel,
        "name_order": nameOrder,
        "information": information,
        "price": price,
        "tanggal": tanggal,
      };
}
