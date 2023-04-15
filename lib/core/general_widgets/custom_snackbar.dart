import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes/core/constants/assets_constants.dart';

Future<dynamic> customSnackbar(
    {required String title,
    required String message,
    int duration = 4,
    bool isError= false,
    SnackPosition snackPosition = SnackPosition.BOTTOM,
    Color overlayColor = Colors.white}) {
  Get.snackbar(title, message,
      icon:  Padding(
        padding: const EdgeInsets.all(4.0),
        child:isError?Image.asset(
        AssetsConstants.unknownErrorImage,
        width: 100,
      ):const Icon(Icons.food_bank_outlined, size: 35),
      ),
      backgroundColor: isError? Colors.red.shade100: null,
      duration: Duration(seconds: duration),
      snackPosition: snackPosition);
  return Future.delayed(Duration(seconds: duration));
}
