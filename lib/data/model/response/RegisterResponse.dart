import 'package:route_e_commerce_app/data/model/response/phone_error.dart';

import 'User.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti8","email":"ma.multipharma@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1M2Q2MWFlNjBhNzMzNzRhYTg2ZTBmOSIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aTgiLCJyb2xlIjoidXNlciIsImlhdCI6MTY5ODUyMTUxOSwiZXhwIjoxNzA2Mjk3NTE5fQ.GjW0f33Gw1vLx-8_u0uDX8SUfbZjH94MkuAHec_a31Y"

class RegisterResponse {
  RegisterResponse({
      this.message, 
      this.user, 
      this.token,
      this.error

  });

  RegisterResponse.fromJson(dynamic json) {
    message = json['message'];
    error = json["errors"];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  User? user;
  String? token;
  PhoneError? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['errors'] = error;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

}