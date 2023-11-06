import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';
import '../domain/entities/CategoryOrBrandEntity.dart';

class CategoryOrBrandItem extends StatelessWidget {
  final CategoryOrBrandEntity categoryOrBrandEntity;

  const CategoryOrBrandItem({super.key, required this.categoryOrBrandEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.greyColor,
            backgroundImage: NetworkImage(
              categoryOrBrandEntity.image ?? '',
            ),
            radius: 50.r,
          ),
          SizedBox(height: 8.h),
          Text(
            categoryOrBrandEntity.name ?? '',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall,
          )
        ],
      ),
    );
  }
}
