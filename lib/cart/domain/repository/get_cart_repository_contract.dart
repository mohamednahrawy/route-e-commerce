import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_app/cart/domain/entities/GetCartResponseEntity.dart';
import '../../../api/failures.dart';
import '../../data/model/GetCartResponseDto.dart';

abstract class GetCartRepositoryContract{
  Future<Either<Failures, GetCartResponseEntity>> getCart();
}