import 'package:dartz/dartz.dart';

import '../../../../api/failures.dart';
import '../../data/repository/auth_repository_impl.dart';
import '../entities/auth_result_entity.dart';
import '../repository/auth_repository_contract.dart';

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


