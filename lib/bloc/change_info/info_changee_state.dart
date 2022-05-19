part of 'info_change_bloc.dart';
class InfoChangeState extends Equatable {
  const InfoChangeState({
    // this.fullName = const NotNull.pure(),
    this.email = const UserName.pure(),
    this.fullname = const NotNull.pure(),
    this.phone = const Phone.pure(),
    this.date_or_birth = const NotNull.pure(),
    this.status = FormzStatus.pure,
    this.message = '',
    this.token = '',
  });

  // final NotNull fullName;
  final UserName email;
  final Phone phone;
  final NotNull fullname;
  final NotNull date_or_birth;
  final FormzStatus status;
  final String message;
  final String? token;

  InfoChangeState copyWith({
    NotNull? fullname,
    UserName? email,
    NotNull? date_or_birth,
    Phone? phone,
    String? message,
    FormzStatus? status,
    String? token,
  }) {
    return InfoChangeState(
      fullname: fullname ?? this.fullname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      date_or_birth: date_or_birth ?? this.date_or_birth,
      status: status ?? this.status,
      message: message ?? this.message,
      token: token ?? this.token,
    );
  }

  @override
  List<Object> get props => [
    // fullName,
    email,
    fullname,
    date_or_birth,
    phone,
    status,
    token ?? '',
    message];
}