part of 'info_change_bloc.dart';
abstract class InfoChangeEvent extends Equatable {
  const InfoChangeEvent();

  @override
  List<Object> get props => [];
}

class PhoneInfoChanged extends InfoChangeEvent {
  const PhoneInfoChanged({required this.phone});

  final String phone;

  @override
  List<Object> get props => [phone];
}

class PhoneInfoUnfocused extends InfoChangeEvent {}

class EmailInfoChanged extends InfoChangeEvent {
  const EmailInfoChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class EmailInfoUnfocused extends InfoChangeEvent {}

class DateInfoChanged extends InfoChangeEvent {
  const DateInfoChanged({required this.date_or_birth,});

  final String date_or_birth;

  @override
  List<Object> get props => [date_or_birth];
}

class DateInfoUnfocused extends InfoChangeEvent {}

class FullNameChanged extends InfoChangeEvent {
  const FullNameChanged({required this.fullname});

  final String fullname;

  @override
  List<Object> get props => [fullname];
}

class FullNameUnfocused extends InfoChangeEvent {}

class InfoFormSubmitted extends InfoChangeEvent {
  // final String? referral;

  InfoFormSubmitted(
      // this.referral
      );
}