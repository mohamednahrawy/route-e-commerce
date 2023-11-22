import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_app/api/failures.dart';
import 'package:route_e_commerce_app/cart/domain/entities/GetCartResponseEntity.dart';
import 'package:route_e_commerce_app/cart/domain/repository/get_cart_remote_data_source.dart';
import 'package:route_e_commerce_app/cart/domain/repository/get_cart_repository_contract.dart';

class GetCartRepositoryImpl implements GetCartRepositoryContract {
  GetCartRemoteDataSource remoteDataSource;

  GetCartRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart() {
    return remoteDataSource.getCart();
  }
}
