import 'package:dartz/dartz.dart';
import 'package:recipes/app/features/home/domain/entities/recipe_entity.dart';
import 'package:recipes/app/features/home/domain/repositories/home_repositories.dart';
import 'package:recipes/core/error/failures.dart';
import 'package:recipes/core/parameters/fetch_recipe_params.dart';
import 'package:recipes/core/usecase/usecase_builder.dart';


class FetchRecipesUsecase extends UseCase<List<RecipeEntity>, FetchRecipeParams> {
  final HomeRepository repository;

  FetchRecipesUsecase({required this.repository});

  @override
  Future<Either<Failure, List<RecipeEntity>>> call(FetchRecipeParams params) async {
    return await repository.fetchRecipes(params: params);
  }
}
