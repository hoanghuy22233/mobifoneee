import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobifone/src/src_index.dart';
import 'package:mobifone/widgets/widgets.dart';

import '../../../../../bloc/main/main_bloc.dart';
import '../../../utilities/text_widget.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {

  @override
  void initState() {
    MainResponseBloc.of(context).add(InitMainResponseEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      appBar: AppBar(
        title: Text(MESSAGES.MENU_SERVICE,style: AppStyle.DEFAULT_18_BOLD.copyWith(color: Colors.white),),
        backgroundColor: COLORS.PRIMARY_COLOR,
        elevation: 0,
        leading: _buildBack(),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15,right: 15,top: 15),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15)
              ),
              color: Colors.white
          ),
          child: BlocBuilder<MainResponseBloc,MainResponseState>(
              builder: (context, state) {
              if (state is UpdateMainResponseState) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                    AppNavigator.navigateDetailService();
                    },
                    child: Container(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('assets/images/img-1.png',fit: BoxFit.fill,height: 55,width: 55,)
                          ),
                        Container(
                          width: AppValue.widths*0.65,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text('ClipTV',style: AppStyle.DEFAULT_16_BOLD,),
                            ExpandableTextWidget(
                              text: 'Là dịch vụ truyền hình trên mạng Internet đem đến cho khách hàng trải nghiệm đặc sắc với các kênh truyền hình trong nước và quốc tế, hàng ngàn bộ phim bom tấn có bản quyền, kho nội dung VOD phong phú, đa dạng về thể thao, âm nhạc, gameshow, golf, chứng khoán… Khách hàng có thể sử dụng dịch vụ ClipTV trên các thiết bị khác nhau có kết nối Internet như điện thoại, máy tính, SmartTV…',
                              ),
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
                  itemCount: 10);
                } else {
                  return Container();
              }
              }
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
