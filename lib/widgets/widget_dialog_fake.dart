import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobifone/src/src_index.dart';
import 'package:mobifone/widgets/widgets.dart';

class WidgetDialogFake extends StatelessWidget {
  final VoidCallback? onTap2, onTap1;
  final String? title;
  final Widget? content;
  final String? textButton1;
  final String? textButton2;
  final TextStyle? contentStyle, titleStyle;
  final Color? backgroundButton1;
  final Color? textColorButton1;
  final Color? backgroundButton2;
  final Color? textColorButton2;
  final bool? twoButton;

  const WidgetDialogFake({
    Key? key,
    this.onTap1,
    this.onTap2,
    this.title,
    this.content,
    this.textButton1 = MESSAGES.OK,
    this.textButton2 = MESSAGES.CANCEL,
    this.textColorButton1 = COLORS.WHITE,
    this.textColorButton2 = COLORS.BLACK,
    this.backgroundButton1 = COLORS.SECONDS_COLOR,
    this.backgroundButton2 = COLORS.WHITE,
    this.twoButton = false, this.contentStyle, this.titleStyle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          contentPadding: EdgeInsets.all(10),
          content: Container(
            width: AppValue.widths-30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Text(title ?? '', style: titleStyle?? AppStyle.DEFAULT_16_BOLD),
                      content != null ? AppValue.vSpaceSmall : SizedBox(),
                      content!
                    ],
                  ),
                ),
                AppValue.vSpaceSmall,

                twoButton == false ?
                InkWell(
                  onTap: onTap1 ?? ()=> AppNavigator.navigateBack(),
                  child: Container(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    decoration: BoxDecoration(
                      color: backgroundButton1,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      textButton1!,
                      style: AppStyle.DEFAULT_16_BOLD.copyWith(color: textColorButton1!),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
                    :
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: onTap2  ?? ()=> AppNavigator.navigateBack(),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: backgroundButton2,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                topLeft: Radius.circular(10.0)),
                          ),
                          child: Text(
                            textButton2!,
                            style: AppStyle.DEFAULT_16_BOLD.copyWith(color: textColorButton2!),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 2,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: onTap1 ?? ()=> AppNavigator.navigateBack(),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: backgroundButton1,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                          ),
                          child: Text(
                            textButton1!,
                            style: AppStyle.DEFAULT_16_BOLD.copyWith(color: textColorButton1!),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )

    );
  }
}


