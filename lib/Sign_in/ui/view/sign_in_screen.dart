import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:route_e_commerce_app/home/home_secreen_ui/ui/home_page.dart';
import 'package:route_e_commerce_app/utils/shared_preferences_utils.dart';
import '../../../../utils/app_colors.dart';
import '../../../register/ui/view/text_field_item.dart';
import '../../../utils/dialog_utils.dart';
import '../../domain/di.dart';
import '../cubit/sign_in_states.dart';
import '../cubit/sign_in_view_model.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = 'login-screen';

  SignInScreen({
    super.key,
  });

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  SignInViewModel viewModel = SignInViewModel(useCase: injectSignInUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInViewModel, SignInStates>(
        bloc: viewModel,
        listener: (context, state) {
          if (state is SignInLoadingState) {
            DialogUtils.showLoading(context,message: 'waiting');
            // DialogUtils.showMessage(context, state.loadingMessage ?? 'waiting');
          } else if (state is SignInErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(context, state.errorMessage ?? '', title: 'Error');
          } else if (state is SignInSuccessState) {
            DialogUtils.hideLoading(context);
             DialogUtils.showMessage(
                context, state.response.user?.name??'', title: 'Success');
             Navigator.of(context).pushNamed(HomePage.routeName);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildImage(),
                      buildEmail(),
                      buildPassword(),
                      buildElevatedButton(context)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
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
        controller: viewModel.signInEmailController,
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
        controller: viewModel.signInPasswordController,
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

  buildElevatedButton(context) => Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: ElevatedButton(
          onPressed: () {
            viewModel.signIn();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.whiteColor,
              padding: EdgeInsets.symmetric(vertical: 12.h),

              ///todo: to give borderRadius to elevatedButton
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r))),
          child: Text(
            'Sign In',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.primaryColor, fontWeight: FontWeight.w600),
          ),
        ),
      );
}
