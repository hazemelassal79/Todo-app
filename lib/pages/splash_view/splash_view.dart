import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/home_layout/home_layout_view.dart';
import 'package:todo/pages/login/login_view.dart';

class SplashView extends StatefulWidget {
  static const String routeName = "SplashScreen";
  const SplashView({super.key});


  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
   super.initState();
    Future.delayed(const Duration(seconds: 3), initialRoute);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset("assets/images/splash.jpg"),
    );
  }

  void initialRoute() {
    if (FirebaseAuth.instance.currentUser != null) {
     Navigator.of(context).pushReplacementNamed(HomeLayoutView.routeName);
     return;
    }
    Navigator.of(context).pushReplacementNamed(LoginView.routeName);
  }
}
