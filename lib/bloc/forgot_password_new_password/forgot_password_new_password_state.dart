part of 'forgot_password_new_password_bloc.dart';
class ForgotChangePasswordState extends Equatable {
  const ForgotChangePasswordState({
    this.password = const Password.pure(),
    this.newPassword = const Password.pure(),
    this.status = FormzStatus.pure,
    this.message = ''
  });

  final Password password;
  final Password newPassword;
  final FormzStatus status;
  final String message;

  ForgotChangePasswordState copyWith({
    Password? password,
    Password? newPassword,
    FormzStatus? status,
    String? message
  }) {
    return ForgotChangePasswordState(
      password: password ?? this.password,
      newPassword: newPassword ?? this.newPassword,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [password, newPassword, status, message];
}
