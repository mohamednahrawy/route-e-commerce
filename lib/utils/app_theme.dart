import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_e_commerce_app/utils/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.primaryColor),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.whiteColor),
      titleMedium: GoogleFonts.poppins(
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.whiteColor),
      titleSmall: GoogleFonts.poppins(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.primaryColor),
      bodyLarge: GoogleFonts.poppins(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryColor),
      bodyMedium: GoogleFonts.poppins(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryColor),
      bodySmall: GoogleFonts.poppins(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryColor),
    ),
  );
}
