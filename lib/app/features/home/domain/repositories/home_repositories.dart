import 'package:dartz/dartz.dart';
import 'package:recipes/app/features/home/domain/entities/ingredients_entity.dart';
import 'package:recipes/app/features/home/domain/entities/recipe_entity.dart';
import 'package:recipes/core/error/failures.dart';
import 'package:recipes/core/parameters/fetch_recipe_params.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<RecipeEntity>>> fetchRecipes(
      {required FetchRecipeParams params});
  Future<Either<Failure, List<IngredientEntity>>> fetchIngredients();
}
