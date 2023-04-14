import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:recipes/generated/locale_keys.g.dart';

class RecipesCard extends StatelessWidget {
  final String recipe;
  final List ingredients;
  const RecipesCard({super.key, required this.recipe, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:8.0),
      child: Card(
        child: ExpansionTile(
          initiallyExpanded: true,
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          title: Text(
                    recipe,
                    style: primaryTextTheme.headlineLarge,
                  ),
              children: [
                Text(LocaleKeys.recipe_ingredient.tr(), style: primaryTextTheme.headlineLarge,),
                Wrap(children: ingredients.map((ingredient) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Chip(label: Text(ingredient)),
                )).toList(),)
              ],
          
        ),
      ),
    );
  }
}
