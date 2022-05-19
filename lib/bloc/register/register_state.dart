part of 'register_bloc.dart';
class RegisterState extends Equatable {
  const RegisterState({
    // this.fullName = const NotNull.pure(),
    this.email = const UserName.pure(),
    this.password = const Password.pure(),
    this.phone = const Phone.pure(),
    this.passwordCF = const Password.pure(),
    this.status = FormzStatus.pure,
    this.message = '',
    this.token = '',
  });

  // final NotNull fullName;
  final UserName email;
  final Phone phone;
  final Password passwordCF;
  final Password password;
  final FormzStatus status;
  final String message;
  final String? token;

  RegisterState copyWith({
    // NotNull? fullName,
    UserName? email,
    Password? password,
    Password? passwordConfirmation,
    Phone? phone,
    String? message,
    FormzStatus? status,
    String? token,
  }) {
    return RegisterState(
      // fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      passwordCF: passwordConfirmation ?? passwordCF,
      status: status ?? this.status,
      message: message ?? this.message,
      token: token ?? this.token,
    );
  }

  @override
  List<Object> get props => [
    // fullName,
    email,
    password,
    passwordCF,
    phone,
    status,
    token ?? '',
    message];
}