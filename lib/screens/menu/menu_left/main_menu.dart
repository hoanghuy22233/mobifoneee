
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../bloc/authen/authentication_bloc.dart';
import '../../../../src/src_index.dart';
import '../../../../widgets/widget_cached_image.dart';
import 'package:grouped_list/grouped_list.dart';
import '../../../../widgets/widget_dialog.dart';
import '../../../widgets/widget_button.dart';
import 'widget_item_list_menu.dart'; // ignore: import_of_legacy_library_into_null_safe

class MainDrawer extends StatelessWidget {
  final Function? onPress;

  const MainDrawer({this.onPress});

  @override
  Widget build(BuildContext context) {
    List _elements = [
      {
        'title': MESSAGES.INFORMATION_ACCOUNT,
        'image': ICONS.ICON_USER,
        'group': '1',
        'isAdmin': false
      },
      {
        'title': MESSAGES.MENU_DATA,
        'image': ICONS.ICON_DATA,
        'group': '1',
        'isAdmin': false,
      },
      {
        'title': MESSAGES.MENU_SERVICE,
        'image': ICONS.ICON_SERVICE,
        'group': '1',
        'isAdmin': false,
      },
      {
        'title': MESSAGES.MENU_HOTLINE,
        'image': ICONS.ICON_HOTLINE,
        'group': '1',
        'isAdmin': false,
      },
      {
        'title': MESSAGES.CHANGE_PASSWORD,
        'image': ICONS.ICON_CHANGEPASS,
        'group': '1',
        'isAdmin': false,
      },
      {
        'title': MESSAGES.LOG_OUT,
        'image': ICONS.LOGOUT_ICON,
        'group': '1',
        'isAdmin': false,
      },
    ];
    final bloc = AuthenticationBloc.of(context);
    return Container(
      color: COLORS.WHITE,
      width: AppValue.widths*0.7,
      height: AppValue.heights,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 35,left: 10),color: COLORS.PRIMARY_COLOR,
            height: AppValue.heights*0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 0.7,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(IMAGES.IMAGE_INTRO1),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("DucHiep", style: AppStyle.DEFAULT_16_BOLD.copyWith(fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                    AppValue.vSpaceTiny,
                    Text("0779265208", style: AppStyle.DEFAULT_16.copyWith(fontFamily:'Montserrat',fontWeight: FontWeight.w400),),
                  ],
                ),
                SizedBox(width: 15,),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
              child: GroupedListView<dynamic, String>(
                shrinkWrap: false,
                //elements: Handle.isArraysObject(_elements, state.role == 1 ? false : true),//check admin permission
                elements: _elements,//check admin permission
                groupBy: (element) => element['group'],
                groupSeparatorBuilder: (String value) =>
                    Container(),
                itemBuilder: (c, element) => Padding(
                  padding: const EdgeInsets.only( top: 7.0),
                  child: !element['isAdmin']
                      ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () => onPress!(element),
                          child: WidgetItemListMenu(
                            icon: element['image'],
                            title: element['title'],
                          ),
                        ),
                        AppValue.vSpaceSmall,
                      ],
                    ),
                  )
                      : Container(),
                ),
              )
          ),
          Image.asset('assets/images/Background.png')
        ],
      ),
    );
  }
  _showDialog(){
    return WidgetDialog(
      onTap1: ()=>AppNavigator.navigateBack(),
      onTap2: ()=>AppNavigator.navigateBack(),
      title: 'Bạn chắc chắn muốn đăng xuất ?',
    );
  }
}