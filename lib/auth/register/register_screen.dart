import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:route_e_commerce_app/utils/app_colors.dart';
import 'package:route_e_commerce_app/utils/text_field_item.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register-screen';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isObsecurePassword = false;
  bool isObsecureRePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.h),
            child: Form(
              key: formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 71.h),
                    Padding(
                      padding: EdgeInsets.only(bottom: 40.h),
                      child: Image.asset(
                        'assets/images/Group 5.png',
                      ),
                    ),
                    TextFieldItem(
                        fieldName: 'Full Name',
                        hintText: 'Enter your full name',
                        controller: nameController),
                    TextFieldItem(
                      fieldName: 'Mobile Number',
                      hintText: 'Enter your mobile number',
                      controller: mobileController,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Please, Enter your Mobile Number';
                        }
                        if (!RegExp(RegexPattern.phone).hasMatch(text)) {
                          return 'Please Enter a valid phone number';
                        }
                      },
                    ),
                    TextFieldItem(
                      fieldName: 'Email address',
                      hintText: 'Enter your email address',
                      controller: emailController,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'This field is required';
                        }
                        if (!RegExp(RegexPattern.email).hasMatch(text)) {
                          return 'Please, Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    TextFieldItem(
                      fieldName: 'Password',
                      hintText: 'Enter your password',
                      controller: passwordController,
                      isObsecure: isObsecurePassword,
                      suffixIcon: InkWell(
                        child: isObsecurePassword
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                        onTap: () {
                          isObsecurePassword = !isObsecurePassword;
                          setState(() {});
                        },
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'This field is required';
                        }
                        if (!RegExp(RegexPattern.passwordEasy).hasMatch(text)) {
                          return 'Please, Enter a valid password';
                        }
                      },
                    ),
                    TextFieldItem(
                      fieldName: 'Re-Password',
                      hintText: 'Enter your password again',
                      controller: rePasswordController,
                      isObsecure: isObsecureRePassword,
                      suffixIcon: InkWell(
                        child: isObsecureRePassword
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                        onTap: () {
                          isObsecureRePassword = !isObsecureRePassword;
                          setState(() {});
                        },
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'This field is required';
                        }
                        if (text != passwordController.text) {
                          return "Password doesn't match";
                        }
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: ElevatedButton(
                        onPressed: () {
                          if(formKey.currentState!.validate()){}
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.whiteColor,
                            padding: EdgeInsets.symmetric(vertical: 12.h),

                            ///todo: to give borderRadius to elevatedButton
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r))),
                        child: Text(
                          'Register',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
