
import 'package:get/get.dart';
import 'package:recipes/app/features/splash/presentation/controllers/splash_screen_controller.dart';


final getSplashscreenControllerSl = GetInstance();

class SplashBinding implements Bindings {
  @override
  void dependencies() async {
    getSplashscreenControllerSl.lazyPut<SplashScreenController>(
        () => SplashScreenController(),);

  }
}
