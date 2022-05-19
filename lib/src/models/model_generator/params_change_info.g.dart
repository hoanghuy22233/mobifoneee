// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'params_change_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParamChangeInfo _$ParamChangeInfoFromJson(Map<String, dynamic> json) =>
    ParamChangeInfo(
      phone: json['phone'] as String,
      email: json['email'] as String,
      fullname: json['fullname'] as String,
      date_or_birth: json['date_or_birth'] as String,
    );

Map<String, dynamic> _$ParamChangeInfoToJson(ParamChangeInfo instance) =>
    <String, dynamic>{
      'fullname': instance.fullname,
      'phone': instance.phone,
      'email': instance.email,
      'date_or_birth': instance.date_or_birth,
    };

ParamChangeInfoNotImage _$ParamChangeInfoNotImageFromJson(
        Map<String, dynamic> json) =>
    ParamChangeInfoNotImage(
      id: json['id'] as int,
      userCode: json['user_code'] as String,
      fullname: json['fullname'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$ParamChangeInfoNotImageToJson(
        ParamChangeInfoNotImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_code': instance.userCode,
      'fullname': instance.fullname,
      'phone': instance.phone,
      'email': instance.email,
      'gender': instance.gender,
      'address': instance.address,
    };
