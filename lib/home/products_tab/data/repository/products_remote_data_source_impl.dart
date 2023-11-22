import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_app/api/failures.dart';
import 'package:route_e_commerce_app/home/products_tab/data/model/ProductResponsetDto.dart';
import 'package:route_e_commerce_app/home/products_tab/domain/repository/products_remote_data_source.dart';

import '../../../../api/api_manager.dart';

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  ApiManager apiManager;

  ProductsRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, ProductsResponseDto>> getProducts() {
   return apiManager.getProducts();
  }
}
