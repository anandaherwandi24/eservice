// To parse this JSON data, do
//
//     final usermodel = usermodelFromJson(jsonString);

import 'dart:convert';

Usermodel usermodelFromJson(String str) => Usermodel.fromJson(json.decode(str));

String usermodelToJson(Usermodel data) => json.encode(data.toJson());

class Usermodel {
  Usermodel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.handphone,
    this.image,
  });

  String id;
  String name;
  String email;
  String password;
  String handphone;
  String image;

  factory Usermodel.fromJson(Map<String, dynamic> json) => Usermodel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        handphone: json["handphone"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "handphone": handphone,
        "image": image,
      };
}
