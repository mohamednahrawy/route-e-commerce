import 'package:dartz/dartz.dart';
import '../../../../api/failures.dart';
import '../../data/model/ProductResponsetDto.dart';

abstract class ProductsRepositoryContract{
  Future<Either<Failures, ProductsResponseDto>> getProducts();
}