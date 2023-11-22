import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_app/api/failures.dart';
import 'package:route_e_commerce_app/cart/domain/entities/GetCartResponseEntity.dart';
import 'package:route_e_commerce_app/cart/domain/repository/get_cart_remote_data_source.dart';

import '../../../api/api_manager.dart';

class GetCartRemoteDataSourceImpl implements GetCartRemoteDataSource {
  ApiManager apiManager;

  GetCartRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart() {
   return  apiManager.getCart();
  }
}
