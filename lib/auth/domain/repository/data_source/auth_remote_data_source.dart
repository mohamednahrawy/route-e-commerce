import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_app/auth/domain/entities/auth_result_entity.dart';

import '../../../data/api/api_manager.dart';
import '../../../data/api/failures.dart';
import '../../../data/model/response/register_response.dart';
import '../../../data/repository/data_source/auth_remote_data_source_impl.dart';

abstract class AuthRemoteDataSource {
  ///todo: includes only abstract function
  ///todo: use EntityModel in the domain and all its functions
  Future<Either<Failures,AuthResultEntity>> register(String name, String email, String password,
      String rePassword, String phone);
}

AuthRemoteDataSource injectAuthRemoteDatasource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager());
}