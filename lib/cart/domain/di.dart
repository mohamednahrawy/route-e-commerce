import 'package:route_e_commerce_app/api/api_manager.dart';
import 'package:route_e_commerce_app/cart/data/repository/get_cart_remote_data_source_impl.dart';
import 'package:route_e_commerce_app/cart/data/repository/get_cart_repository_impl.dart';
import 'package:route_e_commerce_app/cart/domain/repository/get_cart_remote_data_source.dart';
import 'package:route_e_commerce_app/cart/domain/repository/get_cart_repository_contract.dart';
import 'package:route_e_commerce_app/cart/domain/use_case/get_cart_use_case.dart';

GetCartUseCase injectGetCartUseCase() {
  return GetCartUseCase(repositoryContract: injectGetCartRepositoryContract());
}

GetCartRepositoryContract injectGetCartRepositoryContract() {
  return GetCartRepositoryImpl(
      remoteDataSource: injectGetCartRemoteDataSource());
}

GetCartRemoteDataSource injectGetCartRemoteDataSource() {
  return GetCartRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
