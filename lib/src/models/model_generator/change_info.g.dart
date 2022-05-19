// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataChangeInfo _$DataChangeInfoFromJson(Map<String, dynamic> json) =>
    DataChangeInfo(
      id: json['id'] as int?,
      gender: json['gender'] as int?,
      fullname: json['fullname'] as String?,
      email: json['email'] as String?,
      date_or_birth: json['date_or_birth'] as String?,
      avatar: json['avatar'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$DataChangeInfoToJson(DataChangeInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'gender': instance.gender,
      'name': instance.name,
      'fullname': instance.fullname,
      'email': instance.email,
      'date_or_birth': instance.date_or_birth,
      'avatar': instance.avatar,
      'phone': instance.phone,
      'address': instance.address,
    };

ChangeInfo _$ChangeInfoFromJson(Map<String, dynamic> json) => ChangeInfo(
      status: json['status'] as int?,
      data: json['data'] == null
          ? null
          : DataChangeInfo.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ChangeInfoToJson(ChangeInfo instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
