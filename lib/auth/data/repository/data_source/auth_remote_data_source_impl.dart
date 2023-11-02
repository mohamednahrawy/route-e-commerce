import 'package:route_e_commerce_app/auth/data/model/response/RegisterResponse.dart';
import 'package:route_e_commerce_app/auth/domain/repository/data_source/auth_remote_data_source.dart';

import '../../api/api_manager.dart';


class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;
///todo: constructor injection
  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<RegisterResponse> register(String name, String email, String password,
      String rePassword, String phone) {
    return apiManager.register(name, email, password, rePassword, phone);
  }
}
