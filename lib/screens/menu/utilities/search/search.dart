import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobifone/src/src_index.dart';
import 'package:mobifone/widgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  TextEditingController _controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      appBar: AppBar(
        titleSpacing: 0,
        leading: _buildBack(),
        elevation: 0,toolbarHeight: 70,
        title: Padding(
          padding: EdgeInsets.only(right: 10),
          child: WidgetInput(
            hint: 'Tìm kiếm',
            height: 45,style: AppStyle.DEFAULT_16,
            endIcon: GestureDetector(
              onTap: (){_controller.clear();},
                child: SvgPicture.asset('assets/icons/close.svg')),
            boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: COLORS.WHITE),
            inputController: _controller,
            focusNode: focusNode,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15,right:15,top: 10,bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text('Gói cước',style: AppStyle.DEFAULT_18_BOLD,)),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
                ),
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
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
                    itemCount: 9),
              ),
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
