import 'package:route_e_commerce_app/auth/domain/entities/auth_result_entity.dart';

import '../../data/model/response/register_response.dart';

abstract class RegisterStates {}

class RegisterLoadingState extends RegisterStates {
  String? loadingMessage;

  RegisterLoadingState({this.loadingMessage});
}

class RegisterErrorState extends RegisterStates {
  String? errorMessage;

  RegisterErrorState({required this.errorMessage});
}

class RegisterSuccessState extends RegisterStates {
  AuthResultEntity response;

  RegisterSuccessState({required this.response});
}
