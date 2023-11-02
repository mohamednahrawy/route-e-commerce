import 'package:route_e_commerce_app/auth/data/model/response/phone_error.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti8","email":"ma.multipharma@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1M2Q2MWFlNjBhNzMzNzRhYTg2ZTBmOSIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aTgiLCJyb2xlIjoidXNlciIsImlhdCI6MTY5ODUyMTUxOSwiZXhwIjoxNzA2Mjk3NTE5fQ.GjW0f33Gw1vLx-8_u0uDX8SUfbZjH94MkuAHec_a31Y"

class RegisterResponse {
  User? user;
  String? token;
  String? statusMsg;
  String? message;
  PhoneError? error;

  RegisterResponse({
      this.user,
      this.token,
      this.statusMsg,
      this.message,
      this.error
  });

  RegisterResponse.fromJson(dynamic json) {
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

class User {
  User({
    this.name,
    this.email,
    this.role,});

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  String? name;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }

}