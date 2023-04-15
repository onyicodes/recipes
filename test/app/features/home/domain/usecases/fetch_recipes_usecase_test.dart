import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:recipes/app/features/home/data/model/recipes_model.dart';
import 'package:recipes/app/features/home/domain/entities/recipe_entity.dart';
import 'package:recipes/app/features/home/domain/repositories/home_repositories.dart';
import 'package:recipes/app/features/home/domain/usecases/fetch_recipes_usecase.dart';
import 'package:recipes/core/parameters/fetch_recipe_params.dart';

import 'fetch_recipes_usecase_test.mocks.dart';

class FakeFetchRecipeParams extends Fake implements FetchRecipeParams {}

@GenerateMocks([HomeRepository])
void main() {
  late FetchRecipesUsecase sut; //system under test
  late MockHomeRepository mockHomeRepository;
  late FakeFetchRecipeParams fakeFetchRecipeParams;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    sut = FetchRecipesUsecase(repository: mockHomeRepository);
    fakeFetchRecipeParams = FakeFetchRecipeParams();
  });
  final List<RecipeEntity> tRecipeEntityList = [
    const RecipeModel(
        title: "Ham and Cheese Toastie",
        ingredients: ["Ham", "Cheese", "Bread", "Butter"])
  ];



  test('Should get recipe lists from repository', () async {
    // arrange
    when(mockHomeRepository.fetchRecipes(params: fakeFetchRecipeParams))
        .thenAnswer((_) async => Right(tRecipeEntityList));
    // act
    final result = await sut(fakeFetchRecipeParams);
    // assert

    expect(result, Right(tRecipeEntityList));

    verify(mockHomeRepository.fetchRecipes(params: fakeFetchRecipeParams));
    verifyNoMoreInteractions(mockHomeRepository);
  });
}
