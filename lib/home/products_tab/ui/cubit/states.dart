import 'package:route_e_commerce_app/home/products_tab/domain/entities/AddProductToCartEntity.dart';
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

///todo: AddToCart States
class AddToCartInitialState extends ProductsTabStates {}

class AddToCartLoadingState extends ProductsTabStates {
  String? loadingMessage;

  AddToCartLoadingState({required this.loadingMessage});
}

class AddToCartErrorState extends ProductsTabStates {
  String? errorMessage;

  AddToCartErrorState({required this.errorMessage});
}

class AddToCartSuccessState extends ProductsTabStates {
  AddToCartResponseEntity addToCartResponseEntity;

  AddToCartSuccessState({required this.addToCartResponseEntity});
}
class CounterState extends ProductsTabStates{
  int counter;
  CounterState({required this.counter});
}