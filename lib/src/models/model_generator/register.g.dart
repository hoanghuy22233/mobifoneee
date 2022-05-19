// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoData _$InfoDataFromJson(Map<String, dynamic> json) => InfoData(
      id: json['id'] as int?,
      gender: json['gender'] as int?,
      phone: json['phone'] as String?,
      name: json['name'] as String?,
      fullname: json['fullname'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      date_or_birth: json['date_or_birth'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$InfoDataToJson(InfoData instance) => <String, dynamic>{
      'id': instance.id,
      'gender': instance.gender,
      'name': instance.name,
      'fullname': instance.fullname,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'date_or_birth': instance.date_or_birth,
      'avatar': instance.avatar,
    };

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      token: json['token'] as String?,
      token_type: json['token_type'] as String?,
      data: json['data'] == null
          ? null
          : InfoData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'token_type': instance.token_type,
      'data': instance.data,
    };
