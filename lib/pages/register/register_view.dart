import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../core/widgets/custom_text_form_field.dart';
class RegisterView extends StatefulWidget {
  static String routeName="register";
   RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();

}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController fullNameConroller = TextEditingController();
  TextEditingController emailConroller = TextEditingController();
  TextEditingController passwordConroller  = TextEditingController();
  TextEditingController confirmPasswordConroller = TextEditingController();
  var formKey=GlobalKey<FormState>();
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.onSecondary,
        image: DecorationImage(
          image: AssetImage(
            "assets/images/login_pattern.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 120,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          title: Text(
            "create account",
            style: theme.textTheme.titleLarge,
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
                    height: MediaQuery.of(context).size.height * 0.14,
                  ),
                  SizedBox(height: 40,),
                  CustomTextFormField(
                    title: "full name",
                    labelText: "full name",
                    controller: fullNameConroller,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty)
                      {
                        return "you must enter your full name ";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  CustomTextFormField(
                    title: "E-mail",
                    labelText: "E-mail",
                    controller: emailConroller,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty)
                        return "you must eneter your email address";
                      var regex = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (!regex.hasMatch(value)) {
                        return "Invalid email address";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  CustomTextFormField(
                    title: "password",
                    labelText: "password",
                    controller: passwordConroller,
                    obscureText: !isVisible,
                    suffixIcon: GestureDetector(
                        onTap: () {
                          isVisible=!isVisible;
                          setState(() {});
                        },
                        child: isVisible == true
                            ? Icon(Icons.visibility_off_outlined, size: 25)
                            : Icon(Icons.visibility_outlined, size: 25)),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "you must enter your password";
                      }
                      var regex=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if(regex.hasMatch(value)) {
                        return "Invalid password";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  CustomTextFormField(
                    title: "confirm password",
                    labelText: "confirm password",
                    controller: confirmPasswordConroller,
                    obscureText: !isVisible,
                    suffixIcon: GestureDetector(
                        onTap: () {
                          isVisible=!isVisible;
                          setState(() {});
                        },
                        child: isVisible == true
                            ? Icon(Icons.visibility_off_outlined, size: 25)
                            : Icon(Icons.visibility_outlined, size: 25)),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "you must enter your confirm password";
                      }
                      if(value!=passwordConroller.text){
                        return "password does not match ";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40),
                  MaterialButton(onPressed:(){
                    register();
                  },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      height: 55,
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("login",
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color:  Colors.white,
                            ),
                          ),
                          Icon(Icons.arrow_forward,
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  register() async {
    if (formKey.currentState!.validate()){
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailConroller.text,
          password: passwordConroller.text,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }
}