import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobifone/src/src_index.dart';
import 'package:mobifone/widgets/widget_button.dart';
import 'package:mobifone/widgets/widget_input.dart';
import 'package:mobifone/widgets/widget_line.dart';

class DetailNotification extends StatelessWidget {
  const DetailNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MESSAGES.DETAIL_NOTIFICATION,style: AppStyle.DEFAULT_18_BOLD.copyWith(color: Colors.white),),
        backgroundColor: COLORS.PRIMARY_COLOR,
        elevation: 0,
        leading: _buildBack(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: AppValue.widths,
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Vouchers mua sắm Lazada dành tặng thuê bao MobiFone',
                style: AppStyle.DEFAULT_18_BOLD,),
              Text('09:00 30/04/2022',style: AppStyle.DEFAULT_16_BOLD.copyWith(color: Colors.grey),),
              WidgetLine(),
              AppValue.vSpaceTiny,
              Text('       Egestas nunc, amet sodales ac. Semper vivamus massa, quis feugiat blandit auctor fermentum, in. Nisi orci pretium pellentesque eu. Nec quam feugiat tincidunt cursus luctus ultrices. Et etiam massa euismod gravida nisl. Ornare lectus nec at a nibh donec tristique. Dictum aliquam pharetra purus ultricies pulvinar tellus gravida tristique euismod. Ac sit in egestas ultricies ultrices sit. Tristique orci risus, quis dictumst massa. Leo scelerisque id fermentum, sed facilisi at ac. Amet adipiscing morbi mollis convallis. Diam sodales integer at justo, et sed at quam. Porttitor laoreet malesuada est ullamcorper turpis purus egestas justo. In ornare ut dapibus dictum. Iaculis elementum ut aliquam ante mi nisi in.',
                style: AppStyle.DEFAULT_14,
                textAlign: TextAlign.justify,
              )
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
