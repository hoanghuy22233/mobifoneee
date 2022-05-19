import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobifone/src/src_index.dart';
import 'package:mobifone/widgets/widget_button.dart';
import 'package:mobifone/widgets/widget_line.dart';

import '../../../../../bloc/login/login_bloc.dart';
import '../../../../../bloc/main/main_bloc.dart';
import '../../../../../storages/share_local.dart';

class InformationAccount extends StatefulWidget {
  const InformationAccount({Key? key}) : super(key: key);

  @override
  State<InformationAccount> createState() => _InformationAccountState();
}

class _InformationAccountState extends State<InformationAccount> {

  late LoginData data;

  @override
  void initState() {
    loadUser();
    super.initState();
  }

  loadUser()async{
    final response = await shareLocal.getString(PreferencesKey.USER);
    if(response!=null)
    {
      setState(() {
        data=LoginData.fromJson(jsonDecode(response)['data']);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MESSAGES.INFORMATION_ACCOUNT,style: AppStyle.DEFAULT_18_BOLD.copyWith(color: Colors.white),),
        backgroundColor: COLORS.PRIMARY_COLOR,
        elevation: 0,
        leading: _buildBack(),
        centerTitle: true,
      ),
      body: Column(
        children: [
          AppValue.vSpaceSmall,
          data.avatar !=null ? CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(data.avatar!),
          ): const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(IMAGES.IMAGE_INTRO1),
          ),
          Container(
            height: AppValue.heights*0.38,
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Họ và tên:',style: AppStyle.DEFAULT_16,),
                    Text(data.fullname??'',style: AppStyle.DEFAULT_16_BOLD),
                  ],
                        ),
                WidgetLine(),
                Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Số điện thoại:',style: AppStyle.DEFAULT_16,),
                            Text(data.phone!,style: AppStyle.DEFAULT_16_BOLD),
                          ],
                        ),
                        WidgetLine(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Email:',style: AppStyle.DEFAULT_16,),
                            Text(data.email!,style: AppStyle.DEFAULT_16_BOLD),
                          ],
                        ),
                        WidgetLine(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Ngày sinh:',style: AppStyle.DEFAULT_16,),
                            Text(data.date_or_birth??'',style: AppStyle.DEFAULT_16_BOLD),
                          ],
                        ),
                        WidgetLine(),
                      ],
                    ),
                  ),
                  WidgetButton(
                    onTap: (){
                      AppNavigator.navigateChangeInformation(data.id!);
                      print({data.id});
                      },
                    textColor: Colors.white,text: MESSAGES.INFORMATION_CHANGE,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                  )
                ],
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
