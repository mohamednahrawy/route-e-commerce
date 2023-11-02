import '../../../data/api/api_manager.dart';
import '../../../data/model/response/RegisterResponse.dart';
import '../../../data/repository/data_source/auth_remote_data_source_impl.dart';

abstract class AuthRemoteDataSource {
  ///todo: includes only abstract function
  Future<RegisterResponse> register(String name, String email, String password,
      String rePassword, String phone);
}

AuthRemoteDataSource injectAuthRemoteDatasource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager());
}