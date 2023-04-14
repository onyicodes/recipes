import 'package:flutter/material.dart';

class RecipesCard extends StatelessWidget {
  final String recipe;
  const RecipesCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).shadowColor,
                  blurRadius: 6,
                  spreadRadius: 1)
            ],
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
              child: Text(
            recipe,
            style: primaryTextTheme.headlineMedium,
          )),
        ),
      ),
    );
  }
}
