import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/pages/login/login_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  static const String routeName = "SettingsView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // systemOverlayStyle: SystemUiOverlayStyle(
          //   statusBarColor: Colors.blue,
          //   statusBarIconBrightness: Brightness.light
          // ),
          title: const Text(
            "Settings",
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                if(FirebaseAuth.instance.currentUser == null){
                  Navigator.pushReplacementNamed(context, LoginView.routeName);
                }
              },
              icon: const Icon(
                Icons.logout_rounded,
                size: 30,
                color: Colors.white,
              ),
            ),
          ]),
    );
  }

}
