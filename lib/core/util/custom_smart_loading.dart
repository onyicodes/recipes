import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:recipes/core/general_widgets/custom_loading_widget.dart';

customSmartLoading({ required bool loading}) {
  loading
      ? SmartDialog.showLoading(
          builder: (_) {
            return const CustomSimpleLoadingWidget();
          },
        )
      : SmartDialog.dismiss();
}
