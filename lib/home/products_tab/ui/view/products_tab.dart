import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_e_commerce_app/home/products_tab/domain/add_to_cart_di.dart';
import 'package:route_e_commerce_app/home/products_tab/domain/di.dart';
import 'package:route_e_commerce_app/home/products_tab/ui/cubit/products_tab_view_model.dart';
import 'package:route_e_commerce_app/home/products_tab/ui/cubit/states.dart';
import 'package:route_e_commerce_app/home/products_tab/ui/view/product_details.dart';
import 'package:route_e_commerce_app/home/products_tab/ui/view/product_item.dart';

import '../../../../cart/ui/view/cart_screen.dart';
import '../../../../utils/app_colors.dart';

class ProductsTab extends StatelessWidget {
  final ProductsTabViewModel viewModel = ProductsTabViewModel(
      getProductsUseCase: injectGetProductsUseCase(),
      addToCartUse: injectAddToCartUseCase());

  ProductsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (BuildContext context) => viewModel..getProducts(),
        child: Scaffold(
            appBar: AppBar(
              leading: Image.asset('assets/images/logo.png'),
              leadingWidth: 90.w,
              actions: [
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Badge(
                      padding: EdgeInsets.all(4.sp),
                      label:
                          BlocBuilder<ProductsTabViewModel, ProductsTabStates>(
                              builder: (context, state) =>
                                  Text(viewModel.numOfCartItems.toString())),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(CartScreen.routeName);
                        },
                        child: const Icon(
                          Icons.shopping_cart_outlined,
                        ),
                      )),
                ),
                SizedBox(
                  width: 20.w,
                ),
              ],
            ),
            body: BlocBuilder<ProductsTabViewModel, ProductsTabStates>(
                //bloc: viewModel..getProducts(),
                builder: (context, states) {
              if (states is ProductsTabLoadingState) {
                return Center(
                    child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ));
              }
              if (states is ProductsTabErrorState) {
                return Center(child: Text(states.errorMessage ?? ''));
              }
              if (states is ProductsTabSuccessState) {
                return Padding(
                  padding:
                      EdgeInsets.only(top: 10.0.h, right: 10.w, left: 10.w),
                  child: GridView.builder(
                    itemCount: states.responseEntity.products?.length,
                    itemBuilder: (context, index) => ProductItem(
                      productEntity: states.responseEntity.products![index],
                      onTap: () {
                        viewModel.addToCart(
                          states.responseEntity.products![index].id ?? '',
                        );
                      },
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
            })),
      ),
    );
  }
}
