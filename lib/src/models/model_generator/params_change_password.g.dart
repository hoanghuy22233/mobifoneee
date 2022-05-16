// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'params_change_password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParamChangePassword _$ParamChangePasswordFromJson(Map<String, dynamic> json) =>
    ParamChangePassword(
      oldPass: json['password'] as String,
      newPass: json['newPassword'] as String,
    );

Map<String, dynamic> _$ParamChangePasswordToJson(
        ParamChangePassword instance) =>
    <String, dynamic>{
      'password': instance.oldPass,
      'newPassword': instance.newPass,
    };

ParamForgotPassword _$ParamForgotPasswordFromJson(Map<String, dynamic> json) =>
    ParamForgotPassword(
      email: json['email'] as String,
    );

Map<String, dynamic> _$ParamForgotPasswordToJson(
        ParamForgotPassword instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

ParamResetPassword _$ParamResetPasswordFromJson(Map<String, dynamic> json) =>
    ParamResetPassword(
      json['password'] as String,
      json['newPassword'] as String,
    );

Map<String, dynamic> _$ParamResetPasswordToJson(ParamResetPassword instance) =>
    <String, dynamic>{
      'password': instance.password,
      'newPassword': instance.newPass,
    };
