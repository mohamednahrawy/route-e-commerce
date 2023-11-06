import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../domain/entities/CategoryOrBrandEntity.dart';
import 'category_or_brand_item.dart';
class CategoriesSection extends StatelessWidget {
  final List<CategoryOrBrandEntity> categoriesList;
  const CategoriesSection({super.key, required this.categoriesList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380.h,
      child: Column(
        children: [
          buildRow(context),
          SizedBox(
            height: 15.h,
          ),
          Expanded(
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2),
              itemCount: categoriesList.length,
              itemBuilder: (BuildContext context,
                  int index) =>
                  CategoryOrBrandItem(
                      categoryOrBrandEntity:
                      categoriesList[index]),
            ),
          ),
        ],
      ),
    );
  }
  buildRow(context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 12.0.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Categories',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.primaryColor, fontWeight: FontWeight.bold),
        ),
        Text(
          'View All',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: AppColors.primaryColor, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
