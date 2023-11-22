import 'package:route_e_commerce_app/home/products_tab/data/repository/add_to_cart_remote_data_source_impl.dart';
import 'package:route_e_commerce_app/home/products_tab/data/repository/add_to_cart_repository_impl.dart';
import 'package:route_e_commerce_app/home/products_tab/domain/repository/add_to_cart_remote_data_source.dart';
import 'package:route_e_commerce_app/home/products_tab/domain/repository/add_to_cart_repository_contract.dart';
import 'package:route_e_commerce_app/home/products_tab/domain/use_case/add_product_to_cart_use_case.dart';
import '../../../api/api_manager.dart';

AddToCartUseCase injectAddToCartUseCase() {
  return AddToCartUseCase(
      addToCartRepositoryContract: injectAddToCartRepositoryContract());
}

AddToCartRepositoryContract injectAddToCartRepositoryContract() {
  return AddToCartRepositoryImpl(
      addToCartRemoteDataSource: injectRemoteDataSource());
}

AddToCartRemoteDataSource injectRemoteDataSource() {
  return AddToCartRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
