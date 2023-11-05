import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_e_commerce_app/utils/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
      appBarTheme: const AppBarTheme(color: Colors.transparent,elevation: 0,),
      textTheme: TextTheme(
          titleLarge: GoogleFonts.poppins(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.whiteColor),
          titleMedium: GoogleFonts.poppins(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.whiteColor)),
  );
}
