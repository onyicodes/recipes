

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipes/app/features/home/data/model/recipes_model.dart';
import 'package:recipes/app/features/home/domain/entities/recipe_entity.dart';

import '../../../../fixtures/recipes_fixture_reader.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized(); //Ensures that async functions runs completely
   const  tRecipeEntity  = RecipeModel(
        title: "Ham and Cheese Toastie",
        ingredients: ["Ham", "Cheese", "Bread", "Butter"]);
  

      test('RecipeModel should be a subclass of RecipeEntity', (){
          expect(tRecipeEntity, isA<RecipeEntity>());
      });

      test('should return a valid Model ', () async{
          // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(await fixtureReader('recipe.json'));
            
        // act
        final result = RecipeModel.fromMap(jsonMap);
        
        // assert
        expect(result, tRecipeEntity);
      },
    );

   final expectedJsonMap = {
    "title": "Ham and Cheese Toastie",
    "ingredients": [
      "Ham",
      "Cheese",
      "Bread",
      "Butter"
    ]
  };


    test('should return a proper json Map containing the required data', (){
        
        
        final result = tRecipeEntity.toMap();
         
        
        // assert
        expect(result, expectedJsonMap);
      },
    );
}