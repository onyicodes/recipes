import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes/app/features/home/presentation/controllers/home_controller.dart';
import 'package:recipes/generated/locale_keys.g.dart';

class Home extends GetView<HomeController> {
  Home({Key? key}) : super(key: key);
  
  
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
            
            body: GetBuilder<HomeController>(
              builder: (_) {
                return ListView(
                  children: [
                    Row(children: [
                     const Text(LocaleKeys.home_date),
                    GetX<HomeController>(
              builder: (_) {
                         return Text(DateFormat.yMd(context.locale).format(_.date) );
                       }
                     ),

                     
                    ],)
                  ],
                );
              }
            )
          );

          
  }

  
}

