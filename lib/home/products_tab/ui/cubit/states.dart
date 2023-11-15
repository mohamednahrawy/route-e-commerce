import 'package:route_e_commerce_app/home/products_tab/domain/entities/products_response_entity.dart';

abstract class ProductsTabStates {}

class ProductsTabInitialState extends ProductsTabStates {}

class ProductsTabLoadingState extends ProductsTabStates {
  String? loadingMessage;

  ProductsTabLoadingState({this.loadingMessage});
}

class ProductsTabErrorState extends ProductsTabStates {
  String? errorMessage;

  ProductsTabErrorState({required this.errorMessage});
}

class ProductsTabSuccessState extends ProductsTabStates {
  ProductsResponseEntity responseEntity;

  ProductsTabSuccessState({required this.responseEntity});
}
