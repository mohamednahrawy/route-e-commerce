import 'package:dartz/dartz.dart';
import '../../../api/failures.dart';
import '../entities/signin_response_entity.dart';
import '../repository/signin_repository_contract.dart';

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
