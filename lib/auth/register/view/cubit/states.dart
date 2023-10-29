

import '../../data/model/response/RegisterResponseModel.dart';

abstract class RegisterStates {}

class RegisterLoadingState extends RegisterStates {
  String? loadingMessage;

  RegisterLoadingState({this.loadingMessage});
}

class RegisterInitialState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  String? errorMessage;

  RegisterErrorState({required this.errorMessage});
}

class RegisterSuccessState extends RegisterStates {
  RegisterResponseModel response;

  RegisterSuccessState({required this.response});
}
