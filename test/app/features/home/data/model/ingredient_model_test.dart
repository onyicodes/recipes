import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipes/app/features/home/data/model/ingredient_model.dart';
import 'package:recipes/app/features/home/domain/entities/ingredients_entity.dart';

import '../../../../fixtures/recipes_fixture_reader.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); //Ensures that async functions runs completely in the main function
 const  tIngredientEntity =
      IngredientModel(title: "Ham", useby:"2019-11-08");

  test('IngredientModel should be a subclass of IngredientEntity', () {
    expect(tIngredientEntity, isA<IngredientEntity>());
  });

  test(
    'should return a valid Model ',
    () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(await fixtureReader('ingredient.json'));

      // act
      final result = IngredientModel.fromMap(jsonMap);

      // assert
      expect(result, tIngredientEntity);
    },
  );

  final expectedJsonMap = {
    "title": "Ham",
    "use-by": "2019-11-08"
  };

  test(
    'should return a proper json Map containing the required data',
    () {
      final result = tIngredientEntity.toMap();

      // assert
      expect(result, expectedJsonMap);
    },
  );
}
