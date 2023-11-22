import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_app/api/failures.dart';

import '../../domain/entities/signin_response_entity.dart';
import '../../domain/repository/signin_remote_data_source.dart';
import '../../domain/repository/signin_repository_contract.dart';

class SignInRepositoryImpl implements SignInRepositoryContract {
  SignInRemoteDataSource remoteDataSource;
  SignInRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, SignInResponseEntity>> signIn(
      {required String email, required String password}) {
    return remoteDataSource.signIn(email: email, password: password);
  }
}
