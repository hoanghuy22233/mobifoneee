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
import '../../src/models/model_generator/search.dart';
import '../../widgets/loading_api.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState>{
  final UserRepository userRepository;

  SearchBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitSearchState());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is InitSearchEvent) {
      yield* _getSearch(search: event.search);
    }
  }

  Stream<SearchState> _getSearch({required String search}) async* {
    LoadingApi().pushLoading();
    try {
      final response = await userRepository.getSearch(search);
      print('objecttttttttttttttttttttttttttttt');
      if(response.status == BASE_URL.SUCCESS_200){
        yield UpdateSearchState(response.data!);
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
        yield ErrorSearchState(response.message ?? '');
      }
    } catch (e) {
      yield ErrorSearchState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static SearchBloc of(BuildContext context) => BlocProvider.of<SearchBloc>(context);
}