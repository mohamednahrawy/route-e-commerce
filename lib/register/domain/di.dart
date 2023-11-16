import 'package:route_e_commerce_app/register/domain/repository/auth_repository_contract.dart';
import 'package:route_e_commerce_app/register/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:route_e_commerce_app/register/domain/use_case/register_use_case.dart';

import '../../api/api_manager.dart';
import '../data/repository/auth_repository_impl.dart';
import '../data/repository/data_source/auth_remote_data_source_impl.dart';

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(repositoryContract: injectAuthRepositoryContract());
}

AuthRepositoryContract injectAuthRepositoryContract(){
  return AuthRepositoryImpl(authRemoteDataSource: injectAuthRemoteDatasource());
}

AuthRemoteDataSource injectAuthRemoteDatasource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager());
}