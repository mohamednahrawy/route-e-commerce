
import 'package:route_e_commerce_app/register/data/model/response/phone_error.dart';

import '../../../../Sign_in/domain/entities/signin_response_entity.dart';
import '../../../domain/entities/auth_result_entity.dart';

class RegisterResponseDto {
  UserDto? user;
  String? token;
  String? statusMsg;
  String? message;
  PhoneError? error;

  RegisterResponseDto(
      {this.user, this.token, this.statusMsg, this.message, this.error});

  RegisterResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    error = json["errors"];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
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

  AuthResultEntity toAuthResultEntity() {
    return AuthResultEntity(token: token, userEntity: user?.toUserEntity());
  }
}

class UserDto {
  UserDto({
    this.name,
    this.email,
    this.role,
  });

  UserDto.fromJson(dynamic json) {
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

  UserEntity toUserEntity() {
    return UserEntity(name: name, email: email);
  }
}
