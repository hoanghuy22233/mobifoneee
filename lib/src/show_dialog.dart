import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobifone/src/src_index.dart';
import 'package:mobifone/widgets/widgets.dart';

class ShowDialogCustom {

  static showLoading() {
    showDialog<void>(
      context: Get.context!,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return TrailLoading();
      },
    );
  }

  static endLoading() {
    Get.back();
  }

  static showDialogOneButton({String? title, String? content, String? textButton, Color? colorButton, VoidCallback? onTap}) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return WidgetDialog(
          title: title ?? MESSAGES.NOTIFICATION,
          content: content ?? MESSAGES.SUCCESS,
          onTap1: onTap,
          textButton1: textButton,
          backgroundButton1: colorButton,
        );
      },
    );
  }

  static showDialogTwoButton({String? title, String? content, String? textButton1, Color? colorButton1, VoidCallback? onTap1, String? textButton2, Color? colorButton2, VoidCallback? onTap2}) {
    showDialog<void>(
      context: Get.context!,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? 'Thông báo', style: AppStyle.DEFAULT_16_BOLD.copyWith(fontSize: 18),),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(content ?? 'Nội dung thông báo', style: AppStyle.DEFAULT_16,),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(textButton1 ?? 'OK', style: AppStyle.DEFAULT_16.copyWith(fontSize: 18, color: colorButton1 ?? Colors.black),),
              onPressed: onTap1 ?? ()=> Get.back(),
            ),
            TextButton(
              child: Text(textButton2 ?? 'Hủy', style: AppStyle.DEFAULT_16.copyWith(fontSize: 18, color: colorButton2 ?? Colors.black),),
              onPressed: onTap2 ?? ()=> Get.back(),
            ),
          ],
        );
      },
    );
  }
}