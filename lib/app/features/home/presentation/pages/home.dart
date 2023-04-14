import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes/app/features/home/presentation/controllers/home_controller.dart';

class Home extends GetView<HomeController> {
  Home({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
            
            body: ListView()
          );
  }
}

