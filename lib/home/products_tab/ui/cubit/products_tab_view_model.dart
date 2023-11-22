import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_app/home/products_tab/ui/cubit/states.dart';
import '../../domain/entities/AddProductToCartEntity.dart';
import '../../domain/entities/products_response_entity.dart';
import '../../domain/use_case/add_product_to_cart_use_case.dart';
import '../../domain/use_case/get_products_use_case.dart';

class ProductsTabViewModel extends Cubit<ProductsTabStates> {
  GetProductsUseCase getProductsUseCase;
  AddToCartUseCase addToCartUse;

  ProductsTabViewModel(
      {required this.getProductsUseCase, required this.addToCartUse})
      : super(ProductsTabInitialState());

  //holds data - handle logic
  List<ProductEntity> products = [];
  int numOfCartItems = 0;

  void getProducts() async {
    emit(ProductsTabLoadingState());
    var either = await getProductsUseCase.invoke();
    either.fold((l) {
      emit(ProductsTabLoadingState());
      emit(ProductsTabErrorState(errorMessage: l.errorMessage));
    }, (r) {
      products = r.products!;
      emit(ProductsTabSuccessState(responseEntity: r));
    });
  }

  void addToCart(String productId) async {
    emit(AddToCartLoadingState(
      loadingMessage: 'Loading...',
    ));
    var response = await addToCartUse.invoke(productId);
    response.fold((l) {
      emit(AddToCartErrorState(errorMessage: l.errorMessage));
    }, (r) {
      numOfCartItems = r.numOfCartItems!;
      emit(AddToCartSuccessState(addToCartResponseEntity: r));
    });
  }
}

///object bloc
///static ProductsTabViewModel get(context)=> BlocProvider.of(context);
