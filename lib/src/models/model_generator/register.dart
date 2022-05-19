import 'package:json_annotation/json_annotation.dart';
import 'package:mobifone/src/models/model_generator/base_response.dart';
import 'package:mobifone/src/models/model_generator/main_response.dart';

part 'register.g.dart';

@JsonSerializable()
class InfoData {
  final int? id;
  final int? gender;
  final String? name,fullname,phone,email;
  final String? address,date_or_birth,avatar;

  const InfoData(
      {this.id,
        this.gender, this.phone,
        this.name, this.fullname, this.email,
        this.address,
        this.date_or_birth, this.avatar, });

  factory InfoData.fromJson(Map<String, dynamic> json) => _$InfoDataFromJson(json);

  Map<String, dynamic> toJson() => _$InfoDataToJson(this);
}

@JsonSerializable()
class RegisterResponse {
  final int? status;
  final String? message;
  final String? token,token_type;
  final InfoData? data;

  const RegisterResponse(
      {this.status,
        this.message, this.token,
        this.token_type, this.data,  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}