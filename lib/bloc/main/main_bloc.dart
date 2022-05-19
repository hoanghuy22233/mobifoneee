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
import '../../src/models/model_generator/main_response.dart';
import '../../widgets/loading_api.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainResponseBloc extends Bloc<MainResponseEvent, MainResponseState>{
  final UserRepository userRepository;

  MainResponseBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitMainResponseState());

  @override
  Stream<MainResponseState> mapEventToState(MainResponseEvent event) async* {
    if (event is InitMainResponseEvent) {
      yield* _getMainResponse();
    }
  }

  Stream<MainResponseState> _getMainResponse() async* {
    LoadingApi().pushLoading();
    try {
      final response = await userRepository.getMainData();
      print('objecttttttttttttttttttttttttttttt');
      if(response.status == BASE_URL.SUCCESS_200){
        yield UpdateMainResponseState(response.data!);
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
        yield ErrorMainResponseState(response.message ?? '');
      }
    } catch (e) {
      yield ErrorMainResponseState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static MainResponseBloc of(BuildContext context) => BlocProvider.of<MainResponseBloc>(context);
}