import 'package:flutter/material.dart';
import 'package:recipes/app/features/home/presentation/widgets/recipes_card.dart';

class RecipesBuilder extends StatelessWidget {
  final List recipes;
  const RecipesBuilder({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return RecipesCard(
      recipe: recipes[index]);
        });
  }
}
