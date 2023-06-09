import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:recipes/generated/locale_keys.g.dart';

class IngredientCard extends StatelessWidget {
  final bool selected, expired;
  final String ingredientTitle,  useby;
  final void Function(String value) onSelect;
  const IngredientCard(
      {super.key,
      required this.selected,
      required this.onSelect,
      required this.expired,
      required this.useby,
      required this.ingredientTitle});

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return InkWell(
      onTap: () {
        onSelect(ingredientTitle);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              gradient: selected
                  ? const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0, 0.1],
                      colors: [
                        Color(0xff34F5C5),
                        Color(0xff1DCDFE),
                      ],
                    )
                  : null,
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).shadowColor,
                    blurRadius: 6,
                    spreadRadius: 1)
              ],
              color: selected ? null : expired?Theme.of(context).cardColor.withAlpha(160) : Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                    child: Text(
                  ingredientTitle,
                  style: primaryTextTheme.headlineLarge!
                      .copyWith(color: selected ? Colors.white : null),
                )),

                Text("${LocaleKeys.home_useby.tr()} : $useby")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
