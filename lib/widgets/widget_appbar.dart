import 'package:get/get.dart';
import 'package:mobifone/src/src_index.dart';
import 'package:flutter/material.dart';

class WidgetAppbar extends StatelessWidget {
  final String? title;
  final Widget? widgetTitle;
  final Widget? left;
  final Widget? right;
  final Color? textColor, backgroundColor;
  final double? height;
  final bool? isTitleCenter;
  final bool? isDivider;

  const WidgetAppbar({
    Key? key,
    this.title,
    this.widgetTitle,
    this.left,
    this.right,
    this.backgroundColor,
    this.textColor = COLORS.WHITE,
    this.height = 60,
    this.isTitleCenter = false,
    this.isDivider = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: Get.width,
            height: height,
            child: Stack(
              children: [
                left != null
                    ? Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          padding: EdgeInsets.only(left: 16),
                          child: left
                        ),
                    )
                    : AppValue.kEmptyWidget,
                // AppValue.hSpace(16),
                //isTitleCenter == true ? Spacer() : AppValue.kEmptyWidget,
                Align(
                  alignment: isTitleCenter == true ? Alignment.center : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: isTitleCenter == true ? 0 : 70, right: 16),
                    child: widgetTitle ?? Text(
                      title ?? "",
                      style: AppStyle.DEFAULT_18_BOLD.copyWith(color: textColor),
                    ),
                  ),
                ),
                // Spacer(),
                // AppValue.hSpace(16),
                right != null
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: right
                    )
                    :
                AppValue.kEmptyWidget,
              ],
            ),
          ),
          isDivider == true ? Divider(
            color: COLORS.BACKGROUND,
            thickness: 0.8,
            height: 0,
          ) : AppValue.kEmptyWidget,
        ],
      ),
    );
  }
}
