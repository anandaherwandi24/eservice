// To parse this JSON data, do
//
//     final apiResponse = apiResponseFromJson(jsonString);

import 'dart:convert';

ApiResponse apiResponseFromJson(String str) =>
    ApiResponse.fromJson(json.decode(str));

String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse<T> {
  ApiResponse(
      {this.success, this.code, this.message, this.content, this.value});

  bool success;
  int code;
  String message;
  dynamic content;
  T value;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "message": message,
        "content": content,
      };
}
