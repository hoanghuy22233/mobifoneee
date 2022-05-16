part of 'reset_password_bloc.dart';
abstract class ResetPasswordEvent extends Equatable {
  const ResetPasswordEvent();

  @override
  List<Object> get props => [];
}

class EmailResetChanged extends ResetPasswordEvent {
  const EmailResetChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class EmailResetUnfocused extends ResetPasswordEvent {}

class NewPasswordResetChanged extends ResetPasswordEvent {
  const NewPasswordResetChanged({required this.newPassword});

  final String newPassword;

  @override
  List<Object> get props => [newPassword];
}

class NewPasswordResetUnfocused extends ResetPasswordEvent {}

class TokenResetChanged extends ResetPasswordEvent {
  const TokenResetChanged({required this.token});

  final String token;

  @override
  List<Object> get props => [token];
}

class TokenResetUnfocused extends ResetPasswordEvent {}

class FormResetPasswordSubmitted extends ResetPasswordEvent {}
