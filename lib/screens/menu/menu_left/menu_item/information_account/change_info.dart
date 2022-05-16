import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobifone/src/src_index.dart';
import 'package:mobifone/widgets/widget_button.dart';
import 'package:mobifone/widgets/widget_input.dart';
import 'package:mobifone/widgets/widget_line.dart';

class ChangeInformation extends StatelessWidget {
  const ChangeInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MESSAGES.CHANGE_INFORMATION,style: AppStyle.DEFAULT_18_BOLD.copyWith(color: Colors.white),),
        backgroundColor: COLORS.PRIMARY_COLOR,
        elevation: 0,
        leading: _buildBack(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppValue.vSpaceSmall,
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 3.8,
                  child: CircleAvatar(
                    // radius: 20,
                    backgroundImage: AssetImage('assets/images/img-1.png'),
                  ),
                ),
                Positioned(
                    left: AppValue.widths*0.55, top: AppValue.heights*0.1,
                    child: CircleAvatar(
                      radius: 12,
                        backgroundColor: COLORS.GREY,
                        child: SvgPicture.asset('assets/icons/mayanh.svg'))),
              ],
            ),
            Container(
              height: AppValue.heights*0.4,
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTextForm('Nguyen Hoang Huy'),
                  _buildTextForm('Nguyen Hoang Huy'),
                  _buildTextForm('Nguyen Hoang Huy'),
                  _buildTextForm('Nguyen Hoang Huy'),
                ],
              ),
            ),
            WidgetButton(
              onTap: (){},
              textColor: Colors.white,text: MESSAGES.SAVE,
              padding: EdgeInsets.symmetric(horizontal: 15),
            )
          ],
        ),
      ),
    );
  }
  _buildBack() {
    return IconButton(
      onPressed: () {
        AppNavigator.navigateBack();
      },
      icon: Image.asset(
        ICONS.ICON_BACK,
        height: 28,
        width: 28,
        color: COLORS.WHITE,
      ),
    );
  }
  _buildTextForm(String initialValue,
      {bool enabled = true,
      FocusNode? focusNode,
      GestureTapCallback? onTap,
      TextEditingController? controller}){
    return GestureDetector(
      onTap: onTap,
      child: WidgetInput(
        // onChanged: null,
        initialValue: initialValue,
        focusNode: focusNode,
        boxDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 1.5,color: Colors.grey)
        ),
      ),
    );
  }
}
