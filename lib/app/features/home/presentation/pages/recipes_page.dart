import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:recipes/app/features/home/presentation/controllers/home_controller.dart';
import 'package:recipes/app/features/home/presentation/widgets/ingredient_card.dart';
import 'package:recipes/app/features/home/presentation/widgets/recipes_builder.dart';
import 'package:recipes/app/features/home/presentation/widgets/recipes_card.dart';
import 'package:recipes/core/general_widgets/custom_appbar.dart';
import 'package:recipes/generated/locale_keys.g.dart';

class Home extends GetView<HomeController> {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Scaffold(
        appBar: customAppBar(
            title: LocaleKeys.home_recipesAppBarTile.tr(),
            primaryTextTheme: primaryTextTheme,
            onAppBarTap: () {
              Get.back();
            }),
        body: GetBuilder<HomeController>(builder: (_) {
          return GetX<HomeController>(
            builder: (_) {
              return RecipesBuilder(recipes: _.recipes);
            },
          );
        }));
  }
}
