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
import 'package:recipes/core/constants/general_constants.dart';
import 'package:recipes/core/error/failures.dart';
import 'package:recipes/core/parameters/no_params.dart';
import 'home_controller_test.mocks.dart';



@GenerateMocks([FetchIngredientsUsecase])
void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); //Ensures that async functions runs completely

  late HomeController sut; //system under test
  late MockFetchRecipesUsecase mockFetchRecipes;
  late MockFetchIngredientsUsecase mockFetchIngredients;

  setUp(() {
    mockFetchRecipes = MockFetchRecipesUsecase();
    mockFetchIngredients = MockFetchIngredientsUsecase();
    sut = HomeController(
        fetchIngredientsUsecase: mockFetchIngredients);
  });

  test('initial values are correct', () {
    // assert
    expect(sut.ingredients, <IngredientEntity>[]);
    expect(sut.ingredientsRequestStatus, RequestStatus.initial);
  });
  

  group('Fetch Ingredients', () {
    final List<IngredientEntity> tIngredientsEntityList = [
   const   IngredientModel(
          title: "Ham",
          useby: "2019-11-08")
    ];


    test(
      'should get Ingredients for the get Ingredients usecase',
      () async {
        // arrange
        when(mockFetchIngredients(NoParams()))
            .thenAnswer((_) async => Right(tIngredientsEntityList));
        // act
        await sut.getIngredients();

        await untilCalled(mockFetchIngredients(NoParams()));
        // assert
        verify(mockFetchIngredients(NoParams()));
      },
    );

    test(
      'should emit request [loading and success] state when fetching ingredients completes successfully',
      () async {
        // arrange
        when(mockFetchIngredients(NoParams()))
            .thenAnswer((_) async => Right(tIngredientsEntityList));
        // act

        sut.getIngredients();
        // assert
        //Initial call is loading
        expect(sut.ingredientsRequestStatus, RequestStatus.loading);

        await untilCalled(mockFetchIngredients(NoParams()));

        expect(sut.ingredientsRequestStatus, RequestStatus.success);
      },
    );

    test(
      'should emit request [loading and Error] state when error occurs while fetching ingredients',
      () async {
        // arrange
        when(mockFetchIngredients(NoParams()))
            .thenAnswer((_) async => Left(ServerFailure()));
        // act

        sut.getIngredients();
        // assert
        //Initial call is loading
        expect(sut.ingredientsRequestStatus, RequestStatus.loading);

        await untilCalled(mockFetchIngredients(NoParams()));

        expect(sut.ingredientsRequestStatus, RequestStatus.error);
      },
    );
  });
}
