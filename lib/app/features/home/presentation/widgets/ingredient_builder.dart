import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes/app/features/home/presentation/controllers/home_controller.dart';
import 'package:recipes/app/features/home/presentation/widgets/ingredient_card.dart';

class IngredientBuilder extends StatelessWidget {
  const IngredientBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetX<HomeController>(
                builder: (_) {
                  return ListView.builder(itemBuilder: (context, index) {
                    return IngredientCard(
                        selected: _.selectedIngredient
                            .contains(_.ingredients[index]),
                        ingredientTitle: _.ingredients[index]);
                  });
                },
              );
  }
}