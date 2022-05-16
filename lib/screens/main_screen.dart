import 'package:card_swiper/card_swiper.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobifone/models/index.dart';
import 'package:mobifone/screens/screens.dart';
import 'package:mobifone/src/src_index.dart';
import 'package:mobifone/widgets/widget_appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobifone/widgets/widget_button.dart';
import 'package:mobifone/widgets/widget_line.dart';

import '../widgets/widget_dialog.dart';
import 'menu/menu_left/main_menu.dart';

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen>{
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

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
            Text('Nguyễn Hoàng Huy',style: AppStyle.DEFAULT_16_BOLD.copyWith(color: COLORS.WHITE),),
            Text('0123456789',style: AppStyle.DEFAULT_14.copyWith(color: COLORS.WHITE),)
              ]
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: AppValue.heights*0.25,
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              color: COLORS.PRIMARY_COLOR,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tài khoản chính',style: AppStyle.DEFAULT_14.copyWith(color: COLORS.WHITE),),
                      InkWell(
                        onTap: (){AppNavigator.navigateAccount();},
                          child: Text('Chi tiết >',style: AppStyle.DEFAULT_14.copyWith(color: COLORS.WHITE),)),
                    ],
                  ),
                  AppValue.vSpaceTiny,
                  Text('500.000đ',style: AppStyle.DEFAULT_30_BOLD.copyWith(color: COLORS.WHITE),),
                  AppValue.vSpaceSmall,
                  Container(
                    height: AppValue.heights*0.1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    padding: EdgeInsets.only(left: 20,right: 20,top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){AppNavigator.navigateAddMoney();},
                          child: Column(
                            children: [
                              Image.asset('assets/icons/naptien.png'),
                              AppValue.vSpaceTiny,
                              Text('Nạp tiền',style: AppStyle.DEFAULT_14_BOLD,)
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            AppNavigator.navigateCheckData();
                          },
                          child: Column(
                            children: [
                              Image.asset('assets/icons/tracuoc.png'),
                              AppValue.vSpaceTiny,
                              Text('Tra cước',style: AppStyle.DEFAULT_14_BOLD)
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: (){AppNavigator.navigateTransferMoney();},
                          child: Column(
                            children: [
                              Image.asset('assets/icons/chuyentien.png'),
                              AppValue.vSpaceTiny,
                              Text('Chuyển tiền',style: AppStyle.DEFAULT_14_BOLD)
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            AppValue.vSpaceSmall,
            Container(
              height: Get.height * 0.18,
              child:
              // BlocBuilder<ListDocumentsBloc, ListDocumentsState>(
              //   builder: (context, state) {
              //     if (state is UpdateListDocuments) {
              //       return GestureDetector(
              //         onTap: ()=> AppNavigator.navigateDetailDocument(state.listDocumentsData),
              //         child:
              Swiper(
                itemBuilder: (BuildContext context, int index) {
                  // return itemDocument(data: state.listDocumentsData[index]);
                  return SizedBox(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset("assets/images/img-1.png", height: MediaQuery.of(context).size.height*0.2, width: MediaQuery.of(context).size.width,fit: BoxFit.fill,)
                        // WidgetCachedImage(
                        //   url: "",
                        //   fit: BoxFit.cover,
                        // ),
                      ),),);},
                autoplay: true,
                autoplayDelay: 5000,
                itemCount: 5,
                indicatorLayout: PageIndicatorLayout.COLOR,
                pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                      color: Colors.grey,
                      activeColor: COLORS.PRIMARY_COLOR,
                    )),
              ),
              // );
              // } else {
              //   return TrailLoading();
              // }
              // },
              // ),
            ),
            AppValue.vSpaceSmall,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Thông tin data',style: AppStyle.DEFAULT_18_BOLD,),
                  AppValue.vSpaceTiny,
                  _infoData(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Thông tin data',style: AppStyle.DEFAULT_18_BOLD,),
                      InkWell(
                        onTap: (){AppNavigator.navigateData();},
                          child: Text('Xem thêm >',style: AppStyle.DEFAULT_14,))
                    ],
                  ),
                  AppValue.vSpaceTiny,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),color: Colors.white,
                    ),
                    child: ListView.separated(
                      itemCount: 4,
                        shrinkWrap: true,
                        separatorBuilder: (context,index){return  WidgetLine();},
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                      return  _goiCuoc();
                    }),
                  ),
                  AppValue.vSpaceSmall,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Dịch vụ',style: AppStyle.DEFAULT_18_BOLD,),
                      InkWell(
                        onTap: (){AppNavigator.navigateService();},
                          child: Text('Xem thêm >',style: AppStyle.DEFAULT_14,))
                    ],
                  ),
                  AppValue.vSpaceTiny,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),color: Colors.white,
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: 8,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(left: 12,right: 12,top: 10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            AppNavigator.navigateDetailService();
                          },
                          child: Column(
                            children: [
                              Image.asset('assets/images/cliptv.png'),
                              Text('ClipTV')
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  AppValue.vSpaceMedium,
                ],
              )
            ),
          ],
        ),
      ),
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
