import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_e_commerce_app/utils/app_colors.dart';

class TextFieldItem extends StatelessWidget {
  final String fieldName;
  final String hintText;
  final Widget? suffixIcon;

  ///todo: nullable(initial value is null)
  final bool isObsecure;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputType? keyBoardType;

  const TextFieldItem(
      {super.key,
      required this.fieldName,
      required this.hintText,
      this.suffixIcon,
      this.isObsecure = false,
      this.validator,
      required this.controller,
      this.keyBoardType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(fieldName,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.start),
        Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
            child: TextFormField(
              obscureText: isObsecure,
              ///todo: style of the text of textField
              style: GoogleFonts.poppins(color: AppColors.blackColor),
              validator: validator,
              controller: controller,
              ///todo: keyboardType
              keyboardType: keyBoardType,
              decoration: InputDecoration(
                ///todo: to control the height of textField
                contentPadding:
                    EdgeInsets.symmetric(vertical: 18.h, horizontal: 14.h),
                ///todo: color of the textField
                fillColor: AppColors.whiteColor,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                hintText: hintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: AppColors.greyColor),
                ///todo: to add suffix icon
                suffixIcon: suffixIcon,
              ),
            )),
      ],
    );
  }
}
