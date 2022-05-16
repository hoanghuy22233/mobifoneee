// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_app_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginAppRequest _$LoginAppRequestFromJson(Map<String, dynamic> json) =>
    LoginAppRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginAppRequestToJson(LoginAppRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
