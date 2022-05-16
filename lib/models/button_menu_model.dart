import 'package:flutter/cupertino.dart';

class ButtonMenuModel {
  final String money;
  final GestureTapCallback? onTap;
  final bool isSelect;

  ButtonMenuModel({
    required this.money,
    this.onTap,
    required this.isSelect
  });

}
