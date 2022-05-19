import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobifone/src/src_index.dart';
import 'package:mobifone/widgets/widgets.dart';

import '../../../../bloc/search/search_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  TextEditingController _controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    SearchBloc.of(context).add(InitSearchEvent(''));
    // _scrollController.addListener(() {
    //   if (_scrollController.offset ==
    //       _scrollController.position.maxScrollExtent && lenght<total) {
    //     GetListCustomerBloc.of(context).add(InitGetListOrderEvent('', page+1, search,isLoadMore: true));
    //     page = page + 1;
    //   } else {
    //   }
    // });
    super.initState();
  }

  String search='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchBloc,SearchState>(
          builder: (context, state) {
            if (state is UpdateSearchState) {
              return Scaffold(
                backgroundColor: Color(0xFFEFEFEF),
                appBar: AppBar(
                  titleSpacing: 0,
                  leading: _buildBack(),
                  elevation: 0,
                  toolbarHeight: 70,
                  title: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: WidgetInput(
                      onChanged: (text){
                        search=text;
                      },
                      onEditingComplete: (){
                        SearchBloc.of(context).add(InitSearchEvent(search));
                      },
                      hint: 'Tìm kiếm',
                      height: 45,
                      style: AppStyle.DEFAULT_16,
                      endIcon: GestureDetector(
                          onTap: () {
                            _controller.clear();
                          },
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
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                                    WidgetText(title:state.data.data![index].title??'',
                                      style: AppStyle.DEFAULT_16_BOLD,),
                                    WidgetText(title: 'Data: '+state.data.data![index].data!,style: AppStyle.DEFAULT_14,),
                                    WidgetText(title: 'Hạn sử dụng: '+state.data.data![index].expired_at!,style: AppStyle.DEFAULT_14),
                                    WidgetText(title:AppValue.APP_MONEY_FORMAT.format(state.data.data![index].price??''),
                                      style: AppStyle.DEFAULT_16.copyWith(
                                          color: COLORS.PRIMARY_COLOR),),
                                  ],
                                ),
                                WidgetButton(
                                  onTap: () {
                                    AppNavigator.navigateDetailData();
                                  },
                                  width: 100,
                                  height: 40,
                                  text: MESSAGES.REGISTER,
                                  textColor: COLORS.PRIMARY_COLOR,
                                  boxDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          width: 1.1, color: COLORS.PRIMARY_COLOR)
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return WidgetLine();
                        },
                        itemCount: state.data.data!.length),
                  ),
                ),
              );
            }
            else {
              return Container();
            }
          }),
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
