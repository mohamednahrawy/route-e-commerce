import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_e_commerce_app/home/products_tab/ui/view/product_details.dart';
import 'package:route_e_commerce_app/register/ui/view/register_screen.dart';
import 'package:route_e_commerce_app/splash/splash_screen.dart';
import 'home/home_secreen_ui/home_page.dart';
import 'login/ui/view/login_screen.dart';
import 'utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            initialRoute: LoginScreen.routeName,
            routes: {
              LoginScreen.routeName : (context)=> LoginScreen(),
              RegisterScreen.routeName: (context) => const RegisterScreen(),
              SplashScreen.routeName: (context) => const SplashScreen(),
              HomePage.routeName : (context)=> HomePage(),
              ProductDetails.routeName : (context)=> ProductDetails(),
            },
          );
        });
  }
}
