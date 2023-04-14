import 'package:get/get.dart';
import 'package:recipes/app/features/home/presentation/widgets/buttom_widget.dart';

class HomeController extends GetxController {
  final _date =
      DateTime.now().obs; // used as an observer to monitor state changes
  final _ingredients = [].obs;
  final _recipes = [].obs;

  DateTime get date => _date.value;
  List get ingredients => _ingredients;
  List get recipes => _recipes;

  set date(value) => _date.value = value;
  set ingredients(value) => _ingredients.value = value;
  set recipes(value) => _recipes.value = value;

  List<String> selectedIngredient = [];

  @override
  void onInit() {
    super.onInit();
    datePicker();
  }

  datePicker() {
    Get.bottomSheet(CustomBottomSheetWidget(
        onSelectToday: (value) {
          date = value;
        },
        onTimeChanged: (value) {
          date = value;
        },
        selectedDate: date));
    getIngredients();
  }

  getIngredients() {}

  getRecipes() {}
}
