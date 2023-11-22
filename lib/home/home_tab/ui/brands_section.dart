import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_e_commerce_app/home/home_tab/ui/category_or_brand_item.dart';

import '../../../utils/app_colors.dart';
import '../domain/entities/CategoryOrBrandEntity.dart';
class BrandsSection extends StatelessWidget {
  final List<CategoryOrBrandEntity> brandsList;
  const BrandsSection({super.key, required this.brandsList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildBrands(context),
          Expanded(
            child: ListView.builder(
                padding:
                EdgeInsets.symmetric(horizontal: 15.w),
                scrollDirection: Axis.horizontal,
                itemCount: brandsList.length,
                itemBuilder: (context, index) =>
                    CategoryOrBrandItem(
                        categoryOrBrandEntity:
                        brandsList[index])),
          )
        ],
      ),
    );
  }
  buildBrands(context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.h),
    child: Text(
      'Brands',
      textAlign: TextAlign.start,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: AppColors.primaryColor, fontWeight: FontWeight.bold),
    ),
  );
}
