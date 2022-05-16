part of 'forgot_password_otp_bloc.dart';
class ForgotPasswordOTPState extends Equatable {
  const ForgotPasswordOTPState({
    this.email = const UserName.pure(),
    this.otp = const OTPNumber.pure(),
    this.status = FormzStatus.pure,
    this.message = ''
  });

  final UserName email;
  final OTPNumber otp;
  final FormzStatus status;
  final String message;

  ForgotPasswordOTPState copyWith({
    UserName? email,
    OTPNumber? otp,
    FormzStatus? status,
    String? message
  }) {
    return ForgotPasswordOTPState(
      email: email ?? this.email,
      otp: otp ?? this.otp,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [email, otp, status, message];
}
