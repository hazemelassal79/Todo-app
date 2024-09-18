import 'package:flutter/material.dart';
import 'package:todo/pages/login/login_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});
  static const String routeName = "SettingsView";

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    // return Container(
    //   alignment: Alignment.centerLeft,
    //   padding: const EdgeInsets.symmetric(horizontal: 20),
    //   height: 100,
    //   width: double.infinity,
    //   color: theme.primaryColor,
    //   child: Text(
    //     "Settings",
    //     style: theme.textTheme.titleLarge,
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        // systemOverlayStyle: SystemUiOverlayStyle(
        //   statusBarColor: Colors.blue,
        //   statusBarIconBrightness: Brightness.light
        // ),
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        actions:[ IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, LoginView.routeName);
          },
          icon: Icon(
            Icons.logout_rounded,
            size: 30,
            color: Colors.white,
          ),
        ),
        ]
      ),
    );
  }
}
