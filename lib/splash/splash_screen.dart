import 'dart:async';
import 'package:flutter/material.dart';

import '../auth/ui/register_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash-screen';

  const SplashScreen({super.key});


  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacementNamed(RegisterScreen.routeName));
    return Scaffold(
      body: Image.asset(
        'assets/images/Splash Screen.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
