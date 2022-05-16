import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobifone/src/src_index.dart';
import 'package:mobifone/widgets/widget_button.dart';
import 'package:mobifone/widgets/widget_input.dart';
import 'package:mobifone/widgets/widget_line.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MESSAGES.NOTIFICATION,style: AppStyle.DEFAULT_18_BOLD.copyWith(color: Colors.white),),
        backgroundColor: COLORS.PRIMARY_COLOR,
        elevation: 0,
        leading: _buildBack(),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  AppNavigator.navigateDetailNotification();
                },
                child: Container(
                  height: 85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AspectRatio(
                          aspectRatio: 0.5,
                        child: Image.asset('assets/images/thongbao.png'),
                      ),
                      Container(
                        width: AppValue.widths*0.7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Vouchers mua sắm Lazada dành tặng thuê bao MobiFone',style: AppStyle.DEFAULT_14_BOLD,),
                            Text('30/04/2022',)
                          ],
                        ),
                      ),
                      SvgPicture.asset('assets/icons/notificationMuiten.svg')
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context,index){return WidgetLine();}, 
            itemCount: 10),
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
