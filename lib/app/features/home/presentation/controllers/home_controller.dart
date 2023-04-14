import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:recipes/app/features/home/presentation/widgets/buttom_widget.dart';

class HomeController extends GetxController {
  final _date =
      DateTime.now().obs; // used as an observer to monitor state changes

  DateTime get date => _date.value;

  set date(value) => _date.value = value;

  @override
  void onInit() {
    super.onInit();
    datePicker();
  }

  datePicker() {
    Get.bottomSheet(CustomBottomSheetWidget(
        onSelectToday: (value) {
          date = value;
        },
        onTimeChanged: (value) {
          date = value;
        },
        selectedDate: date));
  }

  
}
