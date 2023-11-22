import 'package:dartz/dartz.dart';
import '../../../../api/failures.dart';
import '../../data/model/AddProductToCartDto.dart';

abstract class AddToCartRepositoryContract{
  Future<Either<Failures, AddToCartResponseDto>> addProductToCart(
      String productId);
}
