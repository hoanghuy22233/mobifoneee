import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobifone/bloc/list_data/list_data_bloc.dart';
import 'package:mobifone/models/button_menu_model.dart';
import 'package:mobifone/screens/menu/menu_left/menu_item/data/widget_data_list/dich_vu.dart';
import 'package:mobifone/screens/menu/menu_left/menu_item/data/widget_data_list/goi_cuoc.dart';
import 'package:mobifone/screens/menu/menu_left/menu_item/data/widget_data_list/goi_data.dart';
import 'package:mobifone/src/models/model_generator/main_response.dart';
import 'package:mobifone/src/src_index.dart';
import 'package:mobifone/widgets/widgets.dart';

import '../../../../../bloc/main/main_bloc.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {

  @override
  void initState() {
    ListDataBloc.of(context).add(InitListDataEvent());
    super.initState();
  }

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
      body: Padding(
        padding: EdgeInsets.only(left: 15,right: 15,top: 10),
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: Color(0xFFEFEFEF),
            appBar: TabBar(
              isScrollable: false,
              // automaticIndicatorColorAdjustment: true,
              indicatorColor: COLORS.PRIMARY_COLOR,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white
              ),
              labelColor: COLORS.PRIMARY_COLOR,
              unselectedLabelColor: COLORS.BLACK,
              labelStyle: AppStyle.DEFAULT_16,
              tabs: const [
                Tab(text: 'Gói Data',height: 35,),
                Tab(text: 'Gói Cước',height: 35,),
                Tab(text: 'Thuê bao',height: 35,),
              ],

            ),
            body: BlocBuilder<ListDataBloc,ListDataState>(
                    builder: (context, state) {
            if (state is UpdateListDataState) {
              return Padding(
                padding: EdgeInsets.only(top: 10),
                child: TabBarView(
                  children: [
                    Data(),
                    Postage(),
                    ServiceWidget(),
                  ],
                ),
              );
            } else {
              return Container();
            }
                    }
            ),
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
