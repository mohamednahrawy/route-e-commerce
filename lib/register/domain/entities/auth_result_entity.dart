import 'package:flutter/material.dart';

import '../../../Sign_in/domain/entities/signin_response_entity.dart';

class AuthResultEntity{
  UserEntity? userEntity;
  String? token;
  AuthResultEntity({this.userEntity, this.token});
}