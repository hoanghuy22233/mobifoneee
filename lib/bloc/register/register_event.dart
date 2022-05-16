part of 'register_bloc.dart';
abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class FullNameRegisterChanged extends RegisterEvent {
  const FullNameRegisterChanged({required this.fullName});

  final String fullName;

  @override
  List<Object> get props => [fullName];
}

class FullNameRegisterUnfocused extends RegisterEvent {}

class PhoneRegisterChanged extends RegisterEvent {
  const PhoneRegisterChanged({required this.phone});

  final String phone;

  @override
  List<Object> get props => [phone];
}

class PhoneRegisterUnfocused extends RegisterEvent {}

class EmailRegisterChanged extends RegisterEvent {
  const EmailRegisterChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class EmailRegisterUnfocused extends RegisterEvent {}

class PasswordRegisterChanged extends RegisterEvent {
  const PasswordRegisterChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class PasswordRegisterUnfocused extends RegisterEvent {}

class ForgotPasswordRegisterChanged extends RegisterEvent {
  const ForgotPasswordRegisterChanged({required this.forgotPassword});

  final String forgotPassword;

  @override
  List<Object> get props => [forgotPassword];
}

class ForgotPasswordRegisterUnfocused extends RegisterEvent {}


class RegisterFormSubmitted extends RegisterEvent {}