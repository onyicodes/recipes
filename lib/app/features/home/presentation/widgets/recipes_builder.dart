import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes/app/features/home/presentation/controllers/home_controller.dart';
import 'package:recipes/app/features/home/presentation/controllers/recipe_controller.dart';
import 'package:recipes/app/features/home/presentation/widgets/recipes_card.dart';
import 'package:recipes/core/constants/general_constants.dart';
import 'package:recipes/core/general_widgets/custom_list_space.dart';
import 'package:recipes/core/general_widgets/custom_loading_widget.dart';
import 'package:recipes/core/general_widgets/error_handler_widget.dart';

class RecipesBuilder extends StatelessWidget {

  const RecipesBuilder({super.key, });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return GetX<RecipeController>(builder: (_) {
            return _.recipesRequestStatus == RequestStatus.success? ListView.separated(
                itemCount: _.recipes.length,
                separatorBuilder: ((context, index) => CustomListSpacing(
                      spacingValue: ListSpacingValue.spacingV8.value)
                ),
                itemBuilder: (context, index) {
                  return RecipesCard(
                    ingredients:_.recipes[index].ingredients,
              recipe: _.recipes[index].title);
                }) : _.recipesRequestStatus ==  RequestStatus.loading?
               const CustomSimpleLoadingWidget(): _.recipesRequestStatus == RequestStatus.error?
                ErrorHandlerWidget(message: _.errorMessage, onReload: (){
                  _.getRecipes();
                },):const SizedBox.shrink();
          }
        );
      }
    );
  }
}
