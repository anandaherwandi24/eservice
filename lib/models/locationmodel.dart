// To parse this JSON data, do
//
//     final locationmodel = locationmodelFromJson(jsonString);

import 'dart:convert';

Locationmodel locationmodelFromJson(String str) =>
    Locationmodel.fromJson(json.decode(str));

String locationmodelToJson(Locationmodel data) => json.encode(data.toJson());

class Locationmodel {
  Locationmodel({
    this.success,
    this.code,
    this.message,
    this.content,
  });

  bool success;
  int code;
  String message;
  Content content;

  factory Locationmodel.fromJson(Map<String, dynamic> json) => Locationmodel(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        content: Content.fromJson(json["content"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "message": message,
        "content": content.toJson(),
      };

  Locationmodel fromJson(content) {}
}

class Content {
  Content({
    this.jarak,
  });

  int jarak;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        jarak: json["jarak"],
      );

  Map<String, dynamic> toJson() => {
        "jarak": jarak,
      };
}
