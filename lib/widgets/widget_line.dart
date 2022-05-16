import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobifone/src/src_index.dart';

class WidgetLine extends StatelessWidget {
  final Color? color;
  const WidgetLine({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.1,width: AppValue.widths,
      color: color ?? Colors.grey.withOpacity(0.5),
    );
  }
}
