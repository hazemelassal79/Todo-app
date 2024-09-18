import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/home_layout/home_layout_view.dart';
import 'package:todo/pages/login/login_view.dart';

class SplashView extends StatefulWidget {
  static const String routeName="SplashScreen";
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), _goNext);
  }

  void _goNext(){
    if(FirebaseAuth.instance.currentUser != null){
      Navigator.pushReplacementNamed(context,HomeLayoutView.routeName);
    }else{
      Navigator.pushReplacementNamed(context,LoginView.routeName);

    }

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Image.asset("assets/images/splash.jpg"),
    );
  }
}
