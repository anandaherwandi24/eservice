import 'package:e_service/models/constanta.dart';
import 'package:e_service/service/apiresponse.dart';
import 'package:e_service/service/baseapiservices.dart';

class KendaraandataServices {
  static String endpoint =
      Constanta.baseApiUrl + "/user/kendaraan/read_kendaraan.php";

  static Future<ApiResponse> getdatakendaraan(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }
}
