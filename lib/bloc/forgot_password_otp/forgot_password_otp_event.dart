part of 'forgot_password_otp_bloc.dart';
abstract class ForgotPasswordOTPEvent extends Equatable {
  const ForgotPasswordOTPEvent();

  @override
  List<Object> get props => [];
}

class OtpCodeForgotPasswordOTPChanged extends ForgotPasswordOTPEvent {
  const OtpCodeForgotPasswordOTPChanged({required this.otp});

  final String otp;

  @override
  List<Object> get props => [otp];
}

class OtpCodeForgotPasswordOTPUnfocused extends ForgotPasswordOTPEvent {}


class EmailForgotPasswordOTPChanged extends ForgotPasswordOTPEvent {
  const EmailForgotPasswordOTPChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class EmailForgotPasswordOTPUnfocused extends ForgotPasswordOTPEvent {}

class FormForgotPasswordOTPSubmitted extends ForgotPasswordOTPEvent {}
