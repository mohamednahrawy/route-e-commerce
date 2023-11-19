


import 'package:route_e_commerce_app/Sign_in/domain/repository/signin_remote_data_source.dart';
import 'package:route_e_commerce_app/Sign_in/domain/repository/signin_repository_contract.dart';
import 'package:route_e_commerce_app/Sign_in/domain/use_case/signin_use_case.dart';

import '../../api/api_manager.dart';
import '../data/repository/signin_remote_data_source_impl.dart';
import '../data/repository/signin_repository_impl.dart';

SignInUseCase injectSignInUseCase (){
  return SignInUseCase(repositoryContract: injectSignInRepositoryContract());
}
SignInRepositoryContract injectSignInRepositoryContract(){
  return SignInRepositoryImpl(remoteDataSource: injectSignInRemoteDataSource());
}

SignInRemoteDataSource injectSignInRemoteDataSource() {
  return SignInRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}