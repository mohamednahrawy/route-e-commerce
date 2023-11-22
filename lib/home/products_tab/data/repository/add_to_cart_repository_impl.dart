import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_app/api/failures.dart';
import 'package:route_e_commerce_app/home/products_tab/data/model/AddProductToCartDto.dart';
import 'package:route_e_commerce_app/home/products_tab/domain/repository/add_to_cart_remote_data_source.dart';
import 'package:route_e_commerce_app/home/products_tab/domain/repository/add_to_cart_repository_contract.dart';

class AddToCartRepositoryImpl implements AddToCartRepositoryContract{
  AddToCartRemoteDataSource addToCartRemoteDataSource;
  AddToCartRepositoryImpl({required this.addToCartRemoteDataSource});
  @override
  Future<Either<Failures, AddToCartResponseDto>> addProductToCart(String productId) async{
    return await addToCartRemoteDataSource.addProductToCart(productId);
  }
}