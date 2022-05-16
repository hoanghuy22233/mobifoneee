import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobifone/src/src_index.dart';
import 'package:mobifone/widgets/widgets.dart';

class CheckDataScreen extends StatefulWidget {
  const CheckDataScreen({Key? key}) : super(key: key);

  @override
  State<CheckDataScreen> createState() => _CheckDataScreenState();
}

class _CheckDataScreenState extends State<CheckDataScreen> {
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
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  width: AppValue.widths,padding: EdgeInsets.only(left: 15),
                  child: Text('28/02/2022',
                    style: AppStyle.DEFAULT_18_BOLD.copyWith(color: COLORS.PRIMARY_COLOR),
                    textAlign: TextAlign.start,),
                ),
                Container(
                  color: Colors.white,
                  height: 70,padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Image.asset('assets/icons/tracuoc.png',color: Colors.grey,),
                      AppValue.hSpaceSmall,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('CF120',style: AppStyle.DEFAULT_20_BOLD,),
                          Text('18:07'),
                        ],
                      ),
                      Spacer(),
                      Text('120.000đ',style: AppStyle.DEFAULT_18_BOLD.copyWith(color: COLORS.PRIMARY_COLOR),),
                    ],
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index){
            return SizedBox();
            },
          itemCount: 8),
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
