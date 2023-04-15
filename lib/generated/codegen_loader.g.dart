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
  "appName": "Recepes",
  "home": {
    "date": "Date",
    "useby": "use by",
    "appBarTitle": "My Ingredients",
    "toolTip": {
      "findRecipes": "Find Recipes"
    },
    "selectIngredient": "Select ingredients to proceed",
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
