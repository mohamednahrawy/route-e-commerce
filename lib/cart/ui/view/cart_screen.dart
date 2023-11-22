import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_e_commerce_app/cart/domain/di.dart';
import 'package:route_e_commerce_app/cart/ui/cubit/cart_screen_states.dart';
import 'package:route_e_commerce_app/cart/ui/cubit/cart_screen_view_model.dart';

import '../../../../utils/app_colors.dart';
import 'cart_item.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = 'cart-screen';
  final CartScreenViewModel viewModel =
      CartScreenViewModel(getCartUseCase: injectGetCartUseCase());

  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartScreenViewModel,CartScreenStates>(
        bloc: viewModel..getCart(),
        builder: (BuildContext context, state) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Cart',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: AppColors.primaryColor),
                ),
                centerTitle: true,
                actions: [
                  Icon(
                    Icons.search,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  Icon(
                    Icons.shopping_cart_outlined,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(width: 20.w),
                ],
              ),
              body: state is CartScreenSuccessState
                  ? ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                      itemCount: state.response.data?.products?.length,
                      itemBuilder: (context, index) =>
                          CartItem(product: state.response.data!.products![index]))
                  : Center(
                      child: CircularProgressIndicator(color: AppColors.primaryColor)));
        });
  }
}
