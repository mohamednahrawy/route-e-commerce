import 'package:bloc/bloc.dart';
import 'package:route_e_commerce_app/home/products_tab/ui/cubit/states.dart';

import '../../domain/entities/products_response_entity.dart';
import '../../domain/use_case/get_products_use_case.dart';

class ProductsTabViewModel extends Cubit<ProductsTabStates> {
  GetProductsUseCase getProductsUseCase;

  ProductsTabViewModel({required this.getProductsUseCase})
      : super(ProductsTabInitialState());

  //holds data - handle logic
  List<ProductEntity> products = [];

  void getProducts()async {
    var either = await getProductsUseCase.invoke();
    either.fold(
            (l){
              emit(ProductsTabErrorState(errorMessage: l.errorMessage));
            },
            (r) {
              products = r.products!;
              emit(ProductsTabSuccessState(responseEntity: r));
            }
    );
  }
}