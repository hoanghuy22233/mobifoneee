part of 'register_bloc.dart';
class RegisterState extends Equatable {
  const RegisterState({
    this.fullName = const NotNull.pure(),
    this.email = const UserName.pure(),
    this.password = const Password.pure(),
    this.phone = const Phone.pure(),
    this.status = FormzStatus.pure,
    this.message = ''
  });

  final NotNull fullName;
  final UserName email;
  final Password password;
  final Phone phone;
  final FormzStatus status;
  final String message;

  RegisterState copyWith({
    NotNull? fullName,
    UserName? email,
    Password? password,
    Phone? phone,
    String? message,
    FormzStatus? status,
  }) {
    return RegisterState(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [fullName, email, password,phone, status, message];
}