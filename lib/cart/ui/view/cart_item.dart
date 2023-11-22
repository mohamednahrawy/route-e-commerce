import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_e_commerce_app/cart/domain/entities/GetCartResponseEntity.dart';
import '../../../utils/app_colors.dart';

class CartItem extends StatelessWidget {
  final GetCartProductsEntity product;

  const CartItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      padding: EdgeInsets.only(right: 8.w),
      height: 113.h,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(
              color: AppColors.primaryColor.withOpacity(0.30), width: 1.5.w),
          borderRadius: BorderRadius.circular(18.r)),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 113.h,
              width: 120.w,
              child: ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(18.r),
                child: CachedNetworkImage(
                  imageUrl: product.product?.imageCover ?? '',
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  product.product?.title ?? '',
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: AppColors.primaryColor),
                ),
                Text('EGP ${product.price.toString()}', style: Theme.of(context).textTheme.bodyLarge,)

              ],
            ),
          ),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(CupertinoIcons.delete, color: AppColors.primaryColor,size: 23.sp,),
              Container(
                width: 122.w,
                height: 42.h,
                
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(40.r)
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
