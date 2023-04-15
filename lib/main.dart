import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:recipes/app/features/app/presentation/pages/app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:recipes/core/network/network_info.dart';
import 'package:recipes/generated/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await GetStorage.init();
  Get.lazyPut<NetworkInfo>(()=> NetworkInfoImpl(InternetConnectionCheckerPlus()));
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en')],
      path:
          'assets/translations/', // <-- change the path of the translation files
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: const App()));
}
