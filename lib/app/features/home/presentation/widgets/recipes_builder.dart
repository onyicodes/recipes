import 'package:flutter/material.dart';
import 'package:recipes/app/features/home/presentation/widgets/recipes_card.dart';
import 'package:recipes/core/constants/general_constants.dart';
import 'package:recipes/core/general_widgets/custom_list_space.dart';

class RecipesBuilder extends StatelessWidget {
  final List recipes;
  const RecipesBuilder({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: recipes.length,
        separatorBuilder: ((context, index) => CustomListSpacing(
              spacingValue: ListSpacingValue.spacingV16.value)
        ),
        itemBuilder: (context, index) {
          return RecipesCard(
      recipe: recipes[index]);
        });
  }
}
