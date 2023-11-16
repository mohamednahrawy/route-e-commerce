import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_app/login/domain/repository/signin_repository_contract.dart';

import '../../../api/failures.dart';
import '../entities/signin_response_entity.dart';

class SignInUseCase {
  SignInRepositoryContract repositoryContract;

  SignInUseCase({required this.repositoryContract});

  Future<Either<Failures, SignInResponseEntity>> signIn(
      {required String email, required String password}) async {
    var either =
        await repositoryContract.signIn(email: email, password: password);
    return either.fold((l) => Left(Failures(errorMessage: l.errorMessage)),
        (response) => Right(response));
  }
}
