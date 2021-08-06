import 'package:e_service/models/constanta.dart';
import 'package:e_service/service/apiresponse.dart';
import 'package:e_service/service/baseapiservices.dart';

class BengkeldataServices {
  static String endpoint =
      Constanta.baseApiUrl + "/bengkel/login_bengkel/read.php";
  static String endpoint2 = Constanta.baseApiUrl + "/bengkel/chelock.php";

  static Future<ApiResponse> getdatabengkel(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  static Future<ApiResponse> checkLocation(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint2, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }
}
