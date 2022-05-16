part of 'forgot_password_new_password_bloc.dart';
abstract class ForgotChangePasswordEvent extends Equatable {
  const ForgotChangePasswordEvent();

  @override
  List<Object> get props => [];
}

class ForgotPasswordChanged extends ForgotChangePasswordEvent {
  const ForgotPasswordChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class ForgotPasswordUnfocused extends ForgotChangePasswordEvent {}


class ForgotNewPasswordChanged extends ForgotChangePasswordEvent {
  const ForgotNewPasswordChanged({required this.newPassword});

  final String newPassword;

  @override
  List<Object> get props => [newPassword];
}

class ForgotNewPasswordUnfocused extends ForgotChangePasswordEvent {}


class FormForgotChangePasswordSubmitted extends ForgotChangePasswordEvent {}
