import 'package:e_service/models/constanta.dart';
import 'package:e_service/service/apiresponse.dart';
import 'package:e_service/service/baseapiservices.dart';

class ChangepasswordServices {
  static String endpoint2 = Constanta.baseApiUrl + "/forgotpassword/reset.php";

  static Future<ApiResponse> changePassword(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint2, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }
}
