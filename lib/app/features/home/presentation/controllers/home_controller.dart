import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' hide Trans;
import 'package:recipes/app/features/home/domain/entities/ingredients_entity.dart';
import 'package:recipes/app/features/home/domain/entities/recipe_entity.dart';
import 'package:recipes/app/features/home/domain/usecases/fetch_ingredients_usecase.dart';
import 'package:recipes/app/features/home/domain/usecases/fetch_recipes_usecase.dart';
import 'package:recipes/app/features/home/presentation/widgets/buttom_widget.dart';
import 'package:recipes/app/routes/app_pages.dart';
import 'package:recipes/core/constants/failure_to_error_message.dart';
import 'package:recipes/core/constants/general_constants.dart';
import 'package:recipes/core/parameters/fetch_recipe_params.dart';
import 'package:recipes/core/parameters/no_params.dart';
import 'package:recipes/core/util/custom_smart_loading.dart';
import 'package:recipes/generated/locale_keys.g.dart';

class HomeController extends GetxController {
  final FetchIngredientsUsecase fetchIngredientsUsecase;

  HomeController({required this.fetchIngredientsUsecase});

  DateFormat dateFormatter = DateFormat('dd-MM-yyyy');

  final _date = DateFormat('dd-MM-yyyy')
      .format(DateTime.now())
      .obs; // used as an observer to monitor state changes
  final _ingredientsRequestStatus = RequestStatus.initial.obs;

  final _ingredients = <IngredientEntity>[].obs;
  final _errorMessage = "".obs;
  final _selectedIngredients = [].obs;

  String get date => _date.value;
  List<IngredientEntity> get ingredients => _ingredients;

  List get selectedIngredients => _selectedIngredients;
  RequestStatus get ingredientsRequestStatus => _ingredientsRequestStatus.value;
  String get errorMessage => _errorMessage.value;

  set errorMessage(value) => _errorMessage.value = value;
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

  datePicker() async {
    await Get.bottomSheet(CustomBottomSheetWidget(
        onSelectToday: (value) {
          date = dateFormatter.format(value);
        },
        onCanel: () {
          Get.back();
        },
        onDone: () {
          Get.back();
        },
        onTimeChanged: (value) {
          date = dateFormatter.format(value);
        },
        selectedDate: dateFormatter.parse(date)));
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

      //Get.snackbar("Error", mapFailureToErrorMessage(fail));
    }, (ingredientsList) {
      ingredients = ingredientsList;
      ingredientsRequestStatus = RequestStatus.success;
    });
  }

  goToRecipes() {
    if (selectedIngredients.isEmpty) {
      Get.snackbar("", LocaleKeys.home_selectIngredient.tr());
    } else {
      Get.toNamed(Routes.recipes, arguments: selectedIngredients);
    }
  }
}
