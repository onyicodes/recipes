  import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes/app/features/app/presentation/controllers/get_theme_controller.dart';

GetBuilder addRadioButton(
      {required ThemeMode val,
      required String title,
      required IconData icon,
      required BuildContext context}) {
    return GetBuilder<ThemeController>(
      builder: (_) => RadioListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Icon(icon),
          ],
        ),
        value: val,
        activeColor: Theme.of(context).primaryColor,
        groupValue: _.themeMode,
        onChanged: (ThemeMode? value) {
          _.setThemeMode(value!);
        },
      ),
    );
  }
