// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_app_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterAppRequest _$RegisterAppRequestFromJson(Map<String, dynamic> json) =>
    RegisterAppRequest(
      phone: json['phone'] as String,
      passwordCF: json['password_confirmation'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$RegisterAppRequestToJson(RegisterAppRequest instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'password': instance.password,
      'password_confirmation': instance.passwordCF,
    };
