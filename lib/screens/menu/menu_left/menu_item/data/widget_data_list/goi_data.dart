import 'package:flutter/material.dart';

import '../../../../../../src/src_index.dart';
import '../../../../../../widgets/widget_button.dart';
import '../../../../../../widgets/widget_line.dart';

class Data extends StatefulWidget {
  const Data({Key? key}) : super(key: key);

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
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
    );
  }
}
