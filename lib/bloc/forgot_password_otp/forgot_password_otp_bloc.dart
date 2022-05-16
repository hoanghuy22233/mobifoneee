import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobifone/api_resfull/user_repository.dart';
import 'package:mobifone/src/src_index.dart';

part 'forgot_password_otp_event.dart';
part 'forgot_password_otp_state.dart';

class ForgotPasswordOTPBloc extends Bloc<ForgotPasswordOTPEvent, ForgotPasswordOTPState> {
  final UserRepository userRepository;

  ForgotPasswordOTPBloc({required this.userRepository})
      : super(const ForgotPasswordOTPState());

  @override
  void onTransition(Transition<ForgotPasswordOTPEvent, ForgotPasswordOTPState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<ForgotPasswordOTPState> mapEventToState(ForgotPasswordOTPEvent event) async* {
    if (event is OtpCodeForgotPasswordOTPChanged) {
      final otpCode = OTPNumber.dirty(event.otp);
      yield state.copyWith(
        otp: otpCode.valid ? otpCode : OTPNumber.pure(event.otp),
        status: Formz.validate([state.email, otpCode]),
      );
    }
    else if (event is EmailForgotPasswordOTPChanged) {
      final email = UserName.dirty(event.email);
      yield state.copyWith(
        email: email.valid ? email : UserName.pure(event.email),
        status: Formz.validate([email, state.otp]),
      );
    }
    else if (event is OtpCodeForgotPasswordOTPUnfocused) {
      final otpCode = OTPNumber.dirty(state.otp.value);
      yield state.copyWith(
        otp: otpCode,
        status: Formz.validate([state.email, otpCode]),
      );
    }
    else if (event is EmailForgotPasswordOTPUnfocused) {
      final email = UserName.dirty(state.email.value);
      yield state.copyWith(
        email: email,
        status: Formz.validate([email, state.otp]),
      );
    }
    else if (event is FormForgotPasswordOTPSubmitted) {
      try{
        if (state.status.isValidated) {
          yield state.copyWith(status: FormzStatus.submissionInProgress);
          print('abcabc: email: ${state.email.value}, otpCode: ${state.otp.value}');

          var response = await userRepository.otpForgotPassword(email: state.email.value, otpCode: state.otp.value);
          if (response.code == BASE_URL.SUCCESS) {
            GetSnackBarUtils.removeSnackBar();
            AppNavigator.navigateForgotPasswordReset();
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
  static ForgotPasswordOTPBloc of(BuildContext context) => BlocProvider.of<ForgotPasswordOTPBloc>(context);
}
