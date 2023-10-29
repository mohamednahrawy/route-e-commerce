import 'package:route_e_commerce_app/auth/register/data/model/response/phone_error.dart';
import 'User.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti8","email":"ma.multipharma@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1M2Q2MWFlNjBhNzMzNzRhYTg2ZTBmOSIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aTgiLCJyb2xlIjoidXNlciIsImlhdCI6MTY5ODUyMTUxOSwiZXhwIjoxNzA2Mjk3NTE5fQ.GjW0f33Gw1vLx-8_u0uDX8SUfbZjH94MkuAHec_a31Y"

class RegisterResponseModel {
  String? statusMsg;
  String? message;
  User? user;
  String? token;
  PhoneError? error;

  RegisterResponseModel({
      this.statusMsg,
      this.message,
      this.user,
      this.token,
      this.error
  });

  RegisterResponseModel.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    error = json["errors"];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    map['errors'] = error;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

}