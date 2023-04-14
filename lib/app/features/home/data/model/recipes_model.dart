// ignore_for_file: annotate_overrides, overridden_fields

import 'package:recipes/app/features/home/domain/entities/recipe_entity.dart';

class RecipeModel extends RecipeEntity {
  final String title;
  final List<String> ingredients;

  const RecipeModel({required this.title, required this.ingredients})
      : super(title: title, ingredients: ingredients);

  factory RecipeModel.fromMap(Map<String, dynamic> json) =>
      RecipeModel(title: json["title"], ingredients: json["ingredients"]);

  Map<String, dynamic> toMap() => {"ingredients": ingredients, "title": title};
}
