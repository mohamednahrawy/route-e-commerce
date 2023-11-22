import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_e_commerce_app/utils/app_colors.dart';

class AnnouncementSection extends StatelessWidget {
  AnnouncementSection({super.key});

  final List<String> sliderImages = [
    'assets/images/slider_product_first.png',
    'assets/images/slider_product_second.png',
    'assets/images/slider_product_third.png'
  ];

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      initialPage: 0,
      indicatorBackgroundColor: AppColors.whiteColor,
      indicatorColor: AppColors.primaryColor,
      indicatorPadding: 8.w,
      indicatorRadius: 5.r,
      autoPlayInterval: 5000,
      isLoop: true,
      children: sliderImages.map((e) => Image.asset(e)).toList(),
    );
  }
}
