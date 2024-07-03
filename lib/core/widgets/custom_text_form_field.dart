import 'package:flutter/material.dart';
class CustomTextFormField extends StatelessWidget {
   TextEditingController? controller;
  final FormFieldValidator<String>? validator;
   String? title;
   String? labelText;
  final int maxlines;
  Widget?suffixIcon;
  bool obscureText;
  CustomTextFormField(
      {
        super.key,
        required this.title,
        required this.controller,
        this.labelText,
         this.validator,
         this.maxlines=1,
        this.suffixIcon,
        this.obscureText=false,
      }
      );
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText, //visability
      maxLines: maxlines,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        suffixIconColor: theme.primaryColor,
        hintText: title,
        labelText: labelText,
        labelStyle: theme.textTheme.bodyLarge!.copyWith(color: Colors.black),
      ),
    );
  }
}
