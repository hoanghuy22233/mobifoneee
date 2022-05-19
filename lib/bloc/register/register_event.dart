part of 'register_bloc.dart';
abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

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
  const PasswordRegisterChanged({required this.password,});

  final String password;

  @override
  List<Object> get props => [password];
}

class ConfirmPasswordRegisterChanged extends RegisterEvent {
  const ConfirmPasswordRegisterChanged({required this.passwordCF});

  final String passwordCF;

  @override
  List<Object> get props => [passwordCF];
}

class PasswordRegisterUnfocused extends RegisterEvent {}

class ConfirmPasswordRegisterUnfocused extends RegisterEvent {}

class RegisterFormSubmitted extends RegisterEvent {
  // final String? referral;

  RegisterFormSubmitted(
      // this.referral
      );
}