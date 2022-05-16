
import 'package:json_annotation/json_annotation.dart';
// import 'package:mobifone/src/models/index.dart';
import 'package:mobifone/src/models/model_generator/base_response.dart';
part 'login.g.dart';

@JsonSerializable()
class LoginData {
  final int? id,gender;
  final String? name,fullname,email,date_or_birth,avatar,phone,address;

  const LoginData(
      {this.id,
      this.name,
      this.avatar,
      this.phone,
      this.email,
      this.fullname,
      this.address,
      this.gender,
      this.date_or_birth});

  factory LoginData.fromJson(Map<String, dynamic> json) => _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}

@JsonSerializable()
class LoginResponse extends BaseResponse {
  final LoginData? data;
  final String? token;
  @JsonKey(name: "token_type")
  final String ?tokenType;


  LoginResponse(this.data,this.tokenType,this.token);

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

