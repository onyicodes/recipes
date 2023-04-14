import 'package:get/get.dart';
import 'package:recipes/app/features/home/presentation/widgets/buttom_widget.dart';
import 'package:recipes/app/routes/app_pages.dart';
import 'package:recipes/core/constants/general_constants.dart';

class HomeController extends GetxController {
  
  HomeController();
  final _date =
      DateTime.now().obs; // used as an observer to monitor state changes
  final _ingredientsRequestStatus = RequestStatus.initial.obs;
  final _recipesRequestStatus = RequestStatus.initial.obs;
  final _ingredients = ["Onions", "Tomatoes", "Crayfish", "Maggi"].obs;
  final _recipes = ["Rice", "Beans", "Moimoi"].obs;
  final _selectedIngredients = [].obs;

  DateTime get date => _date.value;
  List get ingredients => _ingredients;
  List get recipes => _recipes;
  List get selectedIngredients => _selectedIngredients;
  RequestStatus get ingredientsRequestStatus => _ingredientsRequestStatus.value;
  RequestStatus get recipesRequestStatus => _recipesRequestStatus.value;

  set date(value) => _date.value = value;
  set ingredients(value) => _ingredients.value = value;
  set recipes(value) => _recipes.value = value;
  set selectedIngredients(value) => _selectedIngredients.value = value;
  set ingredientsRequestStatus(value) =>
      _ingredientsRequestStatus.value = value;

  set recipesRequestStatus(value) => _recipesRequestStatus.value = value;

  @override
  void onReady() {
    datePicker();
    super.onReady();
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

  removeIngredient(String value) {
    selectedIngredients.remove(value);
  }

  addSelectedIngredient(String ingredientTitle) {
    if (selectedIngredients.contains(ingredientTitle)) {
      selectedIngredients.remove(ingredientTitle);
    } else {
      selectedIngredients.add(ingredientTitle);
    }
  }

  getIngredients() {}

  getRecipes() {
    Get.toNamed(Routes.recipes);
  }
}
