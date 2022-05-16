import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobifone/src/src_index.dart';

import '../../../widgets/widgets.dart';

class TransferMoney extends StatefulWidget {

  @override
  _TransferMoneyState createState() => _TransferMoneyState();
}
class _TransferMoneyState extends State<TransferMoney>{

  // TextEditingController _phoneController = TextEditingController();
  TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      appBar: AppBar(
        title: Text(MESSAGES.TRANSFER_MONEY,style: AppStyle.DEFAULT_18_BOLD.copyWith(color: Colors.white),),
        backgroundColor: COLORS.PRIMARY_COLOR,
        elevation: 0,
        leading: _buildBack(),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Chuyển tiền đến số thuê bao',style: AppStyle.DEFAULT_18_BOLD,),
            Container(
              height: AppValue.heights*0.31,padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Thuê bao nhận',style: AppStyle.DEFAULT_16,),
                  _buildTextForm(),
                  AppValue.vSpaceTiny,
                  Text('Số tiền',style: AppStyle.DEFAULT_16,),
                  _buildTextForm(
                    controller: _codeController,
                      endIcon: Text('đ',style: AppStyle.DEFAULT_18,textAlign: TextAlign.center,)),
                  AppValue.vSpaceSmall,
                  WidgetButton(
                    onTap: (){
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return WidgetDialog(
                            title: 'Chuyển thành công',
                            titleStyle: AppStyle.DEFAULT_18_BOLD.copyWith(color: COLORS.PRIMARY_COLOR),
                            content: 'Chúc mừng bạn đã chuyển thành công ${_codeController} đến thuê bao 0123456789',
                            contentStyle: AppStyle.DEFAULT_16,
                            textButton1: 'Trở về',
                          );
                        },
                      );
                    },
                    text: MESSAGES.TRANSFER_MONEY,textColor: Colors.white,
                    height: 40,padding: EdgeInsets.all(1),
                  ),

                ],
              ),
            ),
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
  _buildTextForm(
      {bool enabled = true,
        FocusNode? focusNode,
        Widget? endIcon,
        // GestureTapCallback? onTap,
        TextEditingController? controller}){
    return WidgetInput(
      focusNode: focusNode,
      endIcon: endIcon,
      height: 45,
      inputController: controller,
      boxDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1.5,color: Colors.grey)
      ),
    );
  }
}
