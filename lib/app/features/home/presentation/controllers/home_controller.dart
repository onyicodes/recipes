import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' hide Trans;
import 'package:recipes/app/features/home/domain/entities/ingredients_entity.dart';
import 'package:recipes/app/features/home/domain/usecases/fetch_ingredients_usecase.dart';
import 'package:recipes/app/features/home/presentation/widgets/buttom_widget.dart';
import 'package:recipes/app/routes/app_pages.dart';
import 'package:recipes/core/constants/failure_to_error_message.dart';
import 'package:recipes/core/constants/general_constants.dart';
import 'package:recipes/core/general_widgets/custom_snackbar.dart';
import 'package:recipes/core/parameters/no_params.dart';
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
          Get.back();
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

  addSelectedIngredient({required String ingredient, required bool isExpired}) {
    if (isExpired) {
      customSnackbar(title: "", message: LocaleKeys.snackBar_expiredDeals.tr());
    } else {
      if (selectedIngredients.contains(ingredient)) {
        selectedIngredients.remove(ingredient);
      } else {
        selectedIngredients.add(ingredient);
      }
    }
  }

  getIngredients() async {
    ingredientsRequestStatus = RequestStatus.loading;
    final failOrFetchIngredients = await fetchIngredientsUsecase(NoParams());
    failOrFetchIngredients.fold((fail) {
      ingredientsRequestStatus = RequestStatus.error;
      errorMessage = mapFailureToErrorMessage(fail);
      //Comment snackbar below out for unit test to run smoothly
      customSnackbar(title: "Error", message: mapFailureToErrorMessage(fail), isError: true);
    }, (ingredientsList) {
      ingredients = ingredientsList;
      ingredientsRequestStatus = RequestStatus.success;
    });
  }

  bool ingredientExpired({required String useby}) {
    return DateTime.parse(useby).isBefore(dateFormatter.parse(date));
  }

  goToRecipes() {
    if (selectedIngredients.isEmpty) {
      customSnackbar(
          title: "Error", message: LocaleKeys.snackBar_selectIngredient.tr(), isError: true);
    } else {
      Get.toNamed(Routes.recipes, arguments: selectedIngredients);
      selectedIngredients.clear();
    }
  }
}
