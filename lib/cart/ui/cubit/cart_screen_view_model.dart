import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_app/api/failures.dart';
import 'package:route_e_commerce_app/cart/ui/cubit/cart_screen_states.dart';

import '../../domain/entities/GetCartResponseEntity.dart';
import '../../domain/use_case/get_cart_use_case.dart';

class CartScreenViewModel extends Cubit<CartScreenStates> {
  GetCartUseCase getCartUseCase;

  CartScreenViewModel({required this.getCartUseCase})
      : super(CartScreenInitialState());

  //hold data - handle logic
  List<GetCartProductsEntity> productList = [];

  void getCart()async  {
    emit(CartScreenLoadingState(loadingMessage: 'Loading...'));
    var either = await getCartUseCase.invoke();
    either.fold(
            (l) {
              emit(CartScreenErrorState(failures: l));
            },
            (r) {
              productList = r.data?.products??[];
              emit(CartScreenSuccessState(response: r));
            }
    );
  }
}
