import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:recipes/core/constants/general_constants.dart';
import 'package:recipes/core/general_widgets/button_widget.dart';
import 'package:recipes/core/general_widgets/custom_list_space.dart';
import 'package:recipes/generated/locale_keys.g.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class CustomBottomSheetWidget extends StatelessWidget {
  final void Function()? onTap2;
  final void Function(DateTime value) onTimeChanged;
  final void Function(DateTime value) onSelectToday;
  final DateTime selectedDate;
  const CustomBottomSheetWidget({
    Key? key,
    required this.onSelectToday,
    required this.onTimeChanged,
    required this.selectedDate,
    this.onTap2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 350,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(label: LocaleKeys.home_bottomWidget_today.tr(), onPressed: (){
              DateTime now = DateTime.now();
              onSelectToday(now);
            }, backgroundColor: Colors.teal, borderColor: Colors.teal, primaryTextTheme: primaryTextTheme),
            CustomListSpacing(spacingValue: ListSpacingValue.spacingV24.value),
            SizedBox(
              height: 150,
              child: ScrollDatePicker(
                selectedDate: selectedDate,
                onDateTimeChanged: onTimeChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
