import 'package:flutter/material.dart';
import 'package:todo/core/widgets/custom_text_form_field.dart';

class BottomSheetWidget extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "add new task",
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge!.copyWith(color: Colors.black),
            ),
            CustomTextFormField(
                controller: titleController,
                title: "enter your task title",
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return "you must write task title";
                  } else if (value.length < 10) {
                    return "you task title must be at least 10 characters";
                  } else {
                    return null;
                  }
                },
      ),
      CustomTextFormField(
        controller: descriptionController,
        title: "enter your task description",
        validator: (String? value) {
          if (value == null || value.trim().isEmpty) {
            return "you must write task title";
          } else if (value.length < 10) {
            return "you task title must be at least 10 characters";
          } else {
            return null;
          }
        },
      ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "add new task",
                  style:
                      theme.textTheme.bodyLarge!.copyWith(color: Colors.black),
                ),
                // GestureDetector{
                // onTap(){
                //   showCalendar(context);},
                //   child: Text(
                //     "5 oct 2023",
                //     textAlign: TextAlign.center,
                //     style: theme.textTheme.bodyMedium!.copyWith(color: theme.primaryColor),
                //   ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    print(titleController.text);
                  }
                },
                child: Text(
                  "add new task",
                  style:theme.textTheme.bodyLarge!.copyWith(color: Colors.white)
                ),
            )
          ],
         ),
        ),
      );
  }
  void showCalendar(BuildContext context) {
    showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)),
    );
  }
}
