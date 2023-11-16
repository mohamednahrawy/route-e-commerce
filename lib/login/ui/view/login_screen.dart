import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:regexpattern/regexpattern.dart';
import '../../../../utils/app_colors.dart';
import '../../../register/ui/view/text_field_item.dart';
class LoginScreen extends StatefulWidget {
  static const String routeName = 'login-screen';
  LoginScreen({super.key, });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   var signInEmailController = TextEditingController();

   var signInPasswordController = TextEditingController();

   bool isObsecurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            buildImage(),
              buildEmail(),
              buildPassword(),
              buildElevatedButton(context)

          ],),
        ),
      ),
    );
  }

  buildImage() => Padding(
    padding: EdgeInsets.only(top: 71.h, bottom: 40.h),
    child: Image.asset(
      'assets/images/Group 5.png',
    ),
  );

  buildEmail() => TextFieldItem(
    fieldName: 'Email address',
    hintText: 'Enter your email address',
    controller: signInEmailController,
    validator: (text) {
      if (text == null || text.isEmpty) {
        return 'This field is required';
      }
      if (!RegExp(RegexPattern.email).hasMatch(text)) {
        return 'Please, Enter a valid email';
      }
      return null;
    },
  );

  buildPassword() => TextFieldItem(
    fieldName: 'Password',
    hintText: 'Enter your password',
    controller: signInPasswordController,
    isObsecure: isObsecurePassword,
    suffixIcon: InkWell(
      child: isObsecurePassword
          ? const Icon(Icons.visibility_off)
          : const Icon(Icons.visibility),
      onTap: () {
        isObsecurePassword = isObsecurePassword;
        setState(() {});
      },
    ),
    validator: (text) {
      if (text == null || text.isEmpty) {
        return 'This field is required';
      }
    },
  );

  buildElevatedButton(context) => Padding(
    padding: EdgeInsets.symmetric(vertical: 20.h),
    child: ElevatedButton(
      onPressed: () {
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.whiteColor,
          padding: EdgeInsets.symmetric(vertical: 12.h),

          ///todo: to give borderRadius to elevatedButton
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r))),
      child: Text(
        'Register',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.primaryColor, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
