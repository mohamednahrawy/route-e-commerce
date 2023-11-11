import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_app/home/products_tab/domain/di.dart';
import 'package:route_e_commerce_app/home/products_tab/ui/cubit/products_tab_view_model.dart';
import 'package:route_e_commerce_app/home/products_tab/ui/cubit/states.dart';

class ProductsTab extends StatelessWidget {
  final ProductsTabViewModel viewModel =
      ProductsTabViewModel(getProductsUseCase: injectGetProductsUseCase());

  ProductsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductsTabViewModel, ProductsTabStates>(
          bloc: viewModel..getProducts(),
          builder: (context, states) {
            return Center(child: Text(viewModel.products.length.toString()));
          }),
    );
  }
}
