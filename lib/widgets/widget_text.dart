import 'package:flutter/material.dart';
import 'package:mobifone/src/src_index.dart';
// ignore: import_of_legacy_library_into_null_safe

class WidgetText extends StatelessWidget {
  final String? title;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLine;
  final TextOverflow? textOverflow;

  WidgetText({this.title, this.style, this.textAlign, this.maxLine = 1,this.textOverflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      textAlign: textAlign ?? textAlign,
      style: style ?? AppStyle.DEFAULT_16.copyWith(
        color: COLORS.WHITE,
        fontWeight: FontWeight.bold,
      ),
      overflow: textOverflow,
      maxLines: maxLine,
    );
  }
}