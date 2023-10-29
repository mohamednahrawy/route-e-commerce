import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_e_commerce_app/auth/register/view/register_screen.dart';
import 'package:route_e_commerce_app/splash/splash_screen.dart';
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
            initialRoute: SplashScreen.routeName,
            routes: {
              RegisterScreen.routeName: (context) => const RegisterScreen(),
              SplashScreen.routeName: (context) => const SplashScreen(),
            },
          );
        });
  }
}
