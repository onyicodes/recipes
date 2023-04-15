import 'package:get/get.dart';
import 'package:recipes/app/features/home/domain/entities/ingredients_entity.dart';
import 'package:recipes/app/features/home/domain/entities/recipe_entity.dart';
import 'package:recipes/app/features/home/domain/usecases/fetch_ingredients_usecase.dart';
import 'package:recipes/app/features/home/domain/usecases/fetch_recipes_usecase.dart';
import 'package:recipes/app/features/home/presentation/widgets/buttom_widget.dart';
import 'package:recipes/app/routes/app_pages.dart';
import 'package:recipes/core/constants/general_constants.dart';
import 'package:recipes/core/parameters/fetch_recipe_params.dart';
import 'package:recipes/core/parameters/no_params.dart';

class HomeController extends GetxController {
  final FetchIngredientsUsecase fetchIngredientsUsecase;

  HomeController(
      {required this.fetchIngredientsUsecase});
  final _date =
      DateTime.now().obs; // used as an observer to monitor state changes
  final _ingredientsRequestStatus = RequestStatus.initial.obs;

  final _ingredients = <IngredientEntity>[].obs;

  final _selectedIngredients = [].obs;

  DateTime get date => _date.value;
  List<IngredientEntity> get ingredients => _ingredients;

  List get selectedIngredients => _selectedIngredients;
  RequestStatus get ingredientsRequestStatus => _ingredientsRequestStatus.value;

  set date(value) => _date.value = value;
  set ingredients(value) => _ingredients.value = value;
  set selectedIngredients(value) => _selectedIngredients.value = value;
  set ingredientsRequestStatus(value) =>
      _ingredientsRequestStatus.value = value;


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

  getIngredients() async {
    ingredientsRequestStatus = RequestStatus.loading;
    final failOrFetchIngredients = await fetchIngredientsUsecase(NoParams());
    failOrFetchIngredients.fold((fail) {
      ingredientsRequestStatus = RequestStatus.error;
    }, (ingredientsList) {
      ingredients = ingredientsList;
      ingredientsRequestStatus = RequestStatus.success;
    });
  }



  goToRecipes() {
    Get.toNamed(Routes.recipes, arguments: selectedIngredients);
  }
}
