import 'package:dartz/dartz.dart';

import '../../../../api/failures.dart';
import '../../data/model/ProductResponsetDto.dart';
import '../repository/products_repository_contract.dart';

class GetProductsUseCase {
  ProductsRepositoryContract productsRepositoryContract;

  GetProductsUseCase({required this.productsRepositoryContract});

  Future<Either<Failures, ProductsResponseDto>> invoke() {
    return productsRepositoryContract.getProducts();
  }
}
