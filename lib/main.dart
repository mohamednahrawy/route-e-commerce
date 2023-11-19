import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_e_commerce_app/home/products_tab/ui/view/product_details.dart';
import 'package:route_e_commerce_app/register/ui/view/register_screen.dart';
import 'package:route_e_commerce_app/splash/splash_screen.dart';
import 'package:route_e_commerce_app/utils/shared_preferences_utils.dart';
import 'Sign_in/ui/view/sign_in_screen.dart';
import 'home/home_secreen_ui/ui/home_page.dart';
import 'utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var token = await SharedPreferenceUtils.getData('token') ;
  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
 final String? token ;
  const MyApp({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            initialRoute:
                token == null ? SignInScreen.routeName: HomePage.routeName  ,
            routes: {
              SignInScreen.routeName: (context) => SignInScreen(),
              RegisterScreen.routeName: (context) => const RegisterScreen(),
              SplashScreen.routeName: (context) => const SplashScreen(),
              HomePage.routeName: (context) => HomePage(),
              ProductDetails.routeName: (context) => ProductDetails(),
            },
          );
        });
  }
}

