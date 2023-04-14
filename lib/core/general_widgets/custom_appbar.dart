import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipes/core/constants/assets_constants.dart';

AppBar customAppBar(
    {Key? key,
    required String title,
    bool logoTitle = false,
    double elevation = 0.3,
    double toolbarHeight = 70,
    bool automaticallyImplyLeading = true,
    bool centerTitle = false,
    List<Widget> actions = const <Widget>[],
    required TextTheme primaryTextTheme,
    required void Function() onAppBarTap}) {
  return AppBar(
    title:  Text(
            title,
            style: primaryTextTheme.displayMedium,
          ),
    centerTitle: logoTitle ? true : centerTitle,
    actions: actions,
    automaticallyImplyLeading: automaticallyImplyLeading,
    leading: automaticallyImplyLeading
        ? Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 6.0,
              vertical: logoTitle ? 24 : 10,
            ),
            child:  GestureDetector(
      onTap: onAppBarTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.lightBlue,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: SvgPicture.asset(AssetsConstants.backArrowIcon,)
      ),
    ),
          )
        : null,
    elevation: logoTitle ? 0 : elevation,
    toolbarHeight: logoTitle ? 100 : toolbarHeight,
  );
}
