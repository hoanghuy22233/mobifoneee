import 'dart:convert';

import 'package:card_swiper/card_swiper.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobifone/models/index.dart';
import 'package:mobifone/screens/screens.dart';
import 'package:mobifone/screens/widget_body_main_screen.dart';
import 'package:mobifone/src/models/model_generator/main_response.dart';
import 'package:mobifone/src/src_index.dart';
import 'package:mobifone/widgets/widget_appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobifone/widgets/widget_line.dart';
import 'package:mobifone/widgets/widgets.dart';

import '../storages/share_local.dart';
import 'menu/menu_left/main_menu.dart';

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen>{
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  late LoginData? data;

  @override
  void initState() {
    loadUser();
    super.initState();
  }

  loadUser()async{
    final response = await shareLocal.getString(PreferencesKey.USER);
    if(response!=null)
    {
      setState(() {
        data=LoginData.fromJson(jsonDecode(response)['data']);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: MainDrawer(onPress: handleOnPressItemMenu,),
      backgroundColor: Color(0xFFEFEFEF),
      appBar: AppBar(
        backgroundColor: COLORS.PRIMARY_COLOR,
        centerTitle: true,
        leading: GestureDetector(
          onTap: (){
            if (_drawerKey.currentContext != null && !_drawerKey.currentState!.isDrawerOpen) {
              _drawerKey.currentState!.openDrawer();
            }
          },
          child: Image.asset('assets/icons/menu.png',height: 25,width: 15,),
        ),
        actions: [
          GestureDetector(
            onTap: (){AppNavigator.navigateSearch();},
            child: SvgPicture.asset('assets/icons/search.svg',height: 25,width: 25,),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: (){
                AppNavigator.navigateNotification();
                },
              child: SvgPicture.asset('assets/icons/thongbao.svg',height: 25,width: 25,),
            ),
          )
        ],
        elevation: 0,
        title: Column(
          children: [
            WidgetText(title:data!.fullname??'',style: AppStyle.DEFAULT_16_BOLD.copyWith(color: COLORS.WHITE),),
            WidgetText(title:data!.phone??'',style: AppStyle.DEFAULT_14.copyWith(color: COLORS.WHITE),)
              ]
        ),
      ),
      body: WidgetBodyMainScreen(),
    );
  }
  _goiCuoc(){
    return Container(
      height: 90, padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('Gói Đata ngày D5',style: AppStyle.DEFAULT_16_BOLD,),
              Text('Data: 1GB',style: AppStyle.DEFAULT_14.copyWith(color: Colors.grey),),
              Text('Hạn sử dụng: 30 ngày',style: AppStyle.DEFAULT_14.copyWith(color: Colors.grey)),
              Text('90.000đ',style: AppStyle.DEFAULT_14.copyWith(color: COLORS.PRIMARY_COLOR)),
            ],
          ),
          WidgetButton(
            onTap: (){AppNavigator.navigateDetailData();},
            height: 40,width: 100,
            boxDecoration: BoxDecoration(
                border: Border.all(width: 1.2,color: COLORS.PRIMARY_COLOR),
                borderRadius: BorderRadius.circular(10)
            ),
            text: 'Đăng kí',textColor: COLORS.PRIMARY_COLOR,
          )
        ],
      ),
    );
  }
  _infoData(){
    return Container(
      height: AppValue.heights*0.18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text('Đang sử dụng',style: AppStyle.DEFAULT_14.copyWith(color: COLORS.PRIMARY_COLOR),),
          Text('Gói Data ngày D5',style: AppStyle.DEFAULT_16_BOLD),
          Text('Data: 1GB',style: AppStyle.DEFAULT_14.copyWith(color: Colors.grey)),
          Text('HSD: 30/04/2022',style: AppStyle.DEFAULT_14.copyWith(color: Colors.grey)),
          WidgetButton(
            onTap: (){AppNavigator.navigateData();},
            height: 40,padding: EdgeInsets.symmetric(horizontal: 90),
            backgroundColor: COLORS.SECONDS_COLOR,
            text: "Mua Data",textColor: Colors.white,
          )
        ],
      ),
    );
  }
  handleOnPressItemMenu(element){
    switch (element[PreferencesKey.TITLE]) {
      case MESSAGES.INFORMATION_ACCOUNT:
        _drawerKey.currentState!.openEndDrawer();
        AppNavigator.navigateInformationAccount();
        break;
      case MESSAGES.MENU_DATA:
        _drawerKey.currentState!.openEndDrawer();
        AppNavigator.navigateData();
        break;
      case MESSAGES.MENU_SERVICE:
        _drawerKey.currentState!.openEndDrawer();
        AppNavigator.navigateService();
        break;
      case MESSAGES.MENU_HOTLINE:
        showDialog(
          context: context,
          // barrierDismissible: false,
          builder: (BuildContext context) {
            return WidgetDialog(
              title: 'Gọi đến đường dây nóng',
              content: '1900 8198',
            );
          },
        );
        break;
      case MESSAGES.CHANGE_PASSWORD:
        _drawerKey.currentState!.openEndDrawer();
        AppNavigator.navigateChangePassword();
        break;
      case MESSAGES.LOG_OUT:
        showDialog(
          context: context,
          // barrierDismissible: false,
          builder: (BuildContext context) {
            return WidgetDialog(
              title: 'Bạn chắc chắn muốn đăng xuất',
              twoButton: true,
              onTap1: () {
                AppNavigator.navigateLogout();
              },
            );
          },
        );
        break;
      default:
        break;
    }
  }
}
