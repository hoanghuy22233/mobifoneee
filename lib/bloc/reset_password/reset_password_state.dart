part of 'reset_password_bloc.dart';

class ResetPasswordState extends Equatable {
  const ResetPasswordState({
    this.email = const UserName.pure(),
    this.newPassword = const Password.pure(),
    this.token = const NotNull.pure(),
    this.status = FormzStatus.pure,
    this.message = ''
  });

  final UserName email;
  final Password newPassword;
  final NotNull token;
  final FormzStatus status;
  final String message;

  ResetPasswordState copyWith({
    UserName? email,
    Password? newPassword,
    NotNull? token,
    FormzStatus? status,
    String? message
  }) {
    return ResetPasswordState(
      email: email ?? this.email,
      newPassword: newPassword ?? this.newPassword,
      token: token ?? this.token,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [email, newPassword, token, status, message];
}
