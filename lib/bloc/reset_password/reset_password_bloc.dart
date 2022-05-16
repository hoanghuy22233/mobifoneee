
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:mobifone/api_resfull/user_repository.dart';
import 'package:mobifone/src/src_index.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final UserRepository userRepository;

  ResetPasswordBloc({required this.userRepository})
      : super(const ResetPasswordState());

  @override
  void onTransition(Transition<ResetPasswordEvent, ResetPasswordState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<ResetPasswordState> mapEventToState(ResetPasswordEvent event) async* {
    if (event is EmailResetChanged) {
      final email = UserName.dirty(event.email);
      yield state.copyWith(
        email: email.valid ? email : UserName.pure(event.email),
        status: Formz.validate([email, state.newPassword, state.token]),
      );
    }

    else if (event is NewPasswordResetChanged) {
      final newPassword = Password.dirty(event.newPassword);
      yield state.copyWith(
        newPassword: newPassword.valid ? newPassword : Password.pure(event.newPassword),
        status: Formz.validate([state.email, newPassword, state.token]),
      );
    }

    else if (event is TokenResetChanged) {
      final repeatPassword = NotNull.dirty(event.token);
      yield state.copyWith(
        token: repeatPassword.valid ? repeatPassword : NotNull.pure(event.token),
        status: Formz.validate([state.email, state.newPassword, repeatPassword]),
      );
    }

    else if (event is EmailResetUnfocused) {
      final otp = UserName.dirty(state.email.value);
      yield state.copyWith(
        email: otp,
        status: Formz.validate([otp , state.newPassword, state.token]),
      );
    }

    else if (event is NewPasswordResetUnfocused) {
      final newPassword = Password.dirty(state.newPassword.value);
      yield state.copyWith(
        newPassword: newPassword,
        status: Formz.validate([state.email, newPassword, state.token]),
      );
    }

    else if (event is TokenResetUnfocused) {
      final repeatPassword = NotNull.dirty(state.token.value);
      yield state.copyWith(
        token: repeatPassword,
        status: Formz.validate([state.email, state.newPassword, repeatPassword]),
      );
    }

    else if (event is FormResetPasswordSubmitted) {
      if (state.status.isValidated) {
        yield state.copyWith(status: FormzStatus.submissionInProgress);
        ParamResetPassword paramResetPassword = ParamResetPassword(
            state.email.value,
            state.newPassword.value
        );
        try{
          var response = await userRepository.resetPassword(
              paramResetPassword: paramResetPassword
          );
          if (response.statusCode == BASE_URL.SUCCESS) {
            yield state.copyWith(status: FormzStatus.submissionSuccess, message: response.message);
          } else {
            yield state.copyWith(status: FormzStatus.submissionFailure, message: response.message);
          }
        }catch(e){
          yield state.copyWith(status: FormzStatus.submissionFailure, message: MESSAGES.CONNECT_ERROR);
          throw e;
        }
      }
    }
  }
  static ResetPasswordBloc of(BuildContext context) => BlocProvider.of<ResetPasswordBloc>(context);
}
