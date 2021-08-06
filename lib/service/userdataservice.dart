import 'dart:convert';
import 'dart:io';

import 'package:e_service/models/constanta.dart';
import 'package:e_service/service/apiresponse.dart';
import 'package:e_service/service/baseapiservices.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

class UserdataServices {
  static String endpoint = Constanta.baseApiUrl + "/user/read.php";
  static String endpoint2 = Constanta.baseApiUrl + "/user/update.php";
  static String endpoint3 = Constanta.baseApiUrl + "/help/insert.php";

  static Future<ApiResponse> getdatauser(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  static Future<ApiResponse> updatedatauser(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint2, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  static Future<ApiResponse> inserthelp(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint3, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  static Future<ApiResponse> uploadProfilePicture(File pictureFile,
      {http.MultipartRequest request}) async {
    String url = Constanta.baseApiUrl + 'user/photo';
    var uri = Uri.parse(url);

    if (request == null) {
      request = http.MultipartRequest("POST", uri)
        ..headers["Content-Type"] = "application/json";
    }

    var multipartFile =
        await http.MultipartFile.fromPath('file', pictureFile.path);
    request.files.add(multipartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      var data = jsonDecode(responseBody);

      String imagePath = data['data'][0];

      return ApiResponse(value: imagePath);
    } else {
      return ApiResponse(message: 'Uploading Profile Picture Failed');
    }
  }
}
