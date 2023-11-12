import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_e_commerce_app/home/products_tab/domain/di.dart';
import 'package:route_e_commerce_app/home/products_tab/ui/cubit/products_tab_view_model.dart';
import 'package:route_e_commerce_app/home/products_tab/ui/cubit/states.dart';
import 'package:route_e_commerce_app/home/products_tab/ui/view/product_details.dart';
import 'package:route_e_commerce_app/home/products_tab/ui/view/product_item.dart';

import '../../../../utils/app_colors.dart';

class ProductsTab extends StatelessWidget {
  final ProductsTabViewModel viewModel =
      ProductsTabViewModel(getProductsUseCase: injectGetProductsUseCase());

  ProductsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leadingWidth: 90.w, leading: Image.asset('assets/images/logo.png')),
        body: BlocBuilder<ProductsTabViewModel, ProductsTabStates>(
            bloc: viewModel..getProducts(),
            builder: (context, states) {
              if (states is ProductsTabLoadingState) {
                return Center(
                    child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ));
              }
              if (states is ProductsTabErrorState) {
                return Text(states.errorMessage ?? '');
              }
              if (states is ProductsTabSuccessState) {
                return Padding(
                  padding:
                      EdgeInsets.only(top: 10.0.h, right: 10.w, left: 10.w),
                  child: GridView.builder(
                    itemCount: states.responseEntity.products?.length,
                    itemBuilder: (context, index) => ProductItem(
                      productEntity: states.responseEntity.products![index],
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12.h,
                        crossAxisSpacing: 12.w,
                        childAspectRatio: 2 / 3),
                  ),
                );
              } else {
                return Container();
              }
            }));
  }
}
