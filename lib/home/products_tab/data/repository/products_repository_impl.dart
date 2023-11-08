import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_app/api/failures.dart';
import 'package:route_e_commerce_app/home/products_tab/data/model/ProductResponsetDto.dart';
import 'package:route_e_commerce_app/home/products_tab/domain/repository/products_repository_contract.dart';

import '../../domain/repository/products_remote_data_source.dart';

class ProductsRepositoryImpl implements ProductsRepositoryContract{
  ProductsRemoteDataSource remoteDataSource;
  ProductsRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failures, ProductsResponseDto>> getProducts() {
    return remoteDataSource.getProducts();
  }
}