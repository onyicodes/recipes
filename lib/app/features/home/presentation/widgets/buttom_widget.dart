import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:recipes/core/constants/general_constants.dart';
import 'package:recipes/core/general_widgets/button_widget.dart';
import 'package:recipes/core/general_widgets/custom_list_space.dart';
import 'package:recipes/generated/locale_keys.g.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class CustomBottomSheetWidget extends StatelessWidget {
  
  final void Function(DateTime value) onTimeChanged;
  final void Function(DateTime value) onSelectToday;
  final void Function() onCanel;
  final void Function() onDone;
  final DateTime selectedDate;
  const CustomBottomSheetWidget({
    Key? key,
    required this.onSelectToday,
    required this.onTimeChanged,
    required this.selectedDate,
    required this.onCanel,
    required this.onDone
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          color: Theme.of(context).cardColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
                width: 200,
                height: 40,
                label: LocaleKeys.button_today.tr(),
                onPressed: () {
                  DateTime now = DateTime.now();
                  onSelectToday(now);
                },
                backgroundColor: Colors.teal,
                borderColor: Colors.teal,
                primaryTextTheme: primaryTextTheme),
            CustomListSpacing(spacingValue: ListSpacingValue.spacingV8.value),
            SizedBox(
              height: 150,
              child: ScrollDatePicker(
                selectedDate: selectedDate,
                onDateTimeChanged: onTimeChanged,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                      width: 120,
                      height: 40,
                      textColor: Theme.of(context).secondaryHeaderColor,
                      label: LocaleKeys.button_cancel.tr(),
                      onPressed:onCanel,
                      backgroundColor: Theme.of(context).cardColor,
                      borderColor: Colors.teal,
                      primaryTextTheme: primaryTextTheme),
                  const SizedBox(
                    width: 12,
                  ),
                  CustomButton(
                      width: 100,
                      height: 40,
                      label: LocaleKeys.button_done.tr(),
                      onPressed:onDone,
                      backgroundColor: Theme.of(context).primaryColor,
                      borderColor: Theme.of(context).primaryColor,
                      primaryTextTheme: primaryTextTheme),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
