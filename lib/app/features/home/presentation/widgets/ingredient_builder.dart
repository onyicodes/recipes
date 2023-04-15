import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes/app/features/home/presentation/controllers/home_controller.dart';
import 'package:recipes/app/features/home/presentation/widgets/ingredient_card.dart';
import 'package:recipes/core/constants/general_constants.dart';
import 'package:recipes/core/general_widgets/custom_list_space.dart';

class IngredientBuilder extends StatelessWidget {
  const IngredientBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (_) {
        return ListView.separated(
            shrinkWrap: true,
            itemCount: _.ingredients.length,
            separatorBuilder: ((context, index) => CustomListSpacing(
                spacingValue: ListSpacingValue.spacingV8.value)),
            itemBuilder: (context, index) {
              return GetX<HomeController>(builder: (_) {
                return IngredientCard(
                    onSelect: (value) {
                      _.addSelectedIngredient(value);
                    },
                    selected:
                        _.selectedIngredients.contains(_.ingredients[index].title),
                    ingredientTitle: _.ingredients[index].title);
              });
            });
      },
    );
  }
}
