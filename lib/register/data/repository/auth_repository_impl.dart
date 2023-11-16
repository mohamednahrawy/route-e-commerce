import 'package:dartz/dartz.dart';
import '../../../../api/failures.dart';
import '../../domain/entities/auth_result_entity.dart';
import '../../domain/repository/auth_repository_contract.dart';
import '../../domain/repository/data_source/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepositoryContract {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failures,AuthResultEntity>> register(String name, String email, String password,
      String rePassword, String phone) {
    return authRemoteDataSource.register(
        name, email, password, rePassword, phone);
  }
}


