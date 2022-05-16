// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
      id: json['id'] as int?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      fullname: json['fullname'] as String?,
      address: json['address'] as String?,
      gender: json['gender'] as int?,
      date_or_birth: json['date_or_birth'] as String?,
    );

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
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

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      json['data'] == null
          ? null
          : LoginData.fromJson(json['data'] as Map<String, dynamic>),
      json['token_type'] as String?,
      json['token'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'token': instance.token,
      'token_type': instance.token_type,
    };
