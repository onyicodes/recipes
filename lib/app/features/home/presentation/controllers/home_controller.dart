import 'package:get/get.dart';

class HomeController extends GetxController {
  final _date = DateTime.now().obs; // used as an observer to monitor state changes 

  DateTime get date => _date.value;

  set date(value) => _date.value = value;

  @override
  void onInit() {
    super.onInit();
  }

  datePicker() {
   // Get.bottomSheet();
  }
}
