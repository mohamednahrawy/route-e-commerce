import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:route_e_commerce_app/data/api/api_constants.dart';
import 'package:route_e_commerce_app/data/model/request/RegisterRequest.dart';
import 'package:route_e_commerce_app/data/model/response/RegisterResponse.dart';

class ApiManager {
  /*
  https://ecommerce.routemisr.com/api/v1/auth/signup
   */
  ///todo: type of the return in the future
  Future<RegisterResponse> register(String name, String email, String password, String rePassword,
      String phone) async {

    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.registerApi);
    var requestBody = RegisterRequest(
        email: email,
        name: name,
        password: password,
        rePassword: rePassword,
        phone: phone);

    var response = await http.post(url, body: requestBody.toJson());
    ///todo: response.body is a string you should convert it to json then object
    return RegisterResponse.fromJson(jsonDecode(response.body));
  }
}
