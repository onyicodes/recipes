import 'package:flutter/material.dart';
import 'package:recipes/app/features/app/presentation/pages/app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:recipes/generated/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: const Locale('en', 'US'),
      assetLoader: const CodegenLoader(),
      child: const App()));
}
