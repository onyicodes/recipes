import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:recipes/app/features/home/data/model/ingredient_model.dart';
import 'package:recipes/app/features/home/domain/entities/ingredients_entity.dart';
import 'package:recipes/app/features/home/domain/repositories/home_repositories.dart';
import 'package:recipes/app/features/home/domain/usecases/fetch_ingredients_usecase.dart';
import 'package:recipes/core/parameters/no_params.dart';

import 'fetch_recipes_usecase_test.mocks.dart';


@GenerateMocks([HomeRepository])
void main() {
  late FetchIngredientsUsecase sut;//system under test
  late MockHomeRepository mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    sut = FetchIngredientsUsecase(repository: mockHomeRepository);
  });
  final List<IngredientEntity> tIngredientEntityList =  [
     const IngredientModel(
          title: "Ham",
          useby: "2019-11-08")
    ];


  test('Should get ingredients lists from repository', () async {
    // arrange
    when(mockHomeRepository.fetchIngredients())
        .thenAnswer((_) async => Right(tIngredientEntityList));
    // act
    final result = await sut(NoParams());
    // assert

    expect(result, Right(tIngredientEntityList));

    verify(mockHomeRepository.fetchIngredients());
    verifyNoMoreInteractions(mockHomeRepository);
  });
}
