import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart';
import 'package:mobifone/src/src_index.dart';
import 'package:mobifone/widgets/widget_button.dart';
import 'package:mobifone/widgets/widget_line.dart';

class AccountScreen extends StatefulWidget {
  final bool? isBack;

  const AccountScreen({Key? key, this.isBack}) : super(key: key);
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;



  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      appBar: AppBar(
        title: Text(MESSAGES.INFORMATION_ACCOUNT,style: AppStyle.DEFAULT_18_BOLD.copyWith(color: Colors.white),),
        backgroundColor: COLORS.PRIMARY_COLOR,
        elevation: 0,
        leading: _buildBack(),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tài khoản chính',style: AppStyle.DEFAULT_18_BOLD,),
            Container(
              height: 140,width: AppValue.widths,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('500.000đ',style: AppStyle.DEFAULT_30_BOLD,),
                  WidgetButton(
                    onTap: (){AppNavigator.navigateAddMoney();},
                    height: 40,width: 150,
                    textColor: Colors.white,text: MESSAGES.ADD_MONEY,
                  )
                ],
              ),
            ),
            Text('Gói Data',style: AppStyle.DEFAULT_18_BOLD,),
            Container(
              height: 50,padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Gói Data ngày D5',style: AppStyle.DEFAULT_16),
                  Text('HSD: 30/04/2022',style: AppStyle.DEFAULT_16,),
                ],
              ),
            ),
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

}