import 'package:flutter/material.dart';
import 'package:study_tree/src/ui/counter/widgets/widgets.dart';

mixin UIErrorMixin {
  void handleValueError({
    required BuildContext context,
    required Stream<String?> error,
  }) {
    error.listen((error) {
      if (error != null) {
        showErrorMessage(context: context, message: error);
      }
    });
  }
}
