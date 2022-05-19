import 'package:flutter/material.dart';

import '../../../../../../src/src_index.dart';
import '../../../../../../widgets/widget_button.dart';
import '../../../../../../widgets/widget_dialog_fake.dart';
import '../../../../../../widgets/widget_line.dart';

class ServiceWidget extends StatefulWidget {
  const ServiceWidget({Key? key}) : super(key: key);

  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
