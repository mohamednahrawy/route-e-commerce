import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
class LogInScreen extends StatelessWidget {
  static const String routeName = 'login-screen';
  const LogInScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(children: [
        buildImage(),

      ],),
    );
  }
  buildImage() => Padding(
    padding: EdgeInsets.only(top: 71.h, bottom: 40.h),
    child: Image.asset(
      'assets/images/Group 5.png',
    ),
  );
}
