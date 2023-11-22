
import '../../domain/entities/signin_response_entity.dart';

abstract class SignInStates{}
class SignInInitialState extends SignInStates{}
class SignInLoadingState extends SignInStates{
  String? loadingMessage;
  SignInLoadingState({this.loadingMessage});
}
class SignInErrorState extends SignInStates{
  String? errorMessage;
  SignInErrorState({required this.errorMessage});
}
class SignInSuccessState extends SignInStates{
SignInResponseEntity response;
SignInSuccessState({required this.response});
}
 class ChangeObsecure extends SignInStates{}