import 'package:flutter/material.dart';
import 'package:recipes/core/general_widgets/custom_theme_button.dart';

class ThemeDialogBuilder extends StatelessWidget {
  const ThemeDialogBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "Change Theme",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            addRadioButton(
                title: "System",
                val: ThemeMode.system,
                context: context,
                icon: Icons.system_security_update_good),
            addRadioButton(
              title: "Light",
              val: ThemeMode.light,
              icon: Icons.light_mode_outlined,
              context: context,
            ),
            addRadioButton(
              title: "Dark",
              val: ThemeMode.dark,
              icon: Icons.dark_mode,
              context: context,
            ),
          ],
        ),
      );
  }
}