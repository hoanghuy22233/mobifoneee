import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
// import 'package:mobifone/src/models/index.dart';
import 'package:mobifone/src/models/model_generator/base_response.dart';
part 'change_info.g.dart';

@JsonSerializable()
class DataChangeInfo {
  final int? id,gender;
  final String? name,fullname,email,date_or_birth,avatar,phone,address;

  const DataChangeInfo({
    this.id,
    this.gender, this.fullname, this.email,
    this.date_or_birth, this.avatar,
    this.phone, this.address,
    this.name,
  });
  factory DataChangeInfo.fromJson(Map<String, dynamic> json) => _$DataChangeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$DataChangeInfoToJson(this);
}

@JsonSerializable()
class ChangeInfo {
  final int? status;
  final String? message;
  final DataChangeInfo? data;

  const ChangeInfo( {
    this.status,
    this.data,
    this.message,
  });
  factory ChangeInfo.fromJson(Map<String, dynamic> json) => _$ChangeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeInfoToJson(this);
}