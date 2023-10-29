import 'dart:convert';
import 'package:http/http.dart' as http;
import '../auth/register/data/model/request/RegisterRequestModel.dart';
import '../auth/register/data/model/response/RegisterResponseModel.dart';
import 'api_constants.dart';

class ApiManager {
  /*
  https://ecommerce.routemisr.com/api/v1/auth/signup
   */
  ///todo: type of the return in the future
  static Future<RegisterResponseModel> register(String name, String email, String password, String rePassword,
      String phone) async {

    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.registerApi);
    var request = RegisterRequestModel(
        email: email,
        name: name,
        password: password,
        rePassword: rePassword,
        phone: phone);

    var response = await http.post(url, body: request.toJson());
    ///todo: response.body string => json => object of RegisterResponseModel
    return RegisterResponseModel.fromJson(jsonDecode(response.body));
  }
}
