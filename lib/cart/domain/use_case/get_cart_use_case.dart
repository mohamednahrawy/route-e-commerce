import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_app/cart/domain/repository/get_cart_repository_contract.dart';
import '../../../api/failures.dart';
import '../entities/GetCartResponseEntity.dart';

class GetCartUseCase {
  GetCartRepositoryContract repositoryContract;

  GetCartUseCase({required this.repositoryContract});

  Future<Either<Failures, GetCartResponseEntity>> invoke() {
    return  repositoryContract.getCart();
  }
}

