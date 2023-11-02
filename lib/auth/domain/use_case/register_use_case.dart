import 'package:route_e_commerce_app/auth/data/repository/auth_repository_impl.dart';
import 'package:route_e_commerce_app/auth/domain/repository/auth_repository_contract.dart';
import '../../data/model/response/RegisterResponse.dart';

class RegisterUseCase {
  AuthRepositoryContract repositoryContract;

  RegisterUseCase({required this.repositoryContract});

  //register
  Future<RegisterResponse> register(String name, String email, String password,
      String rePassword, String phone) {
    return repositoryContract.register(
        name, email, password, rePassword, phone);
  }
}
RegisterUseCase injectRegisterUseCase(){
  return RegisterUseCase(repositoryContract: injectAuthRepositoryContract());
}