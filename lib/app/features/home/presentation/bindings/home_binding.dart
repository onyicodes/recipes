import 'package:get/get.dart';
import 'package:recipes/app/features/home/presentation/controllers/home_controller.dart';

final homeControllerSl = GetInstance();

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    homeControllerSl.lazyPut<HomeController>(() => HomeController());
  }
}
