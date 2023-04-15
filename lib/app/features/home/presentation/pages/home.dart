import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:recipes/app/features/home/presentation/controllers/home_controller.dart';
import 'package:recipes/app/features/home/presentation/widgets/ingredient_builder.dart';
import 'package:recipes/core/constants/general_constants.dart';
import 'package:recipes/core/general_widgets/custom_appbar.dart';
import 'package:recipes/core/general_widgets/custom_list_space.dart';
import 'package:recipes/generated/locale_keys.g.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Scaffold(
        appBar: customAppBar(
            title: LocaleKeys.home_appBarTitle.tr(),
            primaryTextTheme: primaryTextTheme,
            onAppBarTap: () {
              Get.back();
            }),
        floatingActionButton: GetBuilder<HomeController>(builder: (_) {
          return FloatingActionButton(
            backgroundColor: Theme.of(context).iconTheme.color,
            tooltip: LocaleKeys.home_toolTip_findRecipes.tr(),
            onPressed: () {
              _.goToRecipes();
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.send),
            ),
          );
        }),
        body: GetBuilder<HomeController>(builder: (_) {
          return ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      LocaleKeys.home_date.tr(),
                      style: primaryTextTheme.displaySmall,
                    ),
                    GetX<HomeController>(builder: (_) {
                      return TextButton(
                        onPressed: () {
                          _.datePicker();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8),
                          decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              boxShadow: [
                                BoxShadow(
                                    color: Theme.of(context).shadowColor,
                                    blurRadius: 2,
                                    spreadRadius: 1)
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12))),
                          child: Text(
                            _.date,
                            style: primaryTextTheme.bodyLarge,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              const IngredientBuilder(),
              CustomListSpacing(spacingValue: ListSpacingValue.spacingV32.value)
            ],
          );
        }));
  }
}
