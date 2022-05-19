import 'dart:io';
import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/color.dart';

import '../../src/messages.dart';
import '../../src/models/model_generator/list_data.dart';
import '../../src/models/model_generator/main_response.dart';
import '../../widgets/loading_api.dart';

part 'list_data_event.dart';
part 'list_data_state.dart';

class ListDataBloc extends Bloc<ListDataEvent, ListDataState>{
  final UserRepository userRepository;

  ListDataBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitListDataState());

  @override
  Stream<ListDataState> mapEventToState(ListDataEvent event) async* {
    if (event is InitListDataEvent) {
      yield* _getListData();
    }
  }

  Stream<ListDataState> _getListData() async* {
    LoadingApi().pushLoading();
    try {
      final response = await userRepository.getListData();
      print('objecttttttttttttttttttttttttttttt');
      if(response.status == BASE_URL.SUCCESS_200){
        yield UpdateListDataState(response.data!);
        // if(page==1){
        //   listCus=response.data.list!;
        //   yield UpdateGetListCustomerState(response.data.list!,response.data.filter!,response.data.total!);
        // }
        //
        // else
        // {
        //   listCus!.addAll(response.data.list!);
        //   yield UpdateGetListCustomerState(listCus!,response.data.filter!,response.data.total!);
        // }
      }
      else {
        yield ErrorListDataState(response.message ?? '');
      }
    } catch (e) {
      yield ErrorListDataState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static ListDataBloc of(BuildContext context) => BlocProvider.of<ListDataBloc>(context);
}