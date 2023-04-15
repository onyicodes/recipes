import 'package:get/get.dart';
import 'package:recipes/app/features/home/domain/entities/recipe_entity.dart';
import 'package:recipes/app/features/home/domain/usecases/fetch_recipes_usecase.dart';
import 'package:recipes/core/constants/general_constants.dart';
import 'package:recipes/core/parameters/fetch_recipe_params.dart';

class RecipeController extends GetxController {
  final FetchRecipesUsecase fetchRecipesUsecase;

  RecipeController({required this.fetchRecipesUsecase});

  final _recipesRequestStatus = RequestStatus.initial.obs;

  final _recipes = <RecipeEntity>[].obs;

  List<RecipeEntity> get recipes => _recipes;
  RequestStatus get recipesRequestStatus => _recipesRequestStatus.value;

  set recipes(value) => _recipes.value = value;

  set recipesRequestStatus(value) => _recipesRequestStatus.value = value;

  List selectedIngredients = [];

  @override
  void onInit() {
    selectedIngredients.addAll(Get.arguments);
    getRecipes();
    super.onInit();
  }

  getRecipes() async {
    recipesRequestStatus = RequestStatus.loading;
    final fetchRecipesParams =
        FetchRecipeParams(ingredients: selectedIngredients);
    final failOrFetchRecipes = await fetchRecipesUsecase(fetchRecipesParams);
    failOrFetchRecipes.fold((fail) {
      recipesRequestStatus = RequestStatus.error;
    }, (recipesList) {
      recipes = recipesList;
      recipesRequestStatus = RequestStatus.success;
    });
  }
}
