import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:recipes/generated/locale_keys.g.dart';

class CustomSimpleLoadingWidget extends StatelessWidget {
  final double size = 50;
  const CustomSimpleLoadingWidget(
      {Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: size +5,
              height: size+5,
              child: LoadingAnimationWidget.discreteCircle(
                  color: Theme.of(context).primaryColor,
                  size: 100,
                  thirdRingColor: const Color(0xff1DCDFE)),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              width: size,
              height: size,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(50)),
              child: Icon(
                Icons.food_bank_rounded,
                color: Theme.of(context).iconTheme.color,
                size: 35,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            LocaleKeys.loading.tr(),
            style: Theme.of(context).primaryTextTheme.bodyLarge,
          ),
        )
      ],
    ));
  }
}
