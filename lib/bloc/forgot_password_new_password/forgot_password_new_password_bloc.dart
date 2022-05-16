import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mobifone/api_resfull/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobifone/src/src_index.dart';


part 'forgot_password_new_password_event.dart';
part 'forgot_password_new_password_state.dart';

class ForgotChangePasswordBloc extends Bloc<ForgotChangePasswordEvent, ForgotChangePasswordState> {
  final UserRepository userRepository;

  ForgotChangePasswordBloc({required this.userRepository})
      : super(const ForgotChangePasswordState());

  @override
  void onTransition(Transition<ForgotChangePasswordEvent, ForgotChangePasswordState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<ForgotChangePasswordState> mapEventToState(ForgotChangePasswordEvent event) async* {
    if (event is ForgotPasswordChanged) {
      final password = Password.dirty(event.password);
      yield state.copyWith(
        password: password.valid ? password : Password.pure(event.password),
        status: Formz.validate([password, state.newPassword]),
      );
    }
    else if (event is ForgotNewPasswordChanged) {
      final newPassword = Password.dirty(event.newPassword);
      yield state.copyWith(
        newPassword: newPassword.valid ? newPassword : Password.pure(event.newPassword),
        status: Formz.validate([state.password, newPassword]),
      );
    }

    else if (event is ForgotPasswordUnfocused) {
      final password = Password.dirty(state.password.value);
      yield state.copyWith(
        password: password,
        status: Formz.validate([password, state.newPassword]),
      );
    }
    else if (event is ForgotNewPasswordUnfocused) {
      final newPassword = Password.dirty(state.newPassword.value);
      yield state.copyWith(
        newPassword: newPassword,
        status: Formz.validate([state.password, newPassword]),
      );
    }

    else if (event is FormForgotChangePasswordSubmitted) {
      try{
        if (state.status.isValidated) {
          yield state.copyWith(status: FormzStatus.submissionInProgress);
          print('newPassword: ${state.newPassword.value}');
          print('assword: ${state.password.value}');
          ParamResetPassword paramResetPassword = ParamResetPassword(state.newPassword.value, state.password.value);
          var response = await userRepository.resetPassword(paramResetPassword: paramResetPassword);
          if (response.statusCode == BASE_URL.SUCCESS) {
            DioProvider.instance(token: '');
            yield state.copyWith(status: FormzStatus.submissionSuccess, message: response.message);
          } else {
            yield state.copyWith(status: FormzStatus.submissionFailure, message: response.message);
          }
        }
      }catch(e){
        yield state.copyWith(status: FormzStatus.submissionFailure, message: MESSAGES.CONNECT_ERROR);
        throw e;
      }
    }
  }
  static ForgotChangePasswordBloc of(BuildContext context) => BlocProvider.of<ForgotChangePasswordBloc>(context);
}
