import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/network_layer/firestore_utils.dart';
import 'package:todo/core/widgets/custom_text_form_field.dart';
import 'package:todo/models/task_model.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({super.key});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )),
      child: Padding(
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
                style:
                    theme.textTheme.titleLarge!.copyWith(color: Colors.black),
              ),
              CustomTextFormField(
                maxlines: 1,
                controller: titleController,
                title: "enter your task title",
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Field is required";
                  } else {
                    return null;
                  }
                },
              ),
              CustomTextFormField(
                maxlines: 5,
                controller: descriptionController,
                title: "enter your task description",
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Field is required";
                  } else {
                    return null;
                  }
                },
              ),
              GestureDetector(
                onTap: () {
                  showCalendar();
                },
                child: Text(
                  DateFormat.yMd().format(selectedDate ?? DateTime.now()),
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.primaryColor,
                    fontSize: 18,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    if (selectedDate?.isBefore(DateTime.now()) ?? true) {
                      Fluttertoast.showToast(
                          msg: 'You cannot select a current or a previous time');
                      return;
                    }
                    var model = TaskModel(
                      title: titleController.text.trim(),
                      description: descriptionController.text.trim(),
                      dateTime: selectedDate ?? DateTime.now(),
                      isDone: false,
                    );
                    await FirestoreUtils.addDataToFireStore(model);
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  "add new task",
                  style:
                      theme.textTheme.bodyLarge!.copyWith(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showCalendar() async {
    var dateSelected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    ).whenComplete(
      () {},
    );
    if (dateSelected == null) {
      return;
    } else {
      final time = await selectTime();
      if (time == null) {
        return;
      }
      selectedDate =
          dateSelected.copyWith(hour: time.hour, minute: time.minute);
      setState(() {});
    }
  }

  Future<TimeOfDay?> selectTime() async {
    final time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    return time;
  }
}
