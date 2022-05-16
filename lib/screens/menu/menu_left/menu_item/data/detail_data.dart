import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobifone/src/src_index.dart';
import 'package:mobifone/widgets/widgets.dart';

class DetailData extends StatefulWidget {
  const DetailData({Key? key}) : super(key: key);

  @override
  State<DetailData> createState() => _DetailDataState();
}

class _DetailDataState extends State<DetailData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      appBar: AppBar(
        title: Text(MESSAGES.DETAIL_DATA,style: AppStyle.DEFAULT_18_BOLD.copyWith(color: Colors.white),),
        backgroundColor: COLORS.PRIMARY_COLOR,
        elevation: 0,
        leading: _buildBack(),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: Column(
          children: [
            Text('Gói Data ngày D5',style: AppStyle.DEFAULT_18_BOLD.copyWith(color: COLORS.PRIMARY_COLOR),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Data: 1GB',style: AppStyle.DEFAULT_16,),
                Text('Hạn sử dụng: 1 ngày',style: AppStyle.DEFAULT_16,),
                Text('Gia hạn tự động: Có',style: AppStyle.DEFAULT_16,),
                Text('5.000đ',style: AppStyle.DEFAULT_16,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),width: AppValue.widths,
                  child:Text('Gói cước có thể sử dụng song song với một gói cước Mobile khác'),
                )
              ],
            ),
            WidgetButton(
              onTap: (){
                showDialog(
                  context: context,
                  // barrierDismissible: false,
                  builder: (BuildContext context) {
                    return WidgetDialogFake(
                      title: 'Đăng kí thành công gói cước',titleStyle: AppStyle.DEFAULT_16_BOLD.copyWith(color: COLORS.PRIMARY_COLOR),
                      content: Column(
                        children: [
                          Text('Chúc mừng bạn đã đăng kí thành công',style: AppStyle.DEFAULT_14,),
                          Text('Gói Data ngày D5',style: AppStyle.DEFAULT_16_BOLD,)
                        ],
                      ),
                      onTap1: () {
                        AppNavigator.navigateMain();
                      },
                    );
                  },
                );
                },
              height: 40,width: 150,
              textColor: Colors.white,text: MESSAGES.REGISTER,
            )
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
