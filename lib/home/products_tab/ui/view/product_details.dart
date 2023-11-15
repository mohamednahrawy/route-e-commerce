import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'package:route_e_commerce_app/home/products_tab/domain/entities/products_response_entity.dart';
import 'package:route_e_commerce_app/utils/app_colors.dart';

class ProductDetails extends StatelessWidget {
  late final ProductEntity args;
  static const String routeName = 'details-page';

  ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as ProductEntity;
    return Scaffold(
        appBar: buildAppBar(context),
        body: Padding(
          padding: EdgeInsets.only(right: 15.0.w, left: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildImageSlideShow(),
              SizedBox(height: 24.h),
              buildFirstRow(context),
              SizedBox(height: 16.h),
              buildSecondRow(context),
              SizedBox(height: 16.h),
              buildDescription(context),
              SizedBox(height: 130.h),
              buildThirdRow(context),
              SizedBox(height: 70.h),
            ],
          ),
        ));
  }

  buildAppBar(context) => AppBar(
        centerTitle: true,
        title: Text('Product Details',
            style: Theme.of(context).textTheme.bodyLarge),
        actions: [
          const Icon(Icons.search),
          SizedBox(width: 28.w),
          const Icon(Icons.shopping_cart_outlined),
          SizedBox(width: 16.w),
        ],
      );

  buildImageSlideShow() => Container(
        height: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.descriptionColor, width: 1)),
        child: ImageSlideshow(
            height: 300.h,
            children: args.images!
                .map((e) => ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: CachedNetworkImage(
                        imageUrl: e,
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ))
                .toList()),
      );

  buildFirstRow(context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            args.title ?? '',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text('EGP ${args.price ?? ''}',
              style: Theme.of(context).textTheme.bodyMedium),
        ],
      );

  buildSecondRow(context) => Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 7.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: AppColors.descriptionColor)),
            child: Text(
              '${args.sold} Sold',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          SizedBox(width: 16.w),
          Icon(
            Icons.star_outlined,
            color: AppColors.yellowColor,
          ),
          Text(
            '${args.ratingsAverage} (${args.ratingsQuantity})',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Spacer(),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 11.h),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                children: [
                  const Icon(
                    Icons.remove_circle_outline,
                    color: Colors.white,
                  ),
                  SizedBox(width: 21.w),
                  const Text(
                    '0',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 21.w),
                  const Icon(
                    Icons.add_circle_outline,
                    color: Colors.white,
                  ),
                ],
              )),
        ],
      );

  buildDescription(context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(
          'Description',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColors.primaryColor),
        ),
        SizedBox(height: 8.h),
        ReadMoreText(
          '${args.description ?? ''}   ',
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: AppColors.descriptionColor),
          trimLines: 2,
          colorClickableText: Colors.pink,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Show less',
          moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        )
      ]);

  buildThirdRow(context) => Row(children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Text(
                'Total Price',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: AppColors.descriptionColor),
              ),
              Text(
                'EGP 3500',
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
        ),
        SizedBox(width: 30.w),
        Expanded(
            flex: 2,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  shape: const StadiumBorder(),
                  backgroundColor: AppColors.primaryColor),
              onPressed: () {},
              icon: const Icon(
                Icons.add_shopping_cart_outlined,
              ),
              label: Text(
                'Add to Cart',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.white),
              ),
            ))
      ]);
}
