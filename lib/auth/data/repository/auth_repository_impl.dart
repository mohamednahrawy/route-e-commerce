import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_app/auth/data/model/response/register_response.dart';
import 'package:route_e_commerce_app/auth/domain/repository/data_source/auth_remote_data_source.dart';
import '../../../api/failures.dart';
import '../../domain/entities/auth_result_entity.dart';
import '../../domain/repository/auth_repository_contract.dart';

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
AuthRepositoryContract injectAuthRepositoryContract(){
  return AuthRepositoryImpl(authRemoteDataSource: injectAuthRemoteDatasource());
}

