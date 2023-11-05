import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_app/auth/data/repository/auth_repository_impl.dart';
import 'package:route_e_commerce_app/auth/domain/entities/auth_result_entity.dart';
import 'package:route_e_commerce_app/auth/domain/repository/auth_repository_contract.dart';
import '../../data/api/failures.dart';

class RegisterUseCase {
  AuthRepositoryContract repositoryContract;

  RegisterUseCase({required this.repositoryContract});

  //register
  Future<Either<Failures, AuthResultEntity>> invoke(String name, String email,
      String password, String rePassword, String phone) async {
    var either = await repositoryContract.register(
        name, email, password, rePassword, phone);
   return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response);
    }
    );
  }
}

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(repositoryContract: injectAuthRepositoryContract());
}
