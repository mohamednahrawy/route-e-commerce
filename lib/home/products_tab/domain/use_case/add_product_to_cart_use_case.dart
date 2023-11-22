import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_app/home/products_tab/domain/repository/add_to_cart_repository_contract.dart';

import '../../../../api/failures.dart';
import '../../data/model/AddProductToCartDto.dart';

class AddToCartUseCase {
  AddToCartRepositoryContract addToCartRepositoryContract;

  AddToCartUseCase({required this.addToCartRepositoryContract});

  Future<Either<Failures, AddToCartResponseDto>> invoke(
      String productId) async {
    return await addToCartRepositoryContract.addProductToCart(productId);
  }
}
