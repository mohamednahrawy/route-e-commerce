import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_e_commerce_app/home/products_tab/domain/entities/products_response_entity.dart';
import 'package:route_e_commerce_app/home/products_tab/ui/view/product_details.dart';
import 'package:route_e_commerce_app/utils/app_colors.dart';

class ProductItem extends StatelessWidget {
  final ProductEntity productEntity;
  final void Function()? onTap;

  const ProductItem({super.key, required this.productEntity, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProductDetails.routeName, arguments: productEntity);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.descriptionColor, width: 1),
        ),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(flex: 6, child: buildImage()),
              Expanded(flex: 5, child: buildDetails(context))
            ],
          ),
          Align(
              alignment: Alignment.topRight,
              child: ImageIcon(
                const AssetImage(
                  'assets/images/heart_unselected.png',
                ),
                size: 60,
                color: AppColors.primaryColor,
              )),
          Align(
              alignment: Alignment.bottomRight,
              child: ImageIcon(
                const AssetImage(
                  'assets/images/icon_plus_circle.png',
                ),
                size: 60,
                color: AppColors.primaryColor,
              )),
        ]),
      ),
    );
  }

  buildImage() => ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: CachedNetworkImage(
        imageUrl: productEntity.imageCover ?? '',
        fit: BoxFit.fill,
      ));

  buildDetails(context) => Padding(
        padding: EdgeInsets.only(right: 8.0.w, left: 8.w, top: 4.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productEntity.title ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: AppColors.primaryColor, height: 1.2),
            ),
            Text(
              productEntity.description ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: AppColors.primaryColor, height: 1.2),
            ),
            SizedBox(height: 10.h),
            Text(
              'EGP ${productEntity.price} ',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: AppColors.primaryColor),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Text(
                  'Review (${productEntity.ratingsAverage})',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.primaryColor,
                      letterSpacing: 0.05,
                      fontSize: 14.sp),
                ),
                SizedBox(
                  width: 4.w,
                ),
                Icon(
                  Icons.star_outlined,
                  color: AppColors.yellowColor,
                ),
              ],
            )
          ],
        ),
      );
}
