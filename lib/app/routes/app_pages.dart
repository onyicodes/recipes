import 'package:get/get.dart';
import 'package:recipes/app/features/home/presentation/bindings/home_binding.dart';
import 'package:recipes/app/features/home/presentation/pages/home.dart';
import 'package:recipes/app/features/home/presentation/pages/recipes_page.dart';
import 'package:recipes/app/features/splash/presentation/bindings/splash_screen_binding.dart';
import 'package:recipes/app/features/splash/presentation/pages/splash_screen.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
     GetPage(
        name: Routes.initial,
        page: () =>const SplashScreenPage(),
        binding: SplashBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.home,
        page: () =>const Home(),
        binding: HomeBinding(),
        transition: Transition.leftToRight),
    GetPage(
        name: Routes.recipes,
        page: () =>const RecipesPage(),
        binding: HomeBinding(),
        transition: Transition.noTransition),
  ];
}
