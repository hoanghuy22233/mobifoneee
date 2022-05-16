import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobifone/screens/login/index.dart';
import 'package:mobifone/src/src_index.dart';
import 'package:mobifone/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {

  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  PageController controller = PageController(initialPage: 0, keepPage: true);

  bool isSelect = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
          content: Text(MESSAGES.BACK_TO_EXIT, style: AppStyle.DEFAULT_16.copyWith(color: COLORS.WHITE),),
        ),
        child: SafeArea(
          child: WidgetTouchHideKeyBoard(
            child: Container(
              height: AppValue.heights,color: COLORS.WHITE,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 40,),
                    WidgetContainerImage(
                      image: IMAGES.LOGO_APP,
                      height: 80,
                      width: 80,
                    ),
                    AppValue.vSpaceMedium,
                    _buildLoginOrRegister(),
                    AppValue.vSpaceSmall,
                    isSelect ? WidgetLoginForm() : WidgetRegisterForm(),
                  ],
                ),
              )
            ),
          )
        ),
      ),
    );
  }

  int page = 0;

  _buildLoginOrRegister(){
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                isSelect = true;
                //controller.jumpToPage(0);
              });
            },
            child: Column(
              children: [
                Text(
                  MESSAGES.LOGIN,
                  style: isSelect ? AppStyle.DEFAULT_20_BOLD : AppStyle.DEFAULT_20,
                ),
                isSelect ? Container(
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                    color: COLORS.PRIMARY_COLOR,
                    shape: BoxShape.circle
                  ),
                ) : Container(
                  height: 5,
                  width: 5,
                )
              ],
            ),
          ),
          AppValue.hSpaceSmall,
          GestureDetector(
            onTap: (){
              setState(() {
                isSelect = false;
                //controller.jumpToPage(1);
              });
            },
            child: Column(
              children: [
                Text(
                  MESSAGES.REGISTER,
                  style: !isSelect ? AppStyle.DEFAULT_20_BOLD : AppStyle.DEFAULT_20,
                ),
                !isSelect ? Container(
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                      color: COLORS.PRIMARY_COLOR,
                      shape: BoxShape.circle
                  ),
                ) : Container(
                  height: 5,
                  width: 5,
                )
              ],
            ),
          ),
        ],

        // List.generate(listMenu.length, (index) {
        //   List<ButtonMenuModel> list = [];
        //   return GestureDetector(
        //       onTap: () {
        //         for (var itemData in listMenu) {
        //           if (itemData.title == listMenu[index].title) {
        //             itemData = ButtonMenuModel(
        //                 image: itemData.image,
        //                 title: itemData.title,
        //                 isSelect: true);
        //             setState(() {
        //               page = index;
        //               print('abc category page = $page');
        //             });
        //             list.add(itemData);
        //           } else {
        //             itemData = ButtonMenuModel(
        //                 image: itemData.image,
        //                 title: itemData.title,
        //                 isSelect: false);
        //             list.add(itemData);
        //           }
        //         }
        //         setState(() => listMenu = list);
        //         //controller.jumpToPage(index);
        //       },
        //       child: Text(
        //         listMenu[index].title,
        //         style: listMenu[index].isSelect ? AppStyle.DEFAULT_20_BOLD : AppStyle.DEFAULT_20,
        //       )
        //   );
        // }),
      ),
    );
  }
}
