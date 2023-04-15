import 'package:get/get.dart';
import 'package:recipes/app/features/home/data/datasources/home_data_provider.dart';
import 'package:recipes/app/features/home/data/repository/home_repository_impl.dart';
import 'package:recipes/app/features/home/domain/repositories/home_repositories.dart';
import 'package:recipes/app/features/home/domain/usecases/fetch_ingredients_usecase.dart';
import 'package:recipes/app/features/home/domain/usecases/fetch_recipes_usecase.dart';
import 'package:recipes/app/features/home/presentation/controllers/home_controller.dart';
import 'package:recipes/app/features/home/presentation/controllers/recipe_controller.dart';

final homeControllerSl = GetInstance();

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    homeControllerSl.lazyPut<HomeController>(() => HomeController(fetchIngredientsUsecase: homeControllerSl()));

    homeControllerSl.lazyPut<RecipeController>(() => RecipeController(fetchRecipesUsecase: homeControllerSl()));
     
    homeControllerSl.lazyPut<FetchIngredientsUsecase>(
        () => FetchIngredientsUsecase(repository: homeControllerSl()));
    homeControllerSl.lazyPut<FetchRecipesUsecase>(
        () => FetchRecipesUsecase(repository: homeControllerSl()));

    homeControllerSl.lazyPut<HomeRepository>(
        () =>HomeRepositoryImpl(dataProvider: homeControllerSl()));

    homeControllerSl.lazyPut<HomeDataProvider>(() => HomeDataProviderImpl(networkInfo:homeControllerSl()));
  }
}
