import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_app/api/failures.dart';
import 'package:route_e_commerce_app/home/products_tab/data/model/AddProductToCartDto.dart';
import 'package:route_e_commerce_app/home/products_tab/domain/repository/add_to_cart_remote_data_source.dart';
import '../../../../api/api_manager.dart';

class AddToCartRemoteDataSourceImpl implements AddToCartRemoteDataSource {
  ApiManager apiManager;

  AddToCartRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, AddToCartResponseDto>> addProductToCart(
      String productId) async {
    return await apiManager.addProductToCart(productId);
  }
}
