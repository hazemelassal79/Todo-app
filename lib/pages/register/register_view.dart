import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/home_layout/home_layout_view.dart';
import '../../core/widgets/custom_text_form_field.dart';

class RegisterView extends StatefulWidget {
  static String routeName = "register";

  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isVisible = true;

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
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.transparent,
          title: Text(
            "create account",
            style: theme.textTheme.titleLarge!.copyWith(
                color: Colors.black
            ),
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
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.14,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                    title: "full name",
                    labelText: "full name",
                    controller: fullNameController,
                    validator: (value) {
                      if (value == null || value
                          .trim()
                          .isEmpty) {
                        return "you must enter your full name ";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    title: "E-mail",
                    labelText: "E-mail",
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value
                          .trim()
                          .isEmpty)
                        return "you must enter your email address";
                      var regex = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (!regex.hasMatch(value)) {
                        return "Invalid email address";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    title: "password",
                    labelText: "password",
                    controller: passwordController,
                    obscureText: !isVisible,
                    suffixIcon: GestureDetector(
                        onTap: () {
                          isVisible = !isVisible;
                          setState(() {});
                        },
                        child: isVisible == false
                            ? const Icon(Icons.visibility_off_outlined,
                            size: 25)
                            : const Icon(Icons.visibility_outlined, size: 25)),
                    validator: (value) {
                      if (value == null || value
                          .trim()
                          .isEmpty) {
                        return "you must enter your password";
                      }
                      var regex = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (regex.hasMatch(value)) {
                        return "Invalid password";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    title: "confirm password",
                    labelText: "confirm password",
                    controller: confirmPasswordController,
                    obscureText: !isVisible,
                    suffixIcon: GestureDetector(
                        onTap: () {
                          isVisible = !isVisible;
                          setState(() {});
                        },
                        child: isVisible == false
                            ? const Icon(Icons.visibility_off_outlined,
                            size: 25)
                            : const Icon(Icons.visibility_outlined, size: 25)),
                    validator: (value) {
                      if (value == null || value
                          .trim()
                          .isEmpty) {
                        return "you must enter your confirm password";
                      }
                      if (value != passwordController.text) {
                        return "password does not match ";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40),
                  MaterialButton(
                    onPressed: () {
                      register(onSuccess: () {
                        Navigator.pushNamedAndRemoveUntil(context, HomeLayoutView.routeName , (route) => false,);
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
                            "register",
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  register({required Function onSuccess}) async {
    if (formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        onSuccess.call();
      } on FirebaseAuthException catch (e) {
        showSnackBar(e.message.toString());
      } catch (e) {
        showSnackBar(e.toString());
      }
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}

