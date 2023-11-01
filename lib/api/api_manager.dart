import 'dart:convert';
import 'package:http/http.dart' as http;
import '../auth/register/data/model/request/RegisterRequest.dart';
import '../auth/register/data/model/response/RegisterResponse.dart';
import 'api_constants.dart';

class ApiManager {
  /*
  https://ecommerce.routemisr.com/api/v1/auth/signup
   */
  ///todo: type of the return in the future
  static Future<RegisterResponse> register(String name, String email, String password, String rePassword,
      String phone) async {

    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.registerApi);
    var requestBody = RegisterRequest(
        email: email,
        name: name,
        password: password,
        rePassword: rePassword,
        phone: phone);

    var response = await http.post(url, body: requestBody.toJson());
    var json = jsonDecode(response.body);
    return RegisterResponse.fromJson(json);

  }
}
///todo: response => response.body (String) => json(jsonDecode)
///todo: => object of RegisterResponse