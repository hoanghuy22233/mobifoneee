import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobifone/models/button_menu_model.dart';
import 'package:mobifone/src/src_index.dart';
import 'package:mobifone/widgets/widgets.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      appBar: AppBar(
        title: Text(MESSAGES.MENU_DATA,style: AppStyle.DEFAULT_18_BOLD.copyWith(color: Colors.white),),
        backgroundColor: COLORS.PRIMARY_COLOR,
        elevation: 0,
        leading: _buildBack(),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15,right: 15,top: 10),
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: Color(0xFFEFEFEF),
            appBar: TabBar(
              isScrollable: false,
              // automaticIndicatorColorAdjustment: true,
              indicatorColor: COLORS.PRIMARY_COLOR,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white
              ),
              labelColor: COLORS.PRIMARY_COLOR,
              unselectedLabelColor: COLORS.BLACK,
              labelStyle: AppStyle.DEFAULT_16,
              tabs: [
                Tab(text: 'Gói Data',height: 35,),
                Tab(text: 'Gói Cước',height: 35,),
                Tab(text: 'Thuê bao',height: 35,),
              ],

            ),
            body: Padding(
              padding: EdgeInsets.only(top: 10),
              child: TabBarView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15), topLeft: Radius.circular(15)
                        ),
                      color: Colors.white
                    ),
                    padding: EdgeInsets.only(left: 15,right: 15,top: 15),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Container(
                            height: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Gói Data ngày D5',style: AppStyle.DEFAULT_16_BOLD,),
                                    Text('Data: 1GB'),
                                    Text('Hạn sử dụng: 1 ngày'),
                                    Text('10.000đ',style: AppStyle.DEFAULT_16.copyWith(color: COLORS.PRIMARY_COLOR),),
                                  ],
                                ),
                                WidgetButton(
                                    onTap: (){
                                      AppNavigator.navigateDetailData();
                                    },
                                  width: 100,height: 40,
                                  text: MESSAGES.REGISTER,textColor: COLORS.PRIMARY_COLOR,
                                  boxDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(width: 1.1,color: COLORS.PRIMARY_COLOR)
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index){return WidgetLine();},
                        itemCount: 8),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15), topLeft: Radius.circular(15)
                        ),
                        color: Colors.white
                    ),
                    padding: EdgeInsets.only(left: 15,right: 15,top: 15),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Container(
                            height: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Gói Data ngày D5',style: AppStyle.DEFAULT_16_BOLD,),
                                    Text('Data: 1GB'),
                                    Text('Hạn sử dụng: 1 ngày'),
                                    Text('10.000đ',style: AppStyle.DEFAULT_16.copyWith(color: COLORS.PRIMARY_COLOR),),
                                  ],
                                ),
                                WidgetButton(
                                  onTap: (){
                                    AppNavigator.navigateDetailData();
                                  },
                                  width: 100,height: 40,
                                  text: MESSAGES.REGISTER,textColor: COLORS.PRIMARY_COLOR,
                                  boxDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(width: 1.1,color: COLORS.PRIMARY_COLOR)
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index){return WidgetLine();},
                        itemCount: 8),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15), topLeft: Radius.circular(15)
                        ),
                        color: Colors.white
                    ),
                    padding: EdgeInsets.only(left: 15,right: 15,top: 15),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Gói Data ngày D5',style: AppStyle.DEFAULT_16_BOLD,),
                              SizedBox(height: 5,),
                              GestureDetector(
                                onTap: (){
                                  showDialog(
                                    context: context,
                                    // barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return WidgetDialogFake(
                                        title: 'MobiQ',titleStyle: AppStyle.DEFAULT_16_BOLD.copyWith(color: COLORS.PRIMARY_COLOR),
                                        content: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Lợi ích',style: AppStyle.DEFAULT_16_BOLD.copyWith(color: COLORS.PRIMARY_COLOR),),
                                            Text('Cước SMS thấp: 200 đồng/SMS nội mạng, 250 đồng/SMS liên mạng',style: AppStyle.DEFAULT_14,),
                                            AppValue.vSpaceTiny,
                                            Text('Giá cước',style: AppStyle.DEFAULT_16_BOLD.copyWith(color: COLORS.PRIMARY_COLOR),),
                                            Text('Cước thoại: Nội mạng: 1.580 đồng/phút Liên mạng: 1.780 đồng/phút.',style: AppStyle.DEFAULT_14,),
                                            AppValue.vSpaceTiny,
                                            Text('Đăng kí gói cước',style: AppStyle.DEFAULT_16_BOLD.copyWith(color: COLORS.PRIMARY_COLOR),),
                                            Text('Đăng ký gói cước: tại cửa hàng, đại lý, các điểm phân phối chính thức của MobiFone toàn quốc. ',
                                              style: AppStyle.DEFAULT_14,),
                                          ],
                                        ),
                                        textButton1: 'Trở về',
                                        onTap1: () {
                                          AppNavigator.navigateBack();
                                        },
                                      );
                                    },
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset('assets/images/img-2.png',height: 150,width: AppValue.widths,fit: BoxFit.fill,),
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index){return Padding(padding: EdgeInsets.symmetric(vertical: 12),child: WidgetLine());},
                        itemCount: 8),
                  ),
                ],
              ),
            ),
          ),
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
