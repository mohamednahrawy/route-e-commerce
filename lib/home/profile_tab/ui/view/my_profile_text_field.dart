import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_colors.dart';

class MyProfileTextField extends StatelessWidget {
  final String title;

  const MyProfileTextField({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
        ),
        SizedBox(height: 16.h),
        TextFormField(
          style: Theme.of(context).textTheme.bodySmall,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors.primaryColor.withOpacity(0.30),
                    width: 1.5.w),
                borderRadius: BorderRadius.circular(16.r)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors.primaryColor.withOpacity(0.30),
                    width: 1.5.w),
                borderRadius: BorderRadius.circular(16.r)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors.primaryColor.withOpacity(0.30),
                    width: 1.5.w),
                borderRadius: BorderRadius.circular(16.r)),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors.primaryColor.withOpacity(0.30),
                    width: 1.5.w),
                borderRadius: BorderRadius.circular(16.r)),
            suffixIcon: const Icon(Icons.edit),
          ),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
