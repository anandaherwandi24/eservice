import 'package:e_service/models/constanta.dart';
import 'package:e_service/service/apiresponse.dart';
import 'package:e_service/service/baseapiservices.dart';

class UserRegistrationServices {
  static String endpoint = Constanta.baseApiUrl + "/registration/insert.php";

  static Future<ApiResponse> sentRequestInsertDataUser(
      dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }
}
