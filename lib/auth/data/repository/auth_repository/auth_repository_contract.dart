import '../../model/response/RegisterResponse.dart';

abstract class AuthRepositoryContract {
  ///todo: includes only abstract function
  Future<RegisterResponse> register(String name, String email, String password,
      String rePassword, String phone);
}
