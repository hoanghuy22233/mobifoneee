import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobifone/src/src_index.dart';

import '../../../models/button_menu_model.dart';
import '../../../widgets/widgets.dart';

class AddMoney extends StatefulWidget {

  @override
  _AddMoneyState createState() => _AddMoneyState();
}
class _AddMoneyState extends State<AddMoney>{

  bool isSelect = false;
  List<ButtonMenuModel> listCode =[];

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<ButtonMenuModel> listCode = [
      ButtonMenuModel(money: '10.000 ', isSelect: false),
      ButtonMenuModel(money: '20.000 ', isSelect: false),
      ButtonMenuModel(money: '50.000 ', isSelect: false),
      ButtonMenuModel(money: '100.000 ', isSelect: false),
      ButtonMenuModel(money: '200.000 ', isSelect: false),
      ButtonMenuModel(money: '500.000 ', isSelect: false),
    ];
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      appBar: AppBar(
        title: Text(MESSAGES.ADD_MONEY,style: AppStyle.DEFAULT_18_BOLD.copyWith(color: Colors.white),),
        backgroundColor: COLORS.PRIMARY_COLOR,
        elevation: 0,
        leading: _buildBack(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Thẻ cào',style: AppStyle.DEFAULT_18_BOLD,),
              Container(
                height: AppValue.heights*0.5,padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Số điện thoại',style: AppStyle.DEFAULT_16,),
                    _buildTextForm(
                      controller: _phoneController,
                    ),
                    AppValue.vSpaceTiny,
                    Text('Số tiền',style: AppStyle.DEFAULT_16,),
                    _buildTextForm(
                        controller: _codeController,
                      // initialValue: 'aaaaa',
                      enabled: false,
                    ),
                    AppValue.vSpaceSmall,
                    GridView.builder(
                        shrinkWrap: true,
                        itemCount: listCode.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          mainAxisExtent: 50
                        ),
                        itemBuilder: (context, index){
                          // List<ButtonMenuModel> list = [];
                          // return _buildItemMenu(data: listMenu[index], index: index);
                          return GestureDetector(
                            onTap: (){
                              if (kDebugMode) {
                                print({listCode[index].money});
                              }
                              setState((){
                                _codeController.addListener(() {listCode[index].money;});
                              }
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(child: Text(
                                  listCode[index].money,
                              )),
                            ),
                          );
                        }),
                    AppValue.vSpaceSmall,
                    WidgetButton(
                      onTap: (){
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return WidgetDialog(
                              title: 'Nạp tiền thành công',
                              titleStyle: AppStyle.DEFAULT_18_BOLD.copyWith(color: COLORS.PRIMARY_COLOR),
                              content: 'Chúc mừng bạn đã nạp thành công 500.000đ vào tài khoản',
                              contentStyle: AppStyle.DEFAULT_16,
                              textButton1: 'Trở về',
                            );
                          },
                        );
                      },
                      text: 'Nạp tiền',textColor: Colors.white,
                      height: 40,padding: EdgeInsets.all(1),
                    ),
                    // Row(
                    //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     WidgetButton(
                    //         onTap: (){
                    //           showDialog(
                    //             context: context,
                    //             barrierDismissible: false,
                    //             builder: (BuildContext context) {
                    //               return WidgetDialog(
                    //                 title: 'Nạp tiền thành công',
                    //                 titleStyle: AppStyle.DEFAULT_18_BOLD.copyWith(color: COLORS.PRIMARY_COLOR),
                    //                 content: 'Chúc mừng bạn đã nạp thành công 500.000đ vào tài khoản',
                    //                 contentStyle: AppStyle.DEFAULT_16,
                    //                 textButton1: 'Trở về',
                    //               );
                    //             },
                    //           );
                    //         },
                    //       text: 'Nạp tiền',textColor: Colors.white,
                    //       height: 40,padding: EdgeInsets.all(1),
                    //     ),
                    //     // WidgetButton(
                    //     //   onTap: (){
                    //     //     _phoneController.clear();
                    //     //     _codeController.clear();
                    //     //   },
                    //     //   text: 'Xoá',textColor: Colors.grey,height: 40,padding: EdgeInsets.all(1),
                    //     //   boxDecoration:BoxDecoration(
                    //     //     border: Border.all(width: 1.2,color: Colors.grey),
                    //     //     borderRadius: BorderRadius.circular(20),
                    //     //     color: Colors.white
                    //     //   ),
                    //     //   width: 150,
                    //     // )
                    //   ],
                    // )
                  ],
                ),
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
  _buildTextForm(
      {bool enabled = true,
        String? initialValue,
        FocusNode? focusNode,
        // GestureTapCallback? onTap,
        TextEditingController? controller}){
    return WidgetInput(
      focusNode: focusNode,
      enabled: enabled,
      initialValue: initialValue,
      height: 50,
      inputController: controller,
      boxDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1.5,color: Colors.grey)
      ),
    );
  }
}
