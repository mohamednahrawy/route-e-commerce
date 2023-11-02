import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:route_e_commerce_app/auth/data/repository/auth_repository/repository/auth_repository_impl.dart';
import 'package:route_e_commerce_app/utils/app_colors.dart';
import 'package:route_e_commerce_app/utils/text_field_item.dart';
import '../../../utils/dialog_utils.dart';
import 'cubit/register_screen_view_model.dart';
import 'cubit/states.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register-screen';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterScreenViewModel viewModel = RegisterScreenViewModel(
      authRepositoryContract: injectAuthRepositoryContract());

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterScreenViewModel, RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showMessage(context, state.loadingMessage ?? 'waiting');
        } else if (state is RegisterErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage ?? '');
        } else if (state is RegisterSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.response.user?.name ?? '');
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.h),
              child: Form(
                key: viewModel.formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildImage(),
                      buildName(),
                      buildMobile(),
                      buildEmail(),
                      buildPassword(),
                      buildRepassword(),
                      buildElevatedButton()
                    ]),
              ),
            ),
          ),
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

  buildName() => TextFieldItem(
      fieldName: 'Full Name',
      hintText: 'Enter your full name',
      controller: viewModel.nameController);

  buildMobile() => TextFieldItem(
        fieldName: 'Mobile Number',
        hintText: 'Enter your mobile number',
        controller: viewModel.phoneController,
        validator: (text) {
          if (text == null || text.isEmpty) {
            return 'Please, Enter your Mobile Number';
          }
          if (!RegExp(RegexPattern.phone).hasMatch(text)) {
            return 'Please Enter a valid phone number';
          }
        },
      );

  buildEmail() => TextFieldItem(
        fieldName: 'Email address',
        hintText: 'Enter your email address',
        controller: viewModel.emailController,
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
        controller: viewModel.passwordController,
        isObsecure: viewModel.isObsecurePassword,
        suffixIcon: InkWell(
          child: viewModel.isObsecurePassword
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
          onTap: () {
            viewModel.isObsecurePassword = !viewModel.isObsecurePassword;
            setState(() {});
          },
        ),
        validator: (text) {
          if (text == null || text.isEmpty) {
            return 'This field is required';
          }
        },
      );

  buildRepassword() => TextFieldItem(
        fieldName: 'Re-Password',
        hintText: 'Enter your password again',
        controller: viewModel.rePasswordController,
        isObsecure: viewModel.isObsecureRePassword,
        suffixIcon: InkWell(
          child: viewModel.isObsecureRePassword
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
          onTap: () {
            viewModel.isObsecureRePassword = !viewModel.isObsecureRePassword;
            setState(() {});
          },
        ),
        validator: (text) {
          if (text == null || text.isEmpty) {
            return 'This field is required';
          }
          if (text != viewModel.passwordController.text) {
            return "Password doesn't match";
          }
        },
      );

  buildElevatedButton() => Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: ElevatedButton(
          onPressed: () {
            viewModel.register();
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
