import 'dart:async';
import 'dart:ffi';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobifone/api_resfull/user_repository.dart';
import 'package:mobifone/src/src_index.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository userRepository;

  RegisterBloc({required this.userRepository})
      : super(const RegisterState());

  @override
  void onTransition(Transition<RegisterEvent, RegisterState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is EmailRegisterChanged) {
      final email = UserName.dirty(event.email);
      yield state.copyWith(
        email: email.valid ? email : UserName.pure(event.email),
        status: Formz.validate([state.phone, email, state.password]),
      );
    } else if (event is PasswordRegisterChanged) {
      final password = Password.dirty(event.password);
      yield state.copyWith(
        password: password.valid ? password : Password.pure(event.password),
        status: Formz.validate([state.phone, state.email, password]),
      );
    } else if (event is ConfirmPasswordRegisterChanged) {
      final passwordCF = Password.dirty(event.passwordCF);
      yield state.copyWith(
        passwordConfirmation : passwordCF.valid ? passwordCF : Password.pure(event.passwordCF),
        status: Formz.validate([state.phone, state.email,state.password, passwordCF]),
      );
    } else if (event is PhoneRegisterChanged) {
      final phone = Phone.dirty(event.phone);
      yield state.copyWith(
        phone: phone.valid ? phone : Phone.pure(event.phone),
        status: Formz.validate([phone, state.email, state.password]),
      );

    } else if (event is PhoneRegisterUnfocused) {
      final phone = Phone.dirty(state.phone.value);
      yield state.copyWith(
        phone: phone,
        status: Formz.validate([phone, state.email, state.password]),
      );
    } else if (event is EmailRegisterUnfocused) {
      final email = UserName.dirty(state.email.value);
      yield state.copyWith(
        email: email,
        status: Formz.validate([state.phone, email, state.password]),
      );
    } else if (event is PasswordRegisterUnfocused) {
      final password = Password.dirty(state.password.value);
      yield state.copyWith(
        password: password,
        status: Formz.validate([state.phone, state.email, password]),
      );
    }else if (event is ConfirmPasswordRegisterUnfocused) {
      final passwordCF = Password.dirty(state.password.value);
      yield state.copyWith(
        passwordConfirmation: passwordCF,
        status: Formz.validate([state.phone, state.email, state.password,passwordCF]),
      );
    } else if (event is RegisterFormSubmitted) {
      try{

        if (state.status.isValidated) {
          yield state.copyWith(status: FormzStatus.submissionInProgress);
          var response = await userRepository.registerApp(phone: state.phone.value, email: state.email.value, password: state.password.value, passwordCF: state.password.value);
          if (response.status == BASE_URL.SUCCESS_200) {
            AppNavigator.navigateBack();
            yield state.copyWith(status: FormzStatus.submissionSuccess, message: response.message);
          } else {
            print('lỗi: ${response.message}');
            yield state.copyWith(status: FormzStatus.submissionFailure, message: response.message);
          }
        }
      }catch(e){
        yield state.copyWith(status: FormzStatus.submissionFailure, message: MESSAGES.CONNECT_ERROR);
        throw e;
      }
    }
  }
  static RegisterBloc of(BuildContext context) => BlocProvider.of<RegisterBloc>(context);
}