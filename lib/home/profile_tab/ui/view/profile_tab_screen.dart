import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_e_commerce_app/Sign_in/ui/view/sign_in_screen.dart';
import 'package:route_e_commerce_app/home/profile_tab/ui/view/my_profile_text_field.dart';
import 'package:route_e_commerce_app/utils/shared_preferences_utils.dart';

import '../../../../utils/app_colors.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90.w,
        leading: Image.asset('assets/images/logo.png'),
        actions: [
          InkWell(
              onTap: () {
                SharedPreferenceUtils.clearData();
                Navigator.of(context).pushNamedAndRemoveUntil(
                    SignInScreen.routeName, (route) => false);
              },
              child: CircleAvatar(
                  backgroundColor: AppColors.greyColor.withOpacity(.30),
                  child: Icon(
                    Icons.logout_outlined,
                    color: AppColors.primaryColor,
                  ))),
          SizedBox(
            width: 20.w,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.0.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                style: Theme.of(context).textTheme.bodyMedium,
                'Welcome, Mohamed'.toUpperCase(),
              ),
              Text(
                'ma.multipharma@gmail.com'.toLowerCase(),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.greyColor),
              ),
              SizedBox(
                height: 30.h,
              ),
              const MyProfileTextField(title: 'Your Full Name'),
              const MyProfileTextField(title: 'Your E-mail'),
              const MyProfileTextField(title: 'Your password'),
              const MyProfileTextField(title: 'Your mobile number'),
              const MyProfileTextField(title: 'Your address'),
            ],
          ),
        ),
      ),
    );
  }
}
