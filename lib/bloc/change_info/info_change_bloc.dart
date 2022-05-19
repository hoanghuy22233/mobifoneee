import 'dart:async';
import 'dart:ffi';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobifone/api_resfull/user_repository.dart';
import 'package:mobifone/src/src_index.dart';

part 'info_change_event.dart';
part 'info_changee_state.dart';

class InfoChangeBloc extends Bloc<InfoChangeEvent, InfoChangeState> {
  final UserRepository userRepository;

  InfoChangeBloc({required this.userRepository})
      : super(const InfoChangeState());

  @override
  void onTransition(Transition<InfoChangeEvent, InfoChangeState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<InfoChangeState> mapEventToState(InfoChangeEvent event) async* {
    if (event is EmailInfoChanged) {
      final email = UserName.dirty(event.email);
      yield state.copyWith(
        email: email.valid ? email : UserName.pure(event.email),
        status: Formz.validate([state.phone, email, state.fullname,state.date_or_birth]),
      );
    } else if (event is PhoneInfoChanged) {
      final phone = Phone.dirty(event.phone);
      yield state.copyWith(
        phone: phone.valid ? phone : Phone.pure(event.phone),
        status: Formz.validate([state.fullname, state.email,state.date_or_birth, phone]),
      );
    } else if (event is DateInfoChanged) {
      final date_or_birth = NotNull.dirty(event.date_or_birth);
      yield state.copyWith(
        date_or_birth : date_or_birth.valid ? date_or_birth : NotNull.pure(event.date_or_birth),
        status: Formz.validate([state.phone, state.email,state.fullname, date_or_birth]),
      );
    } else if (event is FullNameChanged) {
      final fullname = NotNull.dirty(event.fullname);
      yield state.copyWith(
        fullname: fullname.valid ? fullname : NotNull.pure(event.fullname),
        status: Formz.validate([fullname, state.email, state.date_or_birth,state.phone]),
      );

    } else if (event is PhoneInfoUnfocused) {
      final phone = Phone.dirty(state.phone.value);
      yield state.copyWith(
        phone: phone,
        status: Formz.validate([state.fullname, state.email,state.date_or_birth, phone]),
      );
    } else if (event is EmailInfoUnfocused) {
      final email = UserName.dirty(state.email.value);
      yield state.copyWith(
        email: email,
        status: Formz.validate([state.phone, email, state.fullname,state.date_or_birth]),
      );
    } else if (event is DateInfoUnfocused) {
      final date_or_birth = NotNull.dirty(state.date_or_birth.value);
      yield state.copyWith(
        date_or_birth: date_or_birth,
        status: Formz.validate([state.phone, state.email,state.fullname, date_or_birth]),
      );
    }else if (event is FullNameUnfocused) {
      final fullname = NotNull.dirty(state.fullname.value);
      yield state.copyWith(
        fullname: fullname,
        status: Formz.validate([fullname, state.email, state.date_or_birth,state.phone]),
      );
    } else if (event is InfoFormSubmitted) {
      try{
        if (state.status.isValidated) {
          yield state.copyWith(status: FormzStatus.submissionInProgress);
          var response = await userRepository.changeInfo(phone: state.phone.value, email: state.email.value, date_or_birth: state.date_or_birth.value, fullname: state.fullname.value);
          if (response.status == BASE_URL.SUCCESS_200) {
            yield state.copyWith(status: FormzStatus.submissionSuccess, message: response.message);
          } else {
            print('lỗi: ${response.message}');
            yield state.copyWith(status: FormzStatus.submissionFailure, message: response.message);
          }
        }
      }catch(e){
        yield state.copyWith(status: FormzStatus.submissionFailure, message: MESSAGES.CONNECT_ERROR);
        throw e;
      }
    }
  }
  static InfoChangeBloc of(BuildContext context) => BlocProvider.of<InfoChangeBloc>(context);
}