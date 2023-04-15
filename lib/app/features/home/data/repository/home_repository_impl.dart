import 'package:dartz/dartz.dart';
import 'package:recipes/app/features/home/data/datasources/home_data_provider.dart';
import 'package:recipes/app/features/home/domain/entities/ingredients_entity.dart';
import 'package:recipes/app/features/home/domain/entities/recipe_entity.dart';
import 'package:recipes/app/features/home/domain/repositories/home_repositories.dart';
import 'package:recipes/core/error/exceptions.dart';
import 'package:recipes/core/error/failures.dart';
import 'package:recipes/core/parameters/fetch_recipe_params.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDataProvider dataProvider;

  HomeRepositoryImpl({required this.dataProvider});

  @override
  Future<Either<Failure, List<IngredientEntity>>> fetchIngredients() async {
    try {
      List<IngredientEntity> ingredients =
          await dataProvider.fetchIngredients();
      return Right(ingredients);
    } on ServerException {
      return Left(ServerFailure());
    } on NetworkException {
      return Left(NetworkFailure());
    } on ForbiddenException {
      return Left(ForbiddenFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  

  @override
  Future<Either<Failure, List<RecipeEntity>>> fetchRecipes(
      {required FetchRecipeParams params}) async {
    try {
      List<RecipeEntity> recipesEntityList =
          await dataProvider.fetchRecipes(params: params);
      return Right(recipesEntityList);
    } on ServerException {
      return Left(ServerFailure());
    } on NetworkException {
      return Left(NetworkFailure());
    } on ForbiddenException {
      return Left(ForbiddenFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}
