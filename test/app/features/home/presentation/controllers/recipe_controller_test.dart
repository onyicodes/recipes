import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipes/app/features/home/data/model/ingredient_model.dart';
import 'package:recipes/app/features/home/data/model/recipes_model.dart';
import 'package:recipes/app/features/home/domain/entities/ingredients_entity.dart';
import 'package:recipes/app/features/home/domain/entities/recipe_entity.dart';
import 'package:recipes/app/features/home/domain/usecases/fetch_ingredients_usecase.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:recipes/app/features/home/domain/usecases/fetch_recipes_usecase.dart';
import 'package:recipes/app/features/home/presentation/controllers/home_controller.dart';
import 'package:recipes/app/features/home/presentation/controllers/recipe_controller.dart';
import 'package:recipes/core/constants/general_constants.dart';
import 'package:recipes/core/error/failures.dart';
import 'package:recipes/core/parameters/no_params.dart';
import 'home_controller_test.mocks.dart';



@GenerateMocks([FetchRecipesUsecase])
void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); //Ensures that async functions runs completely
      
  late RecipeController sut; //system under test
  late MockFetchRecipesUsecase mockFetchRecipes;

  setUp(() {
    mockFetchRecipes = MockFetchRecipesUsecase();
    sut = RecipeController(
        fetchRecipesUsecase: mockFetchRecipes,);
  });

  test('initial values are correct', () {
    // assert
    expect(sut.recipes, <RecipeEntity>[]);
    expect(sut.recipesRequestStatus, RequestStatus.initial);
  });

  group('Fetch Recipes', () {
    final List<RecipeEntity> tRecipesModelList = [
      const RecipeModel(
          title: "Ham and Cheese Toastie",
          ingredients: ["Ham", "Cheese", "Bread", "Butter"])
    ];


    final List<RecipeEntity> tReciepeEntityList = tRecipesModelList;

    test(
      'should get Recipes for the usecase',
      () async {
        // arrange
        when(mockFetchRecipes(any))
            .thenAnswer((_) async => Right(tReciepeEntityList));
        // act
        await sut.getRecipes();

        await untilCalled(mockFetchRecipes(any));
        // assert
        verify(mockFetchRecipes(any));
      },
    );

    test(
      'should emit request [loading and success] state when fetching recipes is successful',
      () async {
        // arrange
        when(mockFetchRecipes(any))
            .thenAnswer((_) async => Right(tReciepeEntityList));
        // act

        sut.getRecipes();
        // assert
        //Initial call is loading
        expect(sut.recipesRequestStatus, RequestStatus.loading);

        await untilCalled(mockFetchRecipes(any));

        expect(sut.recipesRequestStatus, RequestStatus.success);
      },
    );

    test(
      'should emit request [loading and Error] state when error occurs while fetching recipes',
      () async {
        // arrange
        when(mockFetchRecipes(any))
            .thenAnswer((_) async => Left(ServerFailure()));
        // act

        sut.getRecipes();
        // assert
        //Initial call is loading
        expect(sut.recipesRequestStatus, RequestStatus.loading);

        await untilCalled(mockFetchRecipes(any));

        expect(sut.recipesRequestStatus, RequestStatus.error);
      },
    );
  });
}
