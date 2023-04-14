import 'package:flutter/material.dart';

class IngredientCard extends StatelessWidget {
  final bool selected;
  final String ingredientTitle;
  const IngredientCard({super.key, required this.selected, required this.ingredientTitle});

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
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
            style: primaryTextTheme.headlineMedium!
                .copyWith(color: selected ? Colors.white : null),
          )),
        ),
      ),
    );
  }
}
