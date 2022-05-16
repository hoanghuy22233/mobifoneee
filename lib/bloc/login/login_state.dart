part of 'login_bloc.dart';

class LoginState extends Equatable {


  final UserName email;
  final Password password;
  final FormzStatus status;
  final String message;
  final LoginData user;

  const LoginState({required this.email, required this.password, required this.status, required this.message, required this.user});

  LoginState copyWith({
    UserName? email,
    Password? password,
    String? message,
    FormzStatus? status,
    LoginData? user
  }) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        message: message ?? this.message,
        user: user ?? this.user
    );
  }

  @override
  List<Object> get props => [email, password, status, message, user];
}

// class SaveUserState extends LoginState{
//   final LoginData user;
//   const SaveUserState(this.user);
//   @override
//   List<Object> get props => [user];
// }