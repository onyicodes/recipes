import 'package:flutter/material.dart';

class IngredientCard extends StatelessWidget {
  final bool selected;
  final String ingredientTitle;
  final void Function(String value) onSelect;
  const IngredientCard(
      {super.key,
      required this.selected,
      required this.onSelect,
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
              color: selected ? null : Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
                child: Text(
              ingredientTitle,
              style: primaryTextTheme.headlineLarge!
                  .copyWith(color: selected ? Colors.white : null),
            )),
          ),
        ),
      ),
    );
  }
}
