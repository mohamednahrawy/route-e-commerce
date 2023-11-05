import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'announcement_section.dart';
import 'categories_section.dart';
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leadingWidth: 90.w,
          leading: Image.asset('assets/images/logo.png')),
      body: Column(
        children: [
          AnnouncementSection(),
          SizedBox(height: 16.h,),
          CategoriesSection(),
        ],
      ),
    );
  }
}
