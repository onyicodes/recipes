

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:recipes/app/features/home/data/datasources/home_data_provider.dart';
import 'package:recipes/app/features/home/data/model/ingredient_model.dart';
import 'package:recipes/app/features/home/data/model/recipes_model.dart';
import 'package:recipes/app/features/home/data/repository/home_repository_impl.dart';
import 'package:recipes/app/features/home/domain/entities/ingredients_entity.dart';
import 'package:recipes/app/features/home/domain/entities/recipe_entity.dart';
import 'package:recipes/core/error/exceptions.dart';
import 'package:recipes/core/error/failures.dart';
import 'package:recipes/core/parameters/fetch_recipe_params.dart';

import 'home_repository_impl_test.mocks.dart';

class FakeFetchRecipeParams extends Fake implements FetchRecipeParams {}


@GenerateMocks([HomeDataProvider])
void main(){
  late HomeRepositoryImpl sut;
  late MockHomeDataProvider mockHomeDataProvider;
  late FakeFetchRecipeParams fakeFetchRecipeParams;

  setUp((){
    mockHomeDataProvider = MockHomeDataProvider();
    sut = HomeRepositoryImpl(
      dataProvider: mockHomeDataProvider,
    );
    fakeFetchRecipeParams = FakeFetchRecipeParams();
  });

  group('fetch Recipes', (){
   

      final List<RecipeEntity> tRecipesEntityList = [
    const RecipeModel(
        title: "Ham and Cheese Toastie",
        ingredients: ["Ham", "Cheese", "Bread", "Butter"])
  ];


    test('should return remote data when call to remote data source is successfull', () async {
      when(mockHomeDataProvider.fetchRecipes(params:fakeFetchRecipeParams)).thenAnswer((_) async => tRecipesEntityList);

      final result =  await sut.fetchRecipes(params: fakeFetchRecipeParams);

      verify(mockHomeDataProvider.fetchRecipes(params: fakeFetchRecipeParams));
      expect(result, Right(tRecipesEntityList));
    });

    

    test('should return server failure when call to remote data source is unsuccessful', () async {
        when(mockHomeDataProvider.fetchRecipes(params: fakeFetchRecipeParams)).thenThrow(ServerException());

        final result = await sut.fetchRecipes(params: fakeFetchRecipeParams);

        verify( mockHomeDataProvider.fetchRecipes(params: fakeFetchRecipeParams));
  
        expect(result, Left(ServerFailure()));
    });

  });


   group('fetch Ingredients', (){
   

     
  

  final List<IngredientEntity> tIngredientEntityList =  [
     const IngredientModel(
          title: "Ham",
          useby: "2019-11-08")
    ];


    test('should return remote data when call to remote data source is successfull', () async {
      when(mockHomeDataProvider.fetchIngredients()).thenAnswer((_) async => tIngredientEntityList);

      final result =  await sut.fetchIngredients();

      verify(mockHomeDataProvider.fetchIngredients());
      expect(result, Right(tIngredientEntityList));
    });

    

    test('should return server failure when call to remote data source is unsuccessful', () async {
        when(mockHomeDataProvider.fetchIngredients()).thenThrow(ServerException());

        final result = await sut.fetchIngredients();

        verify(mockHomeDataProvider.fetchIngredients());
        expect(result, Left(ServerFailure()));
    });

  });
}