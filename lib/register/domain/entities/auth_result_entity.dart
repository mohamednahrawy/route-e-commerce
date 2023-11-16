import 'package:flutter/material.dart';
import 'package:route_e_commerce_app/register/domain/entities/register_response_entities.dart';

class AuthResultEntity{
  UserEntity? userEntity;
  String? token;
  AuthResultEntity({this.userEntity, this.token});
}