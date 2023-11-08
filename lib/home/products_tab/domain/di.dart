import 'package:route_e_commerce_app/home/products_tab/data/repository/products_remote_data_source_impl.dart';
import 'package:route_e_commerce_app/home/products_tab/data/repository/products_repository_impl.dart';
import 'package:route_e_commerce_app/home/products_tab/domain/repository/products_remote_data_source.dart';
import 'package:route_e_commerce_app/home/products_tab/domain/repository/products_repository_contract.dart';
import 'package:route_e_commerce_app/home/products_tab/domain/use_case/get_products_use_case.dart';

import '../../../api/api_manager.dart';

GetProductsUseCase injectGetProductsUseCase() {
  return GetProductsUseCase(
      productsRepositoryContract: injectProductsRepositoryContract());
}

ProductsRepositoryContract injectProductsRepositoryContract() {
  return ProductsRepositoryImpl(
      remoteDataSource: injectProductsRemoteDataSource());
}

ProductsRemoteDataSource injectProductsRemoteDataSource() {
  return ProductsRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
