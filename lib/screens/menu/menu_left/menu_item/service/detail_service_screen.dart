import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobifone/src/src_index.dart';
import 'package:mobifone/widgets/widgets.dart';

class DetailService extends StatefulWidget {
  const DetailService({Key? key}) : super(key: key);

  @override
  State<DetailService> createState() => _DetailServiceState();
}

class _DetailServiceState extends State<DetailService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      appBar: AppBar(
        title: Text(MESSAGES.DETAIL_SERVICE,style: AppStyle.DEFAULT_18_BOLD.copyWith(color: Colors.white),),
        backgroundColor: COLORS.PRIMARY_COLOR,
        elevation: 0,
        leading: _buildBack(),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15,right: 15,top: 20),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 15,right: 15,top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('assets/images/img-1.png',height: 50,width: 50,fit: BoxFit.fill,),
                  ),
                  AppValue.hSpaceTiny,
                  Text('ClipTV'),
                ],
              ),
              AppValue.vSpaceTiny,
              Text('Là dịch vụ truyền hình trên mạng Internet đem đến cho khách hàng trải nghiệm đặc sắc với các kênh truyền hình trong nước và quốc tế, hàng ngàn bộ phim bom tấn có bản quyền, kho nội dung VOD phong phú, đa dạng về thể thao, âm nhạc, gameshow, golf, chứng khoán… Khách hàng có thể sử dụng dịch vụ ClipTV trên các thiết bị khác nhau có kết nối Internet như điện thoại, máy tính, SmartTV…',
                style: AppStyle.DEFAULT_16,
                textAlign: TextAlign.justify,
              ),
              AppValue.vSpaceTiny,
              WidgetLine(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('ClipTV',style: AppStyle.DEFAULT_16,),
                      Text('6000d/1ngày',style: AppStyle.DEFAULT_14.copyWith(color: COLORS.PRIMARY_COLOR),)
                    ],
                  ),
                  WidgetButton(
                      onTap: (){
                        showDialog(
                          context: context,
                          // barrierDismissible: false,
                          builder: (BuildContext context) {
                            return WidgetDialogFake(
                              title: 'Đăng kí thành công dịch vụ',titleStyle: AppStyle.DEFAULT_16_BOLD.copyWith(color: COLORS.PRIMARY_COLOR),
                              content: Column(
                                children: [
                                  Text('Chúc mừng bạn đã đăng kí thành công',style: AppStyle.DEFAULT_14,),
                                  Text('ClipTV',style: AppStyle.DEFAULT_16_BOLD,)
                                ],
                              ),
                              onTap1: () {
                                AppNavigator.navigateMain();
                              },
                            );
                          },
                        );
                      },
                    padding: EdgeInsets.all(10),
                    text: MESSAGES.REGISTER, textColor: Colors.white,
                    height: 40,width: 100,
                  )
                ],
              ),
              WidgetLine(),
              AppValue.vSpaceTiny,
              Text('Tính năng chính',style: AppStyle.DEFAULT_16_BOLD,),
              Text('Tính năng chính',style: AppStyle.DEFAULT_14,),
              Text('Tính năng chính',style: AppStyle.DEFAULT_14,),
              Text('Liên hệ - Hỗ trợ',style: AppStyle.DEFAULT_16_BOLD,),
              Text('Tính năng chính',style: AppStyle.DEFAULT_14,),
              Text('Tính năng chính',style: AppStyle.DEFAULT_14,),
            ],
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
