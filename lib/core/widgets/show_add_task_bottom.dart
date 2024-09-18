import 'package:flutter/material.dart';
import 'package:todo/core/home_layout/bottom_sheet_widget.dart';

void showAddTaskBottom(context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) => const BottomSheetWidget(),
  );
}
