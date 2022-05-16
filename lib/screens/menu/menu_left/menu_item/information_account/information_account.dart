import 'package:flutter/material.dart';
import 'package:mobifone/src/src_index.dart';
import 'package:mobifone/widgets/widget_button.dart';
import 'package:mobifone/widgets/widget_line.dart';


class InformationAccount extends StatelessWidget {
  const InformationAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MESSAGES.INFORMATION_ACCOUNT,style: AppStyle.DEFAULT_18_BOLD.copyWith(color: Colors.white),),
        backgroundColor: COLORS.PRIMARY_COLOR,
        elevation: 0,
        leading: _buildBack(),
        centerTitle: true,
      ),
      body: Column(
        children: [
          AppValue.vSpaceSmall,
          AspectRatio(
              aspectRatio: 2.9,
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(IMAGES.IMAGE_INTRO1),
            ),
          ),
          Container(
            height: AppValue.heights*0.38,
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Họ và tên:',style: AppStyle.DEFAULT_16,),
                      Text('Nguyễn Hoàng Huy',style: AppStyle.DEFAULT_16_BOLD),
                    ],
                ),
                WidgetLine(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Số điện thoại:',style: AppStyle.DEFAULT_16,),
                    Text('0123456789',style: AppStyle.DEFAULT_16_BOLD),
                  ],
                ),
                WidgetLine(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Email:',style: AppStyle.DEFAULT_16,),
                    Text('love.giant2000@gmail.com',style: AppStyle.DEFAULT_16_BOLD),
                  ],
                ),
                WidgetLine(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Ngày sinh:',style: AppStyle.DEFAULT_16,),
                    Text('11/11/2020',style: AppStyle.DEFAULT_16_BOLD),
                  ],
                ),
                WidgetLine(),
              ],
            ),
          ),
          WidgetButton(
            onTap: (){AppNavigator.navigateChangeInformation();},
            textColor: Colors.white,text: MESSAGES.INFORMATION_CHANGE,
            padding: EdgeInsets.symmetric(horizontal: 15),
          )
        ],
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
}
