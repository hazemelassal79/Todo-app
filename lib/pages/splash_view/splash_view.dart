import 'dart:async';
import 'package:flutter/material.dart';
import 'package:todo/pages/login/login_view.dart';

class SplashView extends StatelessWidget {
  static const String routeName="SplashScreen";
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context,LoginView.routeName);
    });
    return Scaffold(
      body: Image.asset("assets/images/splash_light.png"),
    );
  }
}
