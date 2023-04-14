import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:recipes/app/features/splash/presentation/bindings/splash_screen_binding.dart';
import 'package:recipes/app/routes/app_pages.dart';
import 'package:recipes/app/theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initial,
      initialBinding: SplashBinding(),
      theme: RecipesAppTheme.light(),
      darkTheme: RecipesAppTheme.dark(),
      supportedLocales: context.localizationDelegates as Iterable<Locale>,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      locale:context.locale,
    );
  }
}
