import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/home_layout/home_layout_view.dart';
import 'package:todo/core/theme/application_theme.dart';
import 'package:todo/pages/login/login_view.dart';
import 'package:todo/pages/register/register_view.dart';
import 'package:todo/pages/settings_view/settings_view.dart';
import 'package:todo/pages/splash_view/splash_view.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ApplicationTheme.LightTheme,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        HomeLayoutView.routeName: (context) => const HomeLayoutView(),
        LoginView.routeName: (context) => const LoginView(),
        RegisterView.routeName: (context) => const RegisterView(),
        SettingsView.routeName: (context) => const SettingsView(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ToDoList"),
        ),
      ),
    );
  }
}
