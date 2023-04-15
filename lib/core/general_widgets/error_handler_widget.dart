import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipes/core/constants/assets_constants.dart';
import 'package:recipes/core/constants/general_constants.dart';
import 'package:recipes/core/general_widgets/custom_list_space.dart';
import 'package:recipes/generated/locale_keys.g.dart';

class ErrorHandlerWidget extends StatelessWidget {
  final String message;
  final void Function() onReload;
  const ErrorHandlerWidget(
      {super.key, required this.message, required this.onReload});

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        const SizedBox(
          height: 100,
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox(width: 100, child: selectIcon(message: message)),
        ),
        const SizedBox(
          height: 30,
        ),
        Align(
            alignment: Alignment.center,
            child: Text(
              message,
              style: primaryTextTheme.displaySmall!
                  .copyWith(color: Theme.of(context).primaryColor),
            )),
        const SizedBox(
          height: 20,
        ),
        Align(
            alignment: Alignment.center,
            child: TextButton(
                onPressed: onReload,
                child: Text(LocaleKeys.button_reload.tr()))),
        CustomListSpacing(spacingValue: ListSpacingValue.spacingV24.value)
      ],
    );
  }

  Widget selectIcon({required String message}) {
    if (message == LocaleKeys.error_networkError.tr()) {
      return SvgPicture.asset(
        AssetsConstants.connectionErrorSvgIcon,
        width: 150,
      );
    } else if (message == LocaleKeys.error_noResultError.tr()) {
      return Image.asset(
        AssetsConstants.notFoundErrorImage,
        width: 100,
      );
    } else if (message == LocaleKeys.error_noResultError.tr()) {
      return Image.asset(
        AssetsConstants.unknownErrorImage,
        width: 100,
      );
    } else {
      return const Icon(
        Icons.error,
        size: 60,
      );
    }
  }
}
