// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "appName": "My Recipes App",
  "snackBar": {
    "expiredDeals": "Expired ingredients cannot be selected, check useby date",
    "selectIngredient": "Select ingredients to proceed"
  },
  "home": {
    "date": "Date",
    "useby": "use by",
    "ingredientsTitle": "My Ingredients",
    "toolTip": {
      "findRecipes": "Find Recipes"
    },
    "bottomWidget": {
      "today": "TODAY"
    }
  },
  "recipe": {
    "appBarTile": "Recipes",
    "ingredient": "Ingredients"
  },
  "loading": "Loading...",
  "error": {
    "networkError": "Connection error",
    "serverError": "Server error occurred",
    "noResultError": "Result not found",
    "unknownError": "an unknown error occurred",
    "forBiddenError": "you don't have permission to access this resource",
    "badRequest": "Bad request"
  },
  "button": {
    "reload": "Reload",
    "today": "SELECT TODAY",
    "cancel": "CANCEL",
    "done": "DONE"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en};
}
