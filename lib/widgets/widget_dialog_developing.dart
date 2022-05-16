import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:mobifone/src/src_index.dart';
import 'package:mobifone/widgets/widgets.dart';

// ignore: use_key_in_widget_constructors
class WidgetDialogDeveloping extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return WidgetDialog(
      title: MESSAGES.NOTIFICATION,
      content: MESSAGES.DEVELOPING,
      onTap1: () => AppNavigator.navigateBack(),
    );
  }
}