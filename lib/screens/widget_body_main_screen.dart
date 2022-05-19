import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobifone/bloc/main/main_bloc.dart';
import 'package:mobifone/src/models/model_generator/main_response.dart';

import '../src/src_index.dart';
import '../widgets/widget_button.dart';
import '../widgets/widget_line.dart';
import '../widgets/widget_text.dart';

class WidgetBodyMainScreen extends StatefulWidget {
  const WidgetBodyMainScreen({Key? key}) : super(key: key);

  @override
  State<WidgetBodyMainScreen> createState() => _WidgetBodyMainScreenState();
}

class _WidgetBodyMainScreenState extends State<WidgetBodyMainScreen> {

  @override
  void initState() {
    MainResponseBloc.of(context).add(InitMainResponseEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainResponseBloc,MainResponseState>(
        builder: (context, state) {
          if (state is UpdateMainResponseState) {
            return SingleChildScrollView(
              child: Container(
                // color: Color(0xFFEFEFEF),
                color: Color(0xFFEFEFEF),
                child: Column(
                  children: [
                    Container(
                      height: AppValue.heights * 0.25,
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      color: COLORS.PRIMARY_COLOR,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Tài khoản chính', style: AppStyle.DEFAULT_14
                                  .copyWith(color: COLORS.WHITE),),
                              InkWell(
                                  onTap: () {
                                    AppNavigator.navigateAccount();
                                  },
                                  child: Text('Chi tiết >',
                                    style: AppStyle.DEFAULT_14.copyWith(
                                        color: COLORS.WHITE),)),
                            ],
                          ),
                          AppValue.vSpaceTiny,
                          WidgetText(title:AppValue.APP_MONEY_FORMAT.format(state.data.walletMoney??''),textOverflow: TextOverflow.ellipsis,style: AppStyle.DEFAULT_30_BOLD.copyWith(color: COLORS.WHITE),),
                          AppValue.vSpaceSmall,
                          Container(
                            height: AppValue.heights * 0.1,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    AppNavigator.navigateAddMoney();
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset('assets/icons/naptien.png'),
                                      AppValue.vSpaceTiny,
                                      Text('Nạp tiền',
                                        style: AppStyle.DEFAULT_14_BOLD,)
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    AppNavigator.navigateCheckData();
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset('assets/icons/tracuoc.png'),
                                      AppValue.vSpaceTiny,
                                      Text('Tra cước',
                                          style: AppStyle.DEFAULT_14_BOLD)
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    AppNavigator.navigateTransferMoney();
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset('assets/icons/chuyentien.png'),
                                      AppValue.vSpaceTiny,
                                      Text('Chuyển tiền',
                                          style: AppStyle.DEFAULT_14_BOLD)
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
                    SizedBox(
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
                                  child: Image.network(
                                    state.data.sliders![index].src??'',
                                    // 'assets/images/dua.jpg',
                                    height: AppValue.heights* 0.2,
                                    width: AppValue.widths,
                                    fit: BoxFit.fill,)
                                // WidgetCachedImage(
                                //   url: "",
                                //   fit: BoxFit.cover,
                                // ),
                              ),),);
                        },
                        autoplay: true,
                        autoplayDelay: 5000,
                        itemCount: state.data.sliders!.length,
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
                            Text(
                              'Thông tin data', style: AppStyle.DEFAULT_18_BOLD,),
                            AppValue.vSpaceTiny,
                            Container(
                              height: AppValue.heights*0.18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Text('Đang sử dụng',style: AppStyle.DEFAULT_14.copyWith(color: COLORS.PRIMARY_COLOR),),
                                  Container(
                                      child: state.data.info_data !=null ? Column(
                                        children: [
                                          WidgetText(title:state.data.info_data!.title,style: AppStyle.DEFAULT_16_BOLD),
                                          Text('Data: '+state.data.info_data!.data!,style: AppStyle.DEFAULT_14.copyWith(color: Colors.grey)),
                                          Text('HSD: '+state.data.info_data!.expired_at!,style: AppStyle.DEFAULT_14.copyWith(color: Colors.grey)),
                                        ],
                                      ) : Expanded(child:Center(child:Text('Bạn chưa đăng kí dịch vụ nào!',style: AppStyle.DEFAULT_16_BOLD,),))
                                  ),
                                  WidgetButton(
                                    onTap: (){AppNavigator.navigateData();},
                                    height: 40,padding: EdgeInsets.symmetric(horizontal: 90),
                                    backgroundColor: COLORS.SECONDS_COLOR,
                                    text: "Mua Data",textColor: Colors.white,
                                  )
                                  ],
                                ),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Thông tin gói cước', style: AppStyle
                                    .DEFAULT_18_BOLD,),
                                InkWell(
                                    onTap: () {
                                      AppNavigator.navigateData();
                                    },
                                    child: Text(
                                      'Xem thêm >', style: AppStyle.DEFAULT_14,))
                              ],
                            ),
                            AppValue.vSpaceTiny,
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: ListView.separated(
                                  itemCount: state.data.packages!.list!.length,
                                  // itemCount: 1,
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) {
                                    return WidgetLine();
                                  },
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: 90, padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              WidgetText(title:state.data.packages!.list![index].title??'',style: AppStyle.DEFAULT_16_BOLD,),
                                              Row(
                                                children: [
                                                  Text('Data: ',style: AppStyle.DEFAULT_14.copyWith(color: Colors.grey),),
                                                  WidgetText(title:state.data.packages!.list![index].data??'',style: AppStyle.DEFAULT_14.copyWith(color: Colors.grey),),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text('Han su dung: ',style: AppStyle.DEFAULT_14.copyWith(color: Colors.grey),),
                                                  WidgetText(title:state.data.packages!.list![index].expiredAt??'',style: AppStyle.DEFAULT_14.copyWith(color: Colors.grey),),
                                                ],
                                              ),
                                              WidgetText(title:AppValue.APP_MONEY_FORMAT.format(state.data.packages!.list![index].price??''),style: AppStyle.DEFAULT_14.copyWith(color: COLORS.PRIMARY_COLOR)),
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
                                  }),
                            ),
                            AppValue.vSpaceSmall,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Dịch vụ', style: AppStyle.DEFAULT_18_BOLD,),
                                InkWell(
                                    onTap: () {
                                      AppNavigator.navigateService();
                                    },
                                    child: Text(
                                      'Xem thêm >', style: AppStyle.DEFAULT_14,))
                              ],
                            ),
                            AppValue.vSpaceTiny,
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: GridView.builder(
                                shrinkWrap: true,
                                itemCount: state.data.services!.list!.length,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.only(left: 12,
                                    right: 12,
                                    top: 10),
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 10,
                                  mainAxisExtent: 90
                                ),
                                itemBuilder: (context, index2) {
                                  return GestureDetector(
                                    onTap: () {
                                      AppNavigator.navigateDetailService();
                                    },
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.network(state.data.services!.list![index2].thumbnail??'',width: 50,height: 50,fit: BoxFit.fill,),
                                        ),
                                        SizedBox(
                                            width: AppValue.widths*0.18,
                                            child: WidgetText(title:state.data.services!.list![index2].title??'',style: AppStyle.DEFAULT_14,textAlign: TextAlign.center,))
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
          } else {
            return Container();
          }
        });
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
}
