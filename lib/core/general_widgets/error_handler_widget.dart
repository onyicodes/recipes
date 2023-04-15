import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          child: SizedBox(
              width: 100,
              child: selectIcon(message: message)),
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
            child: TextButton(onPressed: onReload, child: Text(LocaleKeys.button_reload.tr()))),
        CustomListSpacing(spacingValue: ListSpacingValue.spacingV24.value)
      ],
    );
  }

  Widget selectIcon({required String message}) {
    switch (message) {
      case LocaleKeys.error_networkError:
        return SvgPicture.asset(
          'assets/svg_icons/error_icons/connection_error_svg.svg',
          width: 150,
        );
      case LocaleKeys.error_unknownError:
        return Image.asset(
          'assets/svg/error_icons/unknown_error_emoji.png',
          width: 100,
        );
      case LocaleKeys.error_noResultError:
        return Image.asset(
          'assets/svg/error_icons/result_not_found_emoji.png',
          width: 100,
        );
      default:
        return const Icon(
          Icons.error,
          size: 60,
        );
    }
  }
}
