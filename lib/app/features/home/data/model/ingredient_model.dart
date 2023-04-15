// ignore_for_file: annotate_overrides, overridden_fields

import 'package:recipes/app/features/home/domain/entities/ingredients_entity.dart';

class IngredientModel extends IngredientEntity {
  final String title;
  final String useby;

  const IngredientModel({required this.title, required this.useby})
      : super(title: title, useby: useby);

  factory IngredientModel.fromMap(Map<String, dynamic> json) =>
      IngredientModel(title: json["title"], useby: json["use-by"]);

  Map<String, dynamic> toMap() => {"use-by": useby, "title": title};
}
