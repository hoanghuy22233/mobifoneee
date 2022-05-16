// ignore: import_of_legacy_library_into_null_safe
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // ignore: import_of_legacy_library_into_null_safe
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobifone/api_resfull/user_repository.dart';
import 'package:mobifone/src/src_index.dart';
import 'package:mobifone/storages/storages.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
      {required UserRepository userRepository,
      required EventRepositoryStorage localRepository})
      : _userRepository = userRepository,
        _localRepository = localRepository,
        super(const AuthenticationState.unknown()) {
    _authenticationStatusSubscription = _userRepository.status.listen(
      (status) => add(AuthenticationStatusChanged(status)),
    );
  }
  final EventRepositoryStorage _localRepository;
  final UserRepository _userRepository;
  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;


  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationStateInit) {
      yield* _mapAuthenticationStatusInit();
    } else if (event is AuthenticationStatusChanged) {
      yield* _mapAuthenticationStatusChangedToState(event);
    } else if (event is AuthenticationLogoutRequested) {
      AppNavigator.navigateLogout();
      await _localRepository.saveUser(dotenv.env[PreferencesKey.TOKEN]!);
      await shareLocal.putString(PreferencesKey.TOKEN, '');
      await shareLocal.putString(PreferencesKey.USER_CODE, '');
      await shareLocal.putString(PreferencesKey.USER_EMAIL, '');
      await _localRepository.saveUserID("");
      _userRepository.logOut();
    }
  }

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    _userRepository.dispose();
    return super.close();
  }

  Stream<AuthenticationState> _mapAuthenticationStatusInit() async*{
    await _localRepository.loadUser();
  }

  Stream<AuthenticationState> _mapAuthenticationStatusChangedToState(AuthenticationStatusChanged event) async* {
    try{
      final response = await _localRepository.loadUser();
      if (response != dotenv.env[PreferencesKey.TOKEN]!) {
        _userRepository.addUser(InfoUser.fromJson(json.decode(response)["payload"]));
        yield AuthenticationState.authenticated();
      } else {
        _userRepository.addUser(InfoUser(token: dotenv.env[PreferencesKey.TOKEN]!));
        yield AuthenticationState.unauthenticated();
      }
    }catch(e){
      throw e;
    }
  }
  static AuthenticationBloc of(BuildContext context) => BlocProvider.of<AuthenticationBloc>(context);
}
