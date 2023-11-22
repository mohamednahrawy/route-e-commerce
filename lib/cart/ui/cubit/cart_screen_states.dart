import 'package:route_e_commerce_app/cart/domain/entities/GetCartResponseEntity.dart';

import '../../../api/failures.dart';

abstract class CartScreenStates {}

class CartScreenInitialState extends CartScreenStates {}

class CartScreenLoadingState extends CartScreenStates {
  String? loadingMessage;

  CartScreenLoadingState({required this.loadingMessage});
}

class CartScreenErrorState extends CartScreenStates {
  Failures failures;
  CartScreenErrorState({required this.failures});
}

class CartScreenSuccessState extends CartScreenStates {
  GetCartResponseEntity response;
  CartScreenSuccessState({required this.response});
}
