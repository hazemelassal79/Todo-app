import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/home_layout/home_layout_view.dart';
import 'package:todo/core/widgets/custom_text_form_field.dart';
import 'package:todo/pages/register/register_view.dart';

class LoginView extends StatefulWidget {
  static String routeName = "login";

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailConroller = TextEditingController();
  TextEditingController passwordConroller = TextEditingController();
  bool isVisible = false;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.onSecondary,
        image: const DecorationImage(
          image: AssetImage(
            "assets/images/OBSKHP0.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 120,
          backgroundColor: Colors.transparent,
          title: Text(
            "Login",
            style: theme.textTheme.titleLarge!.copyWith(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "welcome back!",
                    textAlign: TextAlign.start,
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextFormField(
                    title: "email",
                    labelText: "E-mail",
                    controller: emailConroller,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "you must enter your email address";
                      }
                      var regex = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (!regex.hasMatch(value)) {
                        return "Invalid email address";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    title: "password",
                    labelText: "password",
                    controller: passwordConroller,
                    obscureText: !isVisible,
                    suffixIcon: GestureDetector(
                        onTap: () {
                          isVisible = !isVisible;
                          setState(() {});
                        },
                        child: isVisible == true
                            ? const Icon(Icons.visibility_off_outlined, size: 25)
                            : const Icon(Icons.visibility_outlined, size: 25)),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "you must enter your password";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "forget password?",
                        textAlign: TextAlign.start,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      login(onSuccess: () {
                        Navigator.pushReplacementNamed(
                            context, HomeLayoutView.routeName);
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      height: 55,
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "login",
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterView.routeName);
                      },
                      child: Text(
                        "or create new account!",
                        textAlign: TextAlign.start,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  login({required Function onSuccess}) async {
    if (formKey.currentState!.validate()) {
      try {
        var user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailConroller.text,
          password: passwordConroller.text,
        );
        onSuccess.call();
      } on FirebaseAuthException catch (e) {
        showSnackBar(e.message.toString());
        // if (e.code == 'user-not-found') {
        //   ScaffoldMessenger.of(context)
        //       .showSnackBar(SnackBar(content: Text(e.message.toString())));
        // } else if (e.code == 'wrong-password') {
        //   print('Wrong password provided for that user.');
        // }
      }
    }
  }

  void showSnackBar(String message){
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
